import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/core/routes/app_routes.dart';
import 'package:ecodcf/core/providers/preferences_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefsAsync = ref.watch(userPreferencesProvider);

    return prefsAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) => Scaffold(body: Center(child: Text('Error: $err'))),
      data: (prefs) => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: const Text('Settings'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            _SettingsSection(
              title: 'Account',
              items: [
                _SettingsItem(
                  icon: Icons.person,
                  title: 'Profile',
                  subtitle: prefs.userName ?? 'Set up your name',
                  onTap: () => _showNameDialog(context, ref, prefs.userName),
                ),
                _SettingsItem(
                  icon: Icons.notifications,
                  title: 'Notifications',
                  trailing: Switch(
                    value: prefs.notificationsEnabled,
                    onChanged: (val) => ref.read(userPreferencesProvider.notifier).updateNotifications(val),
                  ),
                  onTap: () => ref.read(userPreferencesProvider.notifier).updateNotifications(prefs.notificationsEnabled),
                ),
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
                _SettingsItem(
                  icon: Icons.text_format,
                  title: 'Font Size',
                  subtitle: '${(prefs.fontSizeScale * 100).toInt()}%',
                  onTap: () => _showFontSizeDialog(context, ref, prefs.fontSizeScale),
                ),
                _SettingsItem(
                  icon: Icons.contrast,
                  title: 'High Contrast',
                  trailing: Switch(
                    value: prefs.highContrastEnabled,
                    onChanged: (val) => ref.read(userPreferencesProvider.notifier).updateAccessibility(highContrast: val),
                  ),
                  onTap: () {},
                ),
                _SettingsItem(
                  icon: Icons.animation,
                  title: 'Reduce Motion',
                  trailing: Switch(
                    value: prefs.reduceMotionEnabled,
                    onChanged: (val) => ref.read(userPreferencesProvider.notifier).updateAccessibility(reduceMotion: val),
                  ),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            _SettingsSection(
              title: 'Carbon Tracking',
              items: [
                _SettingsItem(
                  icon: Icons.devices,
                  title: 'Device Tracking',
                  subtitle: 'Monitor hardware emissions',
                  trailing: Switch(
                    value: prefs.deviceTrackingEnabled,
                    onChanged: (val) => ref.read(userPreferencesProvider.notifier).updateCarbonTracking(deviceTracking: val),
                  ),
                  onTap: () {},
                ),
                _SettingsItem(
                  icon: Icons.cloud,
                  title: 'Cloud Sync',
                  trailing: Switch(
                    value: prefs.cloudSyncEnabled,
                    onChanged: (val) => ref.read(userPreferencesProvider.notifier).updateCarbonTracking(cloudSync: val),
                  ),
                  onTap: () {},
                ),
                _SettingsItem(
                  icon: Icons.sync,
                  title: 'Auto Sync',
                  trailing: Switch(
                    value: prefs.autoSyncEnabled,
                    onChanged: (val) => ref.read(userPreferencesProvider.notifier).updateCarbonTracking(autoSync: val),
                  ),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            _SettingsSection(
              title: 'App',
              items: [
                _SettingsItem(icon: Icons.notifications_active, title: 'Reminders', subtitle: 'Daily tips & challenges', onTap: () => _showRemindersDialog(context, ref)),
                _SettingsItem(icon: Icons.info, title: 'About', subtitle: 'Version 1.0.0', onTap: () => _showAboutDialog(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showNameDialog(BuildContext context, WidgetRef ref, String? currentName) {
    final controller = TextEditingController(text: currentName);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Name'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: "Enter your name"),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              ref.read(userPreferencesProvider.notifier).updateName(controller.text);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showFontSizeDialog(BuildContext context, WidgetRef ref, double currentScale) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Font Size Scale'),
        content: StatefulBuilder(
          builder: (context, setState) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${(currentScale * 100).toInt()}%', style: TextStyle(fontSize: 16 * currentScale)),
              Slider(
                value: currentScale,
                min: 0.8,
                max: 1.5,
                divisions: 7,
                onChanged: (value) {
                  setState(() => currentScale = value);
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              ref.read(userPreferencesProvider.notifier).updateAccessibility(fontSizeScale: currentScale);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showRemindersDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Daily Reminders'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Morning Tip'),
              subtitle: Text('Daily sustainability tip at 9 AM'),
              trailing: Switch(value: true, onChanged: null),
            ),
            ListTile(
              title: Text('Weekly Report'),
              subtitle: Text('Your carbon footprint summary'),
              trailing: Switch(value: false, onChanged: null),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Done')),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('EcoDcf'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Version: 1.0.0'),
            SizedBox(height: 8),
            Text('Digital Carbon Intelligence'),
            SizedBox(height: 8),
            Text('© 2026 EcoDcf Team'),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
        ],
      ),
    );
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
  final String? subtitle;
  final VoidCallback onTap;
  final Widget? trailing;

  const _SettingsItem({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.forestGreen),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: trailing ?? const Icon(Icons.chevron_right, size: 20),
      onTap: onTap,
    );
  }
}
