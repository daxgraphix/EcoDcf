import 'package:flutter/material.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/features/gamification/domain/entities/challenge.dart';

class BadgesPage extends StatelessWidget {
  const BadgesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final badges = _getMockBadges();
    final unlockedBadges = badges.where((b) => b.isUnlocked).toList();

    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(
            title: Text('Your Badges'),
            floating: true,
            pinned: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.md),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Unlocked (${unlockedBadges.length})',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.grey700,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                      separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.sm),
                      itemCount: unlockedBadges.length,
                      itemBuilder: (context, index) {
                        final badge = unlockedBadges[index];
                        return _BadgeCircle(badge: badge);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.lg)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            sliver: SliverToBoxAdapter(
              child: Text(
                'All Badges',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.grey700,
                    ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.md),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: AppSpacing.md,
                crossAxisSpacing: AppSpacing.md,
                childAspectRatio: 0.85,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final badge = badges[index];
                  return _BadgeTile(badge: badge);
                },
                childCount: badges.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<GamificationBadge> _getMockBadges() {
    return [
      GamificationBadge(
        id: 'b1',
        title: 'First Steps',
        description: 'Complete your first lesson',
        icon: 'rocket_launch',
        xpRequired: 100,
        isUnlocked: true,
        unlockedAt: DateTime(2024, 1, 15),
      ),
      GamificationBadge(
        id: 'b2',
        title: 'Eco Warrior',
        description: 'Reduce carbon by 10kg',
        icon: 'leaf',
        xpRequired: 500,
        isUnlocked: true,
        unlockedAt: DateTime(2024, 2, 20),
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
        icon: 'carbon_presentation',
        xpRequired: 2000,
        isUnlocked: false,
      ),
      GamificationBadge(
        id: 'b5',
        title: 'Master',
        description: 'Complete all training',
        icon: 'school',
        xpRequired: 5000,
        isUnlocked: false,
      ),
      GamificationBadge(
        id: 'b6',
        title: 'Community Hero',
        description: 'Help 10 neighbors',
        icon: 'groups',
        xpRequired: 3000,
        isUnlocked: true,
        unlockedAt: DateTime(2024, 3, 10),
      ),
    ];
  }
}

class _BadgeCircle extends StatelessWidget {
  final GamificationBadge badge;
  const _BadgeCircle({required this.badge});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.forestGreen.withValues(alpha: 0.1),
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.forestGreen, width: 2),
          ),
          child: Icon(
            _getIconData(badge.icon),
            color: AppColors.forestGreen,
            size: 30,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        SizedBox(
          width: 70,
          child: Text(
            badge.title,
            style: const TextStyle(fontSize: 10),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
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
      case 'carbon_presentation':
        return Icons.cloud_upload;
      case 'school':
        return Icons.school;
      case 'groups':
        return Icons.groups;
      default:
        return Icons.star;
    }
  }
}

class _BadgeTile extends StatelessWidget {
  final GamificationBadge badge;
  const _BadgeTile({required this.badge});

  @override
  Widget build(BuildContext context) {
    final isUnlocked = badge.isUnlocked;

    return Opacity(
      opacity: isUnlocked ? 1.0 : 0.4,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: isUnlocked
                  ? AppColors.forestGreen.withValues(alpha: 0.1)
                  : AppColors.grey200,
              shape: BoxShape.circle,
              border: Border.all(
                color: isUnlocked ? AppColors.forestGreen : AppColors.grey300,
                width: 2,
              ),
            ),
            child: Icon(
              _getIconData(badge.icon),
              color: isUnlocked ? AppColors.forestGreen : AppColors.grey400,
              size: 30,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          SizedBox(
            width: 80,
            child: Text(
              badge.title,
              style: TextStyle(
                fontSize: 10,
                color: isUnlocked ? AppColors.grey800 : AppColors.grey400,
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
      case 'carbon_presentation':
        return Icons.cloud_upload;
      case 'school':
        return Icons.school;
      case 'groups':
        return Icons.groups;
      default:
        return Icons.star;
    }
  }
}