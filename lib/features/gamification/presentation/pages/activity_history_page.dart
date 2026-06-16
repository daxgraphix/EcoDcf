import 'package:flutter/material.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/features/gamification/domain/entities/challenge.dart';

class ActivityHistoryPage extends StatelessWidget {
  const ActivityHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = _getMockActivities();

    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(
            title: Text('Activity History'),
            floating: true,
            pinned: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.md),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final activity = activities[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: _ActivityTile(activity: activity),
                  );
                },
                childCount: activities.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Activity> _getMockActivities() {
    return [
      Activity(
        id: 'a1',
        title: 'Completed: Dark Mode Warrior',
        description: '+150 XP',
        icon: 'dark_mode',
        timestamp: DateTime(2024, 3, 15, 10, 30),
        type: ActivityType.challenge,
      ),
      Activity(
        id: 'a2',
        title: 'Unlocked: Eco Warrior Badge',
        description: 'Reduce carbon by 10kg',
        icon: 'leaf',
        timestamp: DateTime(2024, 3, 14, 18, 45),
        type: ActivityType.badge,
      ),
      Activity(
        id: 'a3',
        title: 'Completed: Lesson 3',
        description: 'AI Power Surge',
        icon: 'school',
        timestamp: DateTime(2024, 3, 14, 9, 15),
        type: ActivityType.lesson,
      ),
      Activity(
        id: 'a4',
        title: 'Submitted: Cloud Cleanup',
        description: 'Deleted 5GB storage',
        icon: 'cloud_delete',
        timestamp: DateTime(2024, 3, 13, 22, 0),
        type: ActivityType.challenge,
      ),
      Activity(
        id: 'a5',
        title: 'Earned: Digital Minimalist',
        description: '+250 XP',
        icon: 'filter_center_focus',
        timestamp: DateTime(2024, 3, 10, 16, 20),
        type: ActivityType.challenge,
      ),
    ];
  }
}

class Activity {
  final String id;
  final String title;
  final String description;
  final String icon;
  final DateTime timestamp;
  final ActivityType type;

  const Activity({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.timestamp,
    required this.type,
  });
}

enum ActivityType { challenge, badge, lesson, other }

class _ActivityTile extends StatelessWidget {
  final Activity activity;
  const _ActivityTile({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.forestGreen.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Icon(
            _getIconData(activity.icon),
            color: AppColors.forestGreen,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                activity.title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                activity.description,
                style: const TextStyle(color: AppColors.grey600, fontSize: 12),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              _formatTime(activity.timestamp),
              style: const TextStyle(color: AppColors.grey500, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }

  String _formatTime(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);

    if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}h ago';
    } else {
      return '${diff.inDays}d ago';
    }
  }

  IconData _getIconData(String icon) {
    switch (icon) {
      case 'dark_mode':
        return Icons.dark_mode;
      case 'leaf':
        return Icons.local_florist;
      case 'school':
        return Icons.school;
      case 'cloud_delete':
        return Icons.delete;
      case 'filter_center_focus':
        return Icons.filter_center_focus;
      default:
        return Icons.star;
    }
  }
}