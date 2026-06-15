import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ecodcf/features/carbon/domain/entities/carbon_record.dart';
import 'package:ecodcf/features/device_usage/domain/entities/device_usage.dart';
import 'package:ecodcf/features/gamification/domain/entities/challenge.dart';
import 'package:ecodcf/features/carbon/presentation/bloc/carbon_notifier.dart';
import 'package:ecodcf/features/device_usage/presentation/bloc/device_usage_notifier.dart';
import 'package:ecodcf/features/gamification/presentation/notifiers/gamification_notifier.dart';

part 'dashboard_state.freezed.dart';
part 'dashboard_state.g.dart';

@freezed
class DashboardData with _$DashboardData {
  const factory DashboardData({
    required List<CarbonRecord> carbonRecords,
    required List<DeviceUsage> deviceUsages,
    required List<Challenge> activeChallenges,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _DashboardData;
}

@riverpod
class DashboardController extends _$DashboardController {
  @override
  DashboardData build() {
    final carbonAsync = ref.watch(carbonProvider);
    final usageAsync = ref.watch(deviceUsageListProvider);
    final gamificationAsync = ref.watch(gamificationProvider);

    final isLoading = carbonAsync.isLoading || usageAsync.isLoading || gamificationAsync.isLoading;
    final hasError = carbonAsync.hasError || usageAsync.hasError || gamificationAsync.hasError;

    return DashboardData(
      carbonRecords: carbonAsync.value ?? [],
      deviceUsages: usageAsync.value ?? [],
      activeChallenges: gamificationAsync.value ?? [],
      isLoading: isLoading,
      errorMessage: hasError ? 'Failed to sync dashboard data' : null,
    );
  }

  Future<void> refresh() async {
    ref.invalidate(carbonProvider);
    ref.invalidate(deviceUsageListProvider);
    ref.invalidate(gamificationProvider);
    
    // Wait for all to complete if needed, though watching handles it.
  }
}

