import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/core/utils/carbon_calculator.dart';
import 'package:ecodcf/features/carbon/providers/carbon_providers.dart';
import 'package:ecodcf/features/dashboard/presentation/bloc/dashboard_notifier.dart';

class QuickLogBottomSheet extends ConsumerWidget {
  const QuickLogBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.xl),
      decoration: const BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quick Log Activity',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Common digital actions and their typical footprint',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.grey600),
          ),
          const SizedBox(height: AppSpacing.xl),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: AppSpacing.md,
            crossAxisSpacing: AppSpacing.md,
            childAspectRatio: 2.5,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _QuickLogItem(
                label: '10 Searches',
                icon: Icons.search,
                color: Colors.blue,
                onTap: () async {
                  await _log(ref, context, 'Search', 10);
                },
              ),
              _QuickLogItem(
                label: '5 Emails',
                icon: Icons.email_outlined,
                color: Colors.amber,
                onTap: () async {
                  await _log(ref, context, 'Email', 5);
                },
              ),
              _QuickLogItem(
                label: '1h Streaming',
                icon: Icons.play_circle_outline,
                color: Colors.red,
                onTap: () async {
                  await _log(ref, context, 'Video Streaming', 1);
                },
              ),
              _QuickLogItem(
                label: '30m Social',
                icon: Icons.share_outlined,
                color: Colors.purple,
                onTap: () async {
                  await _log(ref, context, 'Social Media', 0.5);
                },
              ),
              _QuickLogItem(
                label: '1GB Cloud',
                icon: Icons.cloud_outlined,
                color: Colors.cyan,
                onTap: () async {
                  await _log(ref, context, 'Cloud Storage', 1);
                },
              ),
              _QuickLogItem(
                label: '1h Video Call',
                icon: Icons.videocam_outlined,
                color: Colors.green,
                onTap: () async {
                  await _log(ref, context, 'Video Call', 1);
                },
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }

  Future<void> _log(WidgetRef ref, BuildContext context, String type, double value) async {
    unawaited(HapticFeedback.mediumImpact());
    final repo = await ref.read(carbonRepositoryProvider.future);
    
    final record = switch (type) {
      'Email' => CarbonCalculator.calculateEmail(count: value.toInt(), hasAttachment: false),
      'Search' => CarbonCalculator.calculateSearch(searchCount: value.toInt()),
      'Cloud Storage' => CarbonCalculator.calculateCloudStorage(gbStored: value, gbTransferred: value),
      'Social Media' => CarbonCalculator.calculateSocialMedia(hours: value, posts: 0),
      'Video Streaming' => CarbonCalculator.calculateStreaming(hours: value, quality: 'HD'),
      'Video Call' => CarbonCalculator.calculateVideoCall(hours: value, quality: 'HD'),
      _ => CarbonCalculator.calculateDeviceEnergy(watts: 10, hours: value),
    };

    await repo.saveRecord(record);
    await ref.read(dashboardProvider.notifier).refresh();
    
    if (context.mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Logged ${record.carbonValue.toStringAsFixed(3)} kg CO₂e for $type'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.forestGreen,
        ),
      );
    }
  }
}

class _QuickLogItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _QuickLogItem({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color.withValues(alpha: 0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
