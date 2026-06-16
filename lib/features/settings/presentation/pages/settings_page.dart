import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/core/routes/app_routes.dart';
import 'package:ecodcf/core/providers/preferences_provider.dart';
import 'package:ecodcf/core/database/isar/models/user_preferences_model.dart';
import 'package:flutter/services.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefsAsync = ref.watch(userPreferencesProvider);

    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: prefsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (prefs) => _buildSettingsList(context, ref, prefs),
      ),
    );
  }

  Widget _buildSettingsList(BuildContext context, WidgetRef ref, UserPreferencesModel prefs) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        _buildSectionHeader('Account & Security'),
        _buildCard([
          _SettingsTile(
            icon: Icons.person_outline,
            title: 'Profile Name',
            subtitle: prefs.userName ?? 'Not set',
            onTap: () => _showNameDialog(context, ref, prefs.userName),
          ),
          _SettingsTile(
            icon: Icons.notifications_none,
            title: 'Push Notifications',
            subtitle: 'Critical alerts and updates',
            trailing: Switch(
              value: prefs.notificationsEnabled,
              onChanged: (val) {
                HapticFeedback.lightImpact();
                ref.read(userPreferencesProvider.notifier).updateNotifications(val);
              },
            ),
          ),
          _SettingsTile(
            icon: Icons.alarm,
            title: 'Daily Reminders',
            subtitle: 'Keep your tracking consistent',
            trailing: Switch(
              value: prefs.remindersEnabled,
              onChanged: (val) {
                HapticFeedback.lightImpact();
                ref.read(userPreferencesProvider.notifier).updateNotifications(prefs.notificationsEnabled, reminders: val);
              },
            ),
          ),
          _SettingsTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Center',
            subtitle: 'Data usage and permissions',
            onTap: () => context.push('${AppRoutes.settings}/${AppRoutes.privacyCenter.replaceAll("/", "")}'),
          ),
        ]),
        const SizedBox(height: AppSpacing.lg),
        _buildSectionHeader('Experience'),
        _buildCard([
          _SettingsTile(
            icon: Icons.text_fields,
            title: 'Text Size',
            subtitle: '${(prefs.fontSizeScale * 100).toInt()}%',
            onTap: () => _showFontSizeDialog(context, ref, prefs.fontSizeScale),
          ),
          _SettingsTile(
            icon: Icons.contrast,
            title: 'High Contrast',
            subtitle: 'Increase visibility of UI elements',
            trailing: Switch(
              value: prefs.highContrastEnabled,
              onChanged: (val) {
                HapticFeedback.lightImpact();
                ref.read(userPreferencesProvider.notifier).updateAccessibility(highContrast: val);
              },
            ),
          ),
          _SettingsTile(
            icon: Icons.animation,
            title: 'Reduce Motion',
            subtitle: 'Minimize animations and transitions',
            trailing: Switch(
              value: prefs.reduceMotionEnabled,
              onChanged: (val) {
                HapticFeedback.lightImpact();
                ref.read(userPreferencesProvider.notifier).updateAccessibility(reduceMotion: val);
              },
            ),
          ),
        ]),
        const SizedBox(height: AppSpacing.lg),
        _buildSectionHeader('Data & Connectivity'),
        _buildCard([
          _SettingsTile(
            icon: Icons.phonelink_setup,
            title: 'Device Tracking',
            subtitle: 'Auto-calculate hardware emissions',
            trailing: Switch(
              value: prefs.deviceTrackingEnabled,
              onChanged: (val) {
                HapticFeedback.lightImpact();
                ref.read(userPreferencesProvider.notifier).updateCarbonTracking(deviceTracking: val);
              },
            ),
          ),
          _SettingsTile(
            icon: Icons.sync,
            title: 'Cloud Synchronization',
            subtitle: 'Keep records safe across devices',
            trailing: Switch(
              value: prefs.cloudSyncEnabled,
              onChanged: (val) {
                HapticFeedback.lightImpact();
                ref.read(userPreferencesProvider.notifier).updateCarbonTracking(cloudSync: val);
              },
            ),
          ),
          _SettingsTile(
            icon: Icons.backup_outlined,
            title: 'Export Data',
            subtitle: 'Download your history as JSON/CSV',
            onTap: () {
               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Exporting data...')));
            },
          ),
        ]),
        const SizedBox(height: AppSpacing.lg),
        _buildSectionHeader('Information'),
        _buildCard([
          _SettingsTile(
            icon: Icons.info_outline,
            title: 'About EcoDcf',
            subtitle: 'Version 1.0.0',
            onTap: () => _showAboutDialog(context),
          ),
        ]),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.grey600,
          fontWeight: FontWeight.bold,
          fontSize: 13,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
      color: Colors.white,
      child: Column(children: children),
    );
  }

  void _showNameDialog(BuildContext context, WidgetRef ref, String? currentName) {
    final controller = TextEditingController(text: currentName);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Profile Name'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Display Name'),
          autofocus: true,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                HapticFeedback.lightImpact();
                ref.read(userPreferencesProvider.notifier).updateName(controller.text.trim());
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showFontSizeDialog(BuildContext context, WidgetRef ref, double currentScale) {
    double scale = currentScale;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Text Size'),
        content: StatefulBuilder(
          builder: (context, setState) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${(scale * 100).toInt()}%', style: TextStyle(fontSize: 16 * scale)),
              const SizedBox(height: 16),
              Slider(
                value: scale,
                min: 0.8,
                max: 1.5,
                divisions: 7,
                onChanged: (value) => setState(() => scale = value),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              HapticFeedback.lightImpact();
              ref.read(userPreferencesProvider.notifier).updateAccessibility(fontSizeScale: scale);
              Navigator.pop(context);
            },
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'EcoDcf',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(Icons.co2, color: AppColors.forestGreen, size: 48),
      children: [
        const Text('EcoDcf: Digital Carbon Footprint Intelligence'),
        const SizedBox(height: 12),
        const Text('Dedicated to helping individuals understand and reduce their digital environmental impact.'),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Widget? trailing;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(AppSpacing.xs),
        decoration: BoxDecoration(
          color: AppColors.forestGreen.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
        child: Icon(icon, color: AppColors.forestGreen, size: 22),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
      subtitle: subtitle != null ? Text(subtitle!, style: const TextStyle(fontSize: 12)) : null,
      trailing: trailing ?? (onTap != null ? const Icon(Icons.chevron_right, size: 18) : null),
      onTap: onTap,
    );
  }
}
