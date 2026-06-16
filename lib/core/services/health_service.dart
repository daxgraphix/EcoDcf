import 'package:health/health.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class HealthService {
  final Health _health = Health();

  static const types = [
    HealthDataType.STEPS,
  ];

  static const permissions = [
    HealthDataAccess.READ,
  ];

  Future<bool> authorize() async {
    await Permission.activityRecognition.request();
    final bool? hasPermissions = await _health.hasPermissions(types, permissions: permissions);
    if (hasPermissions == false) {
      return await _health.requestAuthorization(types, permissions: permissions);
    }
    return true;
  }

  Future<int> getTodaySteps() async {
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day);
    
    try {
      return await _health.getTotalStepsInInterval(yesterday, now) ?? 0;
    } catch (e) {
      return 0;
    }
  }
}

final healthServiceProvider = Provider((ref) => HealthService());

final todayStepsProvider = FutureProvider<int>((ref) async {
  final service = ref.watch(healthServiceProvider);
  final authorized = await service.authorize();
  if (authorized) {
    return await service.getTodaySteps();
  }
  return 0;
});
