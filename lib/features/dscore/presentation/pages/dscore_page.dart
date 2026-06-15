import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:ecodcf/features/dscore/presentation/bloc/dscore_notifier.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/core/presentation/widgets/eco_ring.dart';
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
        onRetry: () {
          // Trigger a calculation if needed, or just refresh
        },
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: AppSpacing.xl),
            DScoreRing(score: dscore.score),
            const SizedBox(height: AppSpacing.xl),
            Text(
              dscore.level,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.forestGreen,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Your sustainability level',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.grey600,
                  ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Expanded(child: _buildBreakdown(context, dscore, isLoading)),
          ],
        ),
      ),
    );
  }

  Widget _buildBreakdown(BuildContext context, DScore dscore, bool isLoading) {
    final breakdown = dscore.breakdown ?? {
      'Device Usage': 0.0,
      'Internet': 0.0,
      'Streaming': 0.0,
    };
    
    return ListView.builder(
      itemCount: isLoading ? 5 : breakdown.length,
      itemBuilder: (context, index) {
        if (isLoading) {
          return const ListTile(
            title: Text('Loading Category'),
            trailing: Text('0.00 kg CO₂e'),
          );
        }
        final key = breakdown.keys.elementAt(index);
        final value = breakdown.values.elementAt(index);
        return ListTile(
          title: Text(key),
          trailing: Text('${value.toStringAsFixed(2)} kg CO₂e'),
        );
      },
    );
  }
}

