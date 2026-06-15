import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/core/presentation/widgets/eco_ring.dart';
import 'package:ecodcf/core/presentation/widgets/error_view.dart';
import 'package:ecodcf/features/dashboard/presentation/bloc/dashboard_notifier.dart';
import 'package:ecodcf/core/utils/impact_equivalency_converter.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(dashboardProvider);

    return dashboardAsync.when(
      data: (stats) => Scaffold(
        backgroundColor: AppColors.offWhite,
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () => ref.read(dashboardProvider.notifier).refresh(),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _HeaderWidget(),
                  const SizedBox(height: AppSpacing.xl),
                  _DScoreRingWidget(
                    score: stats.dscore,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  _CarbonImpactWidget(
                    carbon: stats.todayCarbon,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _ImpactEquivalencyList(
                    carbon: stats.todayCarbon,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  _DeviceUsageWidget(
                    hours: stats.todayUsageHours,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  const _QuickActionsWidget(),
                  const SizedBox(height: AppSpacing.xl),
                  const _ChallengesWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) => Scaffold(
        body: ErrorView(
          message: err.toString(),
          onRetry: () => ref.read(dashboardProvider.notifier).refresh(),
        ),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Eco-Life',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            GestureDetector(
              onTap: () => context.push('/profile'),
              child: Hero(
                tag: 'profile-pic',
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.forestGreen.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.forestGreen, width: 2),
                  ),
                  child: const Icon(Icons.person, color: AppColors.forestGreen, size: 24),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Your personal digital footprint summary',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.grey600,
              ),
        ),
      ],
    );
  }
}

class _DScoreRingWidget extends StatelessWidget {
  final double score;
  const _DScoreRingWidget({required this.score});

  @override
  Widget build(BuildContext context) {
    final level = _getScoreLevel(score);
    return Column(
      children: [
        Center(
          child: DScoreRing(
            score: score,
            level: level,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          level,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: _getScoreColor(score),
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Text(
            'Keep up the good work! Your digital habits are improving.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.grey600,
                ),
          ),
        ),
      ],
    );
  }

  String _getScoreLevel(double score) {
    if (score < 25) return 'Needs Improvement';
    if (score < 50) return 'Average';
    if (score < 75) return 'Good';
    return 'Excellent';
  }

  Color _getScoreColor(double score) {
    if (score < 25) return AppColors.warning;
    if (score < 50) return AppColors.grey500;
    if (score < 75) return AppColors.leafGreen;
    return AppColors.success;
  }
}

class _CarbonImpactWidget extends StatelessWidget {
  final double carbon;
  const _CarbonImpactWidget({required this.carbon});

  @override
  Widget build(BuildContext context) {
    return EcoCard(
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.ecoBlue.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.co2, color: AppColors.ecoBlue, size: 32),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Today\'s Carbon', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: AppSpacing.xs),
                Text('kg CO₂e', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.grey600)),
              ],
            ),
          ),
          Text(
            carbon.toStringAsFixed(2),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.ecoBlue,
                ),
          ),
        ],
      ),
    );
  }
}

class _DeviceUsageWidget extends StatelessWidget {
  final double hours;
  const _DeviceUsageWidget({required this.hours});

  @override
  Widget build(BuildContext context) {
    return EcoCard(
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.leafGreen.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.phone_android, color: AppColors.leafGreen, size: 32),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Device Usage', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '${hours.toStringAsFixed(1)} active hours today',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.grey600),
                ),
              ],
            ),
          ),
          Text(
            '${hours.toStringAsFixed(1)}h',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.leafGreen,
                ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionsWidget extends StatelessWidget {
  const _QuickActionsWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quick Actions', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: AppSpacing.md),
        Row(
          children: [
            const _QuickActionItem(icon: Icons.add, label: 'Track', onTap: null),
            const SizedBox(width: AppSpacing.md),
            _QuickActionItem(
              icon: Icons.emoji_events,
              label: 'Challenges',
              onTap: () => context.push('/challenges'),
            ),
            const SizedBox(width: AppSpacing.md),
            _QuickActionItem(
              icon: Icons.school,
              label: 'Academy',
              onTap: () => context.push('/academy'),
            ),
            const SizedBox(width: AppSpacing.md),
            _QuickActionItem(
              icon: Icons.insights,
              label: 'Analytics',
              onTap: () => context.push('/analytics'),
            ),
          ],
        ),
      ],
    );
  }
}

class _ChallengesWidget extends StatelessWidget {
  const _ChallengesWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Active Challenges', style: Theme.of(context).textTheme.titleMedium),
            TextButton(onPressed: () {}, child: const Text('See All')),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        const EmptyStateView(
          icon: Icons.star_border,
          title: 'No challenges yet',
          message: 'Join a challenge to start earning badges!',
        ),
      ],
    );
  }
}

class _ImpactEquivalencyList extends StatelessWidget {
  final double carbon;
  const _ImpactEquivalencyList({required this.carbon});

  @override
  Widget build(BuildContext context) {
    final equivalencies = ImpactEquivalency.getEquivalencies(carbon);

    if (equivalencies.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
          child: Text(
            'Your impact is equivalent to:',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.grey600,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: equivalencies.length,
            itemBuilder: (context, index) {
              final item = equivalencies[index];
              return _EquivalencyCard(item: item);
            },
          ),
        ),
      ],
    );
  }
}

class _EquivalencyCard extends StatelessWidget {
  final ImpactEquivalency item;
  const _EquivalencyCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: item.color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: item.color.withValues(alpha: 0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item.icon, color: item.color, size: 24),
          const SizedBox(height: AppSpacing.xs),
          Text(
            item.value,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: item.color,
                ),
          ),
          Text(
            item.label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 8,
                  color: AppColors.grey600,
                ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _QuickActionItem({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap?.call();
      },
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.forestGreen.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
            child: Icon(icon, color: AppColors.forestGreen, size: 24),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(label, style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}
