import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:ecodcf/features/dscore/presentation/bloc/dscore_notifier.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/core/presentation/widgets/error_view.dart';
import 'package:ecodcf/features/dscore/domain/entities/dscore.dart';

class DScorePage extends StatelessWidget {
  const DScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: DScoreContent(),
      ),
    );
  }
}

class DScoreContent extends ConsumerWidget {
  const DScoreContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dscoreProvider);

    if (state is DScoreError) {
      return ErrorView(
        message: state.message,
        onRetry: () {},
      );
    }

    final isLoading = state is DScoreLoading || state is DScoreInitial;
    final dscore = state is DScoreLoaded
        ? state.dscore
        : DScore(score: 0, level: 'Calculating...', date: DateTime.now());

    return Skeletonizer(
      enabled: isLoading,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.xl),
              _buildHeader(context, dscore, isLoading),
              const SizedBox(height: AppSpacing.xl),
              _buildCarbonSummary(context, dscore, isLoading),
              const SizedBox(height: AppSpacing.xl),
              _buildScoreRing(dscore, isLoading),
              const SizedBox(height: AppSpacing.xl),
              _buildBreakdown(context, dscore, isLoading),
              const SizedBox(height: AppSpacing.xl),
              _buildRecommendations(context, dscore, isLoading),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, DScore dscore, bool isLoading) {
    return Column(
      children: [
        Text(
          dscore.level,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.forestGreen,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Your sustainability level',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.grey600,
              ),
        ),
      ],
    );
  }

  Widget _buildCarbonSummary(BuildContext context, DScore dscore, bool isLoading) {
    final todayCarbon = dscore.todayCarbon ?? 0.0;
    final weeklyCarbon = dscore.weeklyCarbon ?? 0.0;
    final monthlyCarbon = dscore.monthlyCarbon ?? 0.0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Carbon Footprint', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _CarbonStat(
                  label: 'Today',
                  value: '${todayCarbon.toStringAsFixed(1)} kg',
                  isLoading: isLoading,
                ),
                _CarbonStat(
                  label: 'This Week',
                  value: '${weeklyCarbon.toStringAsFixed(1)} kg',
                  isLoading: isLoading,
                ),
                _CarbonStat(
                  label: 'This Month',
                  value: '${monthlyCarbon.toStringAsFixed(1)} kg',
                  isLoading: isLoading,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreRing(DScore dscore, bool isLoading) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: CircularProgressIndicator(
            value: (dscore.score / 100).clamp(0.0, 1.0),
            strokeWidth: 12,
            backgroundColor: AppColors.grey200,
            color: AppColors.forestGreen,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              dscore.score.toStringAsFixed(0),
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: AppColors.forestGreen,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              dscore.getLevelName(),
              style: const TextStyle(
                color: AppColors.grey600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBreakdown(BuildContext context, DScore dscore, bool isLoading) {
    final breakdown = dscore.breakdown ?? {};

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Energy Breakdown', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.md),
            if (isLoading)
              const Column(
                children: [
                  LinearProgressIndicator(),
                  SizedBox(height: 8),
                  LinearProgressIndicator(),
                  SizedBox(height: 8),
                  LinearProgressIndicator(),
                ],
              )
            else if (breakdown.isEmpty)
              const Text('No breakdown data available yet')
            else
              ...breakdown.entries.map((e) => ListTile(
                    title: Text(e.key),
                    trailing: Text('${(e.value as num).toDouble().toStringAsFixed(2)} kg'),
                  )),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendations(BuildContext context, DScore dscore, bool isLoading) {
    final recommendations = dscore.recommendations ?? {};
    final quickWins = recommendations['quickWins'] as List<String>? ?? [];
    final focusAreas = recommendations['focusAreas'] as List<String>? ?? [];

    if (quickWins.isEmpty && focusAreas.isEmpty) {
      return const SizedBox.shrink();
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recommendations', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.md),
            if (quickWins.isNotEmpty) ...[
              const Text('Quick Wins', style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: AppSpacing.sm),
              ...quickWins.map((w) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text('- $w', style: Theme.of(context).textTheme.bodySmall),
                  )),
              const SizedBox(height: AppSpacing.md),
            ],
            if (focusAreas.isNotEmpty) ...[
              const Text('Focus Areas', style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: AppSpacing.sm),
              ...focusAreas.map((f) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text('- $f', style: Theme.of(context).textTheme.bodySmall),
                  )),
            ],
          ],
        ),
      ),
    );
  }
}

class _CarbonStat extends StatelessWidget {
  final String label;
  final String value;
  final bool isLoading;

  const _CarbonStat({required this.label, required this.value, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: AppColors.grey600, fontSize: 12)),
        const SizedBox(height: 4),
        isLoading
            ? const SizedBox(width: 60, child: LinearProgressIndicator())
            : Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}