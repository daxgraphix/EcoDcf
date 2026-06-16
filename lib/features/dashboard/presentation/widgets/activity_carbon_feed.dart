import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/features/carbon/domain/entities/carbon_record.dart';
import 'package:ecodcf/features/carbon/providers/carbon_providers.dart';
import 'package:ecodcf/features/carbon/presentation/pages/carbon_history_page.dart';
import 'package:intl/intl.dart';

class ActivityCarbonFeed extends ConsumerWidget {
  const ActivityCarbonFeed({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordsAsync = ref.watch(recentRecordsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Activity',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CarbonHistoryPage()),
                );
              },
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        recordsAsync.when(
          data: (records) {
            if (records.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.xl),
                  child: Text('No recent activity recorded.'),
                ),
              );
            }
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: records.length,
              separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.sm),
              itemBuilder: (context, index) {
                final record = records[index];
                return _ActivityItem(record: record);
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Text('Error loading activities: $err'),
        ),
      ],
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final CarbonRecord record;

  const _ActivityItem({required this.record});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: _getCategoryColor(record.type).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getCategoryIcon(record.type),
              color: _getCategoryColor(record.type),
              size: 20,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  record.type.replaceAll('_', ' ').toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  DateFormat.jm().format(record.createdAt),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.grey600,
                      ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${record.carbonValue.toStringAsFixed(3)} kg',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.forestGreen,
                ),
              ),
              const Text(
                'CO2e',
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.grey600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String type) {
    switch (type.toLowerCase()) {
      case 'email': return Icons.email_outlined;
      case 'search': return Icons.search;
      case 'ai_search': return Icons.auto_awesome;
      case 'video_streaming': return Icons.play_circle_outline;
      case 'social_media': return Icons.share;
      default: return Icons.eco_outlined;
    }
  }

  Color _getCategoryColor(String type) {
    switch (type.toLowerCase()) {
      case 'email': return AppColors.forestGreen;
      case 'search': return AppColors.leafGreen;
      case 'ai_search': return AppColors.sageGreen;
      case 'video_streaming': return AppColors.emeraldGreen;
      case 'social_media': return AppColors.mintGreen;
      default: return AppColors.forestGreen;
    }
  }
}
