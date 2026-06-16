import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/core/routes/app_routes.dart';
import 'package:ecodcf/core/providers/preferences_provider.dart';
import 'package:ecodcf/features/dashboard/presentation/bloc/dashboard_notifier.dart';
import 'package:ecodcf/features/dashboard/domain/entities/dashboard_stats.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(dashboardProvider);
    final prefsAsync = ref.watch(userPreferencesProvider);
    final stats = dashboardAsync.maybeWhen(
      data: (data) => data,
      orElse: () => const DashboardStats(),
    );

    final userName = prefsAsync.maybeWhen(
      data: (prefs) => prefs.userName ?? 'Eco Guardian',
      orElse: () => 'Eco Guardian',
    );

    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
      ),
      body: Skeletonizer(
        enabled: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.forestGreen,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userName,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  GestureDetector(
                    onTap: () => _showEditNameDialog(context, ref, userName),
                    child: const Icon(Icons.edit, size: 20, color: AppColors.forestGreen),
                  ),
                ],
              ),
              Text(
                'Digital Sustainability Expert',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.grey600),
              ),
              const SizedBox(height: AppSpacing.xl),
              _ProfileStats(
                co2Saved: stats.totalCarbon,
                level: (stats.dscore / 25).toInt(),
                xp: stats.challengesCompleted * 100,
              ),
              const SizedBox(height: AppSpacing.xl),
              const _BadgesSection(),
              const SizedBox(height: AppSpacing.xl),
              _buildProfileOption(context, Icons.grid_on, 'My Badges', 'View all your achievements'),
              _buildProfileOption(context, Icons.history, 'Activity History', 'Track your digital footprint'),
              _buildProfileOption(context, Icons.share, 'Share Impact', 'Spread eco awareness'),
              _buildProfileOption(context, Icons.settings, 'Account Settings', 'Privacy, security, preferences'),
            ],
          ),
        ),
      ),
    );
  }

  void _showEditNameDialog(BuildContext context, WidgetRef ref, String currentName) {
    final controller = TextEditingController(text: currentName);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Name'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Enter your name'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                ref.read(userPreferencesProvider.notifier).updateName(controller.text);
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, IconData icon, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: ListTile(
        leading: Icon(icon, color: AppColors.forestGreen),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          switch (title) {
            case 'My Badges':
              Navigator.pushNamed(context, AppRoutes.badges);
              break;
            case 'Activity History':
              Navigator.pushNamed(context, AppRoutes.activityHistory);
              break;
            case 'Share Impact':
              _showShareDialog(context);
              break;
            case 'Account Settings':
              Navigator.pushNamed(context, AppRoutes.settings);
              break;
          }
        },
      ),
    );
  }

  void _showShareDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Share Your Impact'),
        content: const Text('Share your digital sustainability achievements with friends and family.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: const Text('Share')),
        ],
      ),
    );
  }
}

class _ProfileStats extends StatelessWidget {
  final double co2Saved;
  final int level;
  final int xp;

  const _ProfileStats({required this.co2Saved, required this.level, required this.xp});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _StatItem(label: 'CO₂ Saved', value: '${co2Saved.toStringAsFixed(1)}kg'),
        _StatItem(label: 'Level', value: level.toString()),
        _StatItem(label: 'XP', value: xp.toString()),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.forestGreen),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: AppColors.grey600),
        ),
      ],
    );
  }
}

class _BadgesSection extends StatelessWidget {
  const _BadgesSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recent Badges', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _BadgeItem(icon: Icons.emoji_events, label: 'Challenge Master'),
              const SizedBox(width: AppSpacing.md),
              _BadgeItem(icon: Icons.local_florist, label: 'Green Thumb'),
              const SizedBox(width: AppSpacing.md),
              _BadgeItem(icon: Icons.speed, label: 'Power Saver'),
              const SizedBox(width: AppSpacing.md),
              _BadgeItem(icon: Icons.water, label: 'Eco Warrior'),
            ],
          ),
        ),
      ],
    );
  }
}

class _BadgeItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _BadgeItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.forestGreen.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.forestGreen, size: 28),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 10), textAlign: TextAlign.center),
      ],
    );
  }
}

