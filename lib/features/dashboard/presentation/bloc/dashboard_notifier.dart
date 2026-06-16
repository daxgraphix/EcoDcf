import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ecodcf/features/dashboard/domain/entities/dashboard_stats.dart';
import 'package:ecodcf/core/providers/database/isar_provider.dart';
import 'package:ecodcf/features/carbon/data/repositories/carbon_repository_impl.dart';
import 'package:ecodcf/features/device_usage/data/repositories/device_usage_repository_impl.dart';

import 'package:ecodcf/core/services/health_service.dart';

part 'dashboard_notifier.g.dart';

@riverpod
class Dashboard extends _$Dashboard {
  @override
  FutureOr<DashboardStats> build() async {
    return _loadStats();
  }

  Future<DashboardStats> _loadStats() async {
    try {
      final isar = await ref.read(isarProvider.future);
      final carbonRepo = CarbonRepositoryImpl(isar);
      final deviceRepo = DeviceUsageRepositoryImpl(isar);
      final healthService = ref.read(healthServiceProvider);

      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day);
      
      final todayCarbon = await carbonRepo.getTotalCarbon(start: startOfDay);
      final totalCarbon = await carbonRepo.getTotalCarbon();
      
      final todayUsage = await deviceRepo.getUsageByDate(now);
      final todayHours = todayUsage?.activeHours ?? 0.0;

      // Interoperability: Fetch Steps
      int steps = 0;
      try {
        if (await healthService.authorize()) {
          steps = await healthService.getTodaySteps();
        }
      } catch (_) {}

      // Calculate a dynamic D-Score (Digital Sustainability Score)
      // We now add a "Bonus" for physical activity (Health Interoperability)
      // Every 1000 steps offsets some digital impact
      final double stepBonus = (steps / 1000) * 2.0; 
      double dscore = (100.0 - (todayCarbon * 20.0)) + stepBonus; 
      if (dscore < 0) dscore = 0;
      if (dscore > 100) dscore = 100;

      return DashboardStats(
        todayCarbon: todayCarbon,
        totalCarbon: totalCarbon,
        todayUsageHours: todayHours,
        dscore: dscore,
        streakDays: 1, 
        todaySteps: steps,
        globalTreesSaved: 12450, // Mocked global community stat
        totalSaved: totalCarbon * 0.15, // Mocked saved calculation
        deviceBreakdown: {
          'Social': todayHours * 0.4,
          'Work': todayHours * 0.3,
          'Entertainment': todayHours * 0.2,
          'Other': todayHours * 0.1,
        },
      );
    } catch (e) {
      return const DashboardStats();
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadStats());
  }
}

