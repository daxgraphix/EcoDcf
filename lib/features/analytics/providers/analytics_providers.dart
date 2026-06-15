import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ecodcf/features/carbon/presentation/bloc/carbon_notifier.dart';
import 'package:ecodcf/features/device_usage/presentation/bloc/device_usage_notifier.dart';
import 'package:ecodcf/features/analytics/data/repositories/analytics_repository_impl.dart';
import 'package:ecodcf/features/analytics/domain/repositories/analytics_repository.dart';
import 'package:ecodcf/features/analytics/domain/entities/analytics_data.dart';
import 'package:ecodcf/core/providers/database/isar_provider.dart';

part 'analytics_providers.g.dart';

@riverpod
Future<AnalyticsRepository> analyticsRepository(AnalyticsRepositoryRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  return AnalyticsRepositoryImpl(isar);
}

@riverpod
Future<List<AnalyticsData>> dailyAnalytics(DailyAnalyticsRef ref) async {
  // Watch source data to trigger recalculation when data changes
  ref.watch(carbonProvider);
  ref.watch(deviceUsageListProvider);
  
  final repository = await ref.watch(analyticsRepositoryProvider.future);
  return repository.getDailyData();
}

@riverpod
Future<List<AnalyticsData>> weeklyAnalytics(WeeklyAnalyticsRef ref) async {
  ref.watch(carbonProvider);
  ref.watch(deviceUsageListProvider);

  final repository = await ref.watch(analyticsRepositoryProvider.future);
  return repository.getWeeklyData();
}

@riverpod
Future<List<AnalyticsData>> monthlyAnalytics(MonthlyAnalyticsRef ref) async {
  ref.watch(carbonProvider);
  ref.watch(deviceUsageListProvider);

  final repository = await ref.watch(analyticsRepositoryProvider.future);
  return repository.getMonthlyData();
}

@riverpod
Future<List<AnalyticsData>> yearlyAnalytics(YearlyAnalyticsRef ref) async {
  ref.watch(carbonProvider);
  ref.watch(deviceUsageListProvider);

  final repository = await ref.watch(analyticsRepositoryProvider.future);
  return repository.getYearlyData();
}

