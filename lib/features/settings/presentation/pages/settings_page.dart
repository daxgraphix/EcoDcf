import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/core/services/permissions/accessibility_service.dart';
import 'package:ecodcf/core/services/permissions/permission_service.dart';
import 'package:ecodcf/core/routes/app_routes.dart';
import 'package:ecodcf/core/providers/app_provider.dart';
import 'package:ecodcf/core/providers/preferences_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          _SettingsSection(
            title: 'Account',
            items: [
              _SettingsItem(icon: Icons.person, title: 'Profile', onTap: () {}),
              _SettingsItem(icon: Icons.notifications, title: 'Notifications', onTap: () {}),
              _SettingsItem(
                icon: Icons.security,
                title: 'Privacy & Security',
                onTap: () => context.go('${AppRoutes.settings}/${AppRoutes.privacyCenter.replaceAll("/", "")}'),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          _SettingsSection(
            title: 'Accessibility',
            items: [
              _SettingsItem(icon: Icons.text_format, title: 'Font Size', onTap: () => _showFontSizeDialog(context, ref)),
              _SettingsItem(icon: Icons.contrast, title: 'High Contrast', onTap: () => _toggleHighContrast(context, ref)),
              _SettingsItem(icon: Icons.animation, title: 'Reduce Motion', onTap: () => _toggleReduceMotion(context, ref)),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          _SettingsSection(
            title: 'Carbon Tracking',
            items: [
              _SettingsItem(icon: Icons.devices, title: 'Device Tracking', onTap: () => _requestPermissions(context, ref)),
              _SettingsItem(icon: Icons.cloud, title: 'Cloud Sync', onTap: () {}),
              _SettingsItem(icon: Icons.sync, title: 'Auto Sync', onTap: () {}),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          _SettingsSection(
            title: 'App',
            items: [
              _SettingsItem(
                icon: Icons.dark_mode,
                title: 'Dark Mode',
                trailing: Switch(
                  value: ref.watch(appThemeProvider) == 'dark',
                  onChanged: (value) {
                    ref.read(userPreferencesProvider.notifier).updateTheme(value ? 'dark' : 'light');
                  },
                ),
                onTap: () {
                  final current = ref.read(appThemeProvider);
                  ref.read(userPreferencesProvider.notifier).updateTheme(current == 'dark' ? 'light' : 'dark');
                },
              ),
              _SettingsItem(icon: Icons.notifications_active, title: 'Reminders', onTap: () {}),
              _SettingsItem(icon: Icons.info, title: 'About', onTap: () {}),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          SizedBox(
            height: 44,
            child: TextButton(
              onPressed: () {},
              child: const Text('Log Out', style: TextStyle(color: AppColors.error)),
            ),
          ),
        ],
      ),
    );
  }

  void _showFontSizeDialog(BuildContext context, WidgetRef ref) {
    final service = AccessibilityService();
    showDialog(
      context: context,
      builder: (context) => FutureBuilder<double>(
        future: service.getFontSizeScale(),
        builder: (context, snapshot) {
          final currentScale = snapshot.data ?? 1.0;
          return AlertDialog(
            title: const Text('Font Size Scale'),
            content: Slider(
              value: currentScale,
              min: 0.8,
              max: 2.0,
              divisions: 12,
              onChanged: (value) async {
                await service.setFontSizeScale(value);
              },
            ),
            actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
          );
        },
      ),
    );
  }

  Future<void> _toggleHighContrast(BuildContext context, WidgetRef ref) async {
    final service = AccessibilityService();
    final current = await service.getHighContrast();
    await service.setHighContrast(!current);
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(!current ? 'High contrast enabled' : 'High contrast disabled')),
      );
    }
  }

  Future<void> _toggleReduceMotion(BuildContext context, WidgetRef ref) async {
    final service = AccessibilityService();
    final current = await service.getReduceMotion();
    await service.setReduceMotion(!current);
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(!current ? 'Reduce motion enabled' : 'Reduce motion disabled')),
      );
    }
  }

  Future<void> _requestPermissions(BuildContext context, WidgetRef ref) async {
    final service = PermissionService();
    final granted = await service.requestNotificationPermission();
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(granted ? 'Notification permission granted' : 'Permission denied')),
      );
    }
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const _SettingsSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: AppSpacing.md),
        ...items,
      ],
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Widget? trailing;

  const _SettingsItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.forestGreen),
      title: Text(title),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
