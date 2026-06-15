import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // In a real app, we would watch a profile provider. 
    // Here we simulate a loading state for 1 second for the demo.
    const isLoading = false; // Set to true if watching a future/stream

    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
      ),
      body: Skeletonizer(
        enabled: isLoading,
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
              Text(
                'Eco Guardian',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'Digital Sustainability Expert',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.grey600),
              ),
              const SizedBox(height: AppSpacing.xl),
              const _ProfileStats(),
              const SizedBox(height: AppSpacing.xl),
              _buildProfileOption(context, Icons.badge, 'My Badges', '12 Unlocked'),
              _buildProfileOption(context, Icons.history, 'Activity History', 'View recent tracking'),
              _buildProfileOption(context, Icons.share, 'Share Impact', 'Tell others about your score'),
            ],
          ),
        ),
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
        onTap: () {},
      ),
    );
  }
}

class _ProfileStats extends StatelessWidget {
  const _ProfileStats();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _StatItem(label: 'CO₂ Saved', value: '42.5kg'),
        _StatItem(label: 'Level', value: '3'),
        _StatItem(label: 'XP', value: '2,450'),
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

