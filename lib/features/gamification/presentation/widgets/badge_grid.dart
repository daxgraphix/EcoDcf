import 'package:flutter/material.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/features/gamification/domain/entities/challenge.dart';

class BadgeGrid extends StatelessWidget {
  const BadgeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final badges = _getMockBadges();
    final unlockedCount = badges.where((b) => b.isUnlocked).length;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.forestGreen.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.grade, color: AppColors.forestGreen),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Your Badges',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            '$unlockedCount unlocked badges',
            style: const TextStyle(color: AppColors.grey600),
          ),
          const SizedBox(height: AppSpacing.md),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: AppSpacing.sm,
              crossAxisSpacing: AppSpacing.sm,
            ),
            itemCount: badges.length,
            itemBuilder: (context, index) {
              final badge = badges[index];
              return _BadgeIcon(badge: badge);
            },
          ),
        ],
      ),
    );
  }

  List<GamificationBadge> _getMockBadges() {
    return const [
      GamificationBadge(
        id: 'b1',
        title: 'First Steps',
        description: 'Complete your first lesson',
        icon: 'rocket_launch',
        xpRequired: 100,
        isUnlocked: true,
      ),
      GamificationBadge(
        id: 'b2',
        title: 'Eco Warrior',
        description: 'Reduce carbon by 10kg',
        icon: 'leaf',
        xpRequired: 500,
        isUnlocked: true,
      ),
      GamificationBadge(
        id: 'b3',
        title: 'Digital Minimalist',
        description: 'Complete 5 lessons',
        icon: 'filter_center_focus',
        xpRequired: 1000,
        isUnlocked: false,
      ),
      GamificationBadge(
        id: 'b4',
        title: 'Carbon Neutral',
        description: 'Achieve negative footprint',
        icon: 'cloud_update',
        xpRequired: 2000,
        isUnlocked: false,
      ),
    ];
  }
}

class _BadgeIcon extends StatelessWidget {
  final GamificationBadge badge;
  const _BadgeIcon({required this.badge});

  @override
  Widget build(BuildContext context) {
    final isUnlocked = badge.isUnlocked;

    return Opacity(
      opacity: isUnlocked ? 1.0 : 0.3,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isUnlocked
                  ? AppColors.forestGreen.withValues(alpha: 0.1)
                  : AppColors.grey200,
              shape: BoxShape.circle,
              border: Border.all(
                color: isUnlocked ? AppColors.forestGreen : AppColors.grey300,
                width: 1.5,
              ),
            ),
            child: Icon(
              _getIconData(badge.icon),
              color: isUnlocked ? AppColors.forestGreen : AppColors.grey400,
              size: 20,
            ),
          ),
          const SizedBox(height: 2),
          SizedBox(
            width: 50,
            child: Text(
              badge.title,
              style: TextStyle(
                fontSize: 8,
                color: isUnlocked ? AppColors.grey700 : AppColors.grey400,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconData(String icon) {
    switch (icon) {
      case 'rocket_launch':
        return Icons.rocket_launch;
      case 'leaf':
        return Icons.local_florist;
      case 'filter_center_focus':
        return Icons.filter_center_focus;
      case 'cloud_update':
        return Icons.cloud_upload;
      default:
        return Icons.star;
    }
  }
}