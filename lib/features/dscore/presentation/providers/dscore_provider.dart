import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ecodcf/core/services/dscore_service.dart';
import 'package:ecodcf/features/carbon/presentation/bloc/carbon_notifier.dart';
import 'package:ecodcf/features/dscore/domain/entities/dscore.dart';

part 'dscore_provider.g.dart';

@riverpod
DScore dailyDScore(DailyDScoreRef ref) {
  final carbonRecordsAsync = ref.watch(carbonProvider);

  return carbonRecordsAsync.when(
    data: (records) {
      final now = DateTime.now();
      final todayRecords = records.where((r) {
        return r.createdAt.year == now.year &&
            r.createdAt.month == now.month &&
            r.createdAt.day == now.day;
      }).toList();

      return DScoreService.calculateDailyScore(
        records: todayRecords,
        date: now,
      );
    },
    loading: () => DScore(date: DateTime.now(), score: 0, level: 'Calculating...'),
    error: (err, stack) => DScore(date: DateTime.now(), score: 0, level: 'Error'),
  );
}

@riverpod
String dScoreAdvice(DScoreAdviceRef ref) {
  final dScore = ref.watch(dailyDScoreProvider);
  return DScoreService.getAdvice(dScore.score);
}

