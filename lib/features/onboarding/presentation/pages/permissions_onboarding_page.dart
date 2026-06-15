import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/features/settings/presentation/bloc/settings_providers.dart';
import 'package:go_router/go_router.dart';

class PermissionsOnboardingPage extends ConsumerWidget {
  const PermissionsOnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.forestGreen,
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enable Permissions',
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppSpacing.lg),
            const Text(
              'Grant permissions to track your device usage and calculate your digital carbon footprint.',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: AppSpacing.xl),
            _PermissionTile(
              icon: Icons.analytics,
              title: 'Usage Access',
              description: 'Track app usage and screen time',
              onTap: () => _requestUsageAccess(context),
            ),
            const SizedBox(height: AppSpacing.md),
            _PermissionTile(
              icon: Icons.notifications,
              title: 'Notifications',
              description: 'Send eco-friendly reminders',
              onTap: () => _requestNotifications(context, ref),
            ),
            const SizedBox(height: AppSpacing.md),
            _PermissionTile(
              icon: Icons.battery_std,
              title: 'Battery Optimization',
              description: 'Monitor battery usage',
              onTap: () => _requestBatteryOpt(context),
            ),
            const SizedBox(height: AppSpacing.xl),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.go('/main'),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.ecoBlue),
                child: const Text('Skip for Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _requestUsageAccess(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Usage Access'),
        content: const Text('Please grant usage access in Settings to track your screen time.'),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
      ),
    );
  }

  Future<void> _requestNotifications(BuildContext context, WidgetRef ref) async {
    final service = ref.read(permissionServiceProvider);
    final granted = await service.requestNotificationPermission();
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(granted ? 'Granted' : 'Denied')),
      );
    }
  }

  void _requestBatteryOpt(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Battery Optimization'),
        content: const Text('Please disable battery optimization for this app to get accurate readings.'),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
      ),
    );
  }
}

class _PermissionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _PermissionTile({required this.icon, required this.title, required this.description, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: Text(description, style: const TextStyle(color: Colors.white70)),
      trailing: const Icon(Icons.chevron_right, color: Colors.white),
      onTap: onTap,
    );
  }
}
