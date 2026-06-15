import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/core/presentation/widgets/error_view.dart';
import 'package:ecodcf/features/gamification/presentation/notifiers/gamification_notifier.dart';
import 'package:ecodcf/features/gamification/presentation/widgets/xp_display.dart';
import 'package:ecodcf/features/gamification/domain/entities/challenge.dart';
import 'package:ecodcf/core/theme/eco_colors_extension.dart';

class GamificationPage extends ConsumerWidget {
  const GamificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challengesAsync = ref.watch(gamificationProvider);

    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(
            title: Text('Rewards & Impact'),
            floating: true,
            pinned: true,
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: XPDisplay(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Active Challenges', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                  TextButton(onPressed: () {}, child: const Text('View All')),
                ],
              ),
            ),
          ),
          challengesAsync.when(
            data: (challenges) {
              final active = challenges.where((c) => !c.isCompleted).toList();
              if (active.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(AppSpacing.xl),
                    child: EmptyStateView(
                      icon: Icons.emoji_events_outlined,
                      title: 'All caught up!',
                      message: 'You have completed all active challenges. Check back soon for more.',
                    ),
                  ),
                );
              }
              return SliverPadding(
                padding: const EdgeInsets.all(AppSpacing.md),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _EnhancedChallengeCard(challenge: active[index]),
                    childCount: active.length,
                  ),
                ),
              );
            },
            loading: () => const SliverToBoxAdapter(child: ShimmerLoading(height: 200)),
            error: (err, _) => SliverToBoxAdapter(child: ErrorView(message: err.toString())),
          ),
          const SliverPadding(
            padding: EdgeInsets.all(AppSpacing.md),
            sliver: SliverToBoxAdapter(
              child: BadgeGrid(),
            ),
          ),
        ],
      ),
    );
  }
}

class _EnhancedChallengeCard extends StatelessWidget {
  final Challenge challenge;
  const _EnhancedChallengeCard({required this.challenge});

  @override
  Widget build(BuildContext context) {
    final progress = challenge.currentProgress / challenge.targetValue;
    final ecoColors = Theme.of(context).extension<EcoColors>();

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: const BorderSide(color: AppColors.grey200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: AppColors.forestGreen.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                  child: Icon(_getIconData(challenge.icon), color: AppColors.forestGreen),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(challenge.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(challenge.description, style: const TextStyle(color: AppColors.grey600, fontSize: 12)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('+${challenge.xpReward}', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.forestGreen)),
                    const Text('XP', style: TextStyle(fontSize: 10, color: AppColors.grey500)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.full),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: AppColors.grey200,
                color: ecoColors?.carbonLow ?? AppColors.leafGreen,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${(progress * 100).toInt()}% Complete',
                  style: const TextStyle(fontSize: 12, color: AppColors.grey600, fontWeight: FontWeight.w500),
                ),
                Text(
                  '${challenge.currentProgress.toInt()}/${challenge.targetValue.toInt()}',
                  style: const TextStyle(fontSize: 12, color: AppColors.grey600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconData(String icon) {
    switch (icon) {
      case 'dark_mode': return Icons.dark_mode;
      case 'email': return Icons.email;
      case 'play_circle': return Icons.play_circle;
      case 'tab': return Icons.tab;
      case 'school': return Icons.school;
      default: return Icons.star;
    }
  }
}

