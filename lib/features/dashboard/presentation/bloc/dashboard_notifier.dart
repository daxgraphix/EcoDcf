import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ecodcf/features/dashboard/domain/entities/dashboard_stats.dart';
import 'package:ecodcf/core/providers/database/isar_provider.dart';
import 'package:ecodcf/features/carbon/data/repositories/carbon_repository_impl.dart';
import 'package:ecodcf/features/gamification/data/repositories/challenges_repository_impl.dart';
import 'package:ecodcf/features/device_usage/data/repositories/device_usage_repository_impl.dart';

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
      final challengesRepo = ChallengesRepositoryImpl(isar);
      final deviceRepo = DeviceUsageRepositoryImpl(isar);

      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day);
      
      final todayCarbon = await carbonRepo.getTotalCarbon(start: startOfDay);
      final totalCarbon = await carbonRepo.getTotalCarbon();
      
      final todayUsage = await deviceRepo.getUsageByDate(now);
      final todayHours = todayUsage?.activeHours ?? 0.0;
      
      final challenges = await challengesRepo.getAllChallenges();
      final completedChallenges = challenges.where((c) => c.isCompleted).length;

      // Calculate a dynamic D-Score (Digital Sustainability Score)
      // Base score 100, subtracting points for high carbon usage
      // Target is < 0.5kg/day for "Excellent"
      double dscore = 100.0 - (todayCarbon * 20.0); 
      if (dscore < 0) dscore = 0;
      if (dscore > 100) dscore = 100;

      return DashboardStats(
        todayCarbon: todayCarbon,
        totalCarbon: totalCarbon,
        todayUsageHours: todayHours,
        challengesCompleted: completedChallenges,
        dscore: dscore,
        streakDays: 1, // To be implemented with persistence
      );
    } catch (e) {
      // Fallback to empty stats if database fails
      return const DashboardStats();
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadStats());
  }
}

