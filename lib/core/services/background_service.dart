import 'package:flutter/widgets.dart';
import 'package:workmanager/workmanager.dart';
import 'package:isar/isar.dart';
import 'package:ecodcf/core/providers/database/isar_provider.dart';
import 'package:ecodcf/core/database/isar/models/user_preferences_model.dart';
import 'package:ecodcf/features/device_usage/data/repositories/device_usage_repository_impl.dart';
import 'package:ecodcf/features/device_usage/domain/entities/device_usage.dart';
import 'package:ecodcf/features/carbon/data/repositories/carbon_repository_impl.dart';
import 'package:ecodcf/core/utils/carbon_calculator.dart';
import 'package:uuid/uuid.dart';

const String updateDeviceUsageTask = "com.ecodcf.updateDeviceUsage";

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    WidgetsFlutterBinding.ensureInitialized();

    switch (task) {
      case updateDeviceUsageTask:
        try {
          final isar = await IsarProvider.openIsar();
          final deviceRepository = DeviceUsageRepositoryImpl(isar);
          final carbonRepository = CarbonRepositoryImpl(isar);

          final now = DateTime.now();
          
          // Get last sync time to calculate actual delta
          final prefs = await isar.collection<UserPreferencesModel>().where().findFirst();
          
          final DateTime lastSync = prefs?.lastSyncTimestamp ?? now.subtract(const Duration(minutes: 15));
          final double deltaMinutes = now.difference(lastSync).inSeconds / 60.0;
          final double addedHours = deltaMinutes / 60.0;
          
          final existingUsage = await deviceRepository.getUsageByDate(now);
          double currentWatts = 5.0; // Default for mobile

          if (existingUsage != null) {
            final updatedUsage = existingUsage.copyWith(
              activeHours: existingUsage.activeHours + addedHours,
              screenTimeMinutes: existingUsage.screenTimeMinutes + deltaMinutes,
            );
            await deviceRepository.saveUsage(updatedUsage);
            currentWatts = existingUsage.powerConsumptionWatts;
          } else {
            final newUsage = DeviceUsage(
              id: const Uuid().v4(),
              deviceType: "Mobile",
              deviceName: "Primary Device",
              activeHours: addedHours,
              powerConsumptionWatts: 5.0,
              screenTimeMinutes: deltaMinutes,
              date: now,
            );
            await deviceRepository.saveUsage(newUsage);
          }

          // Real-time Carbon Calculation
          final carbonRecord = CarbonCalculator.calculateDeviceEnergy(
            watts: currentWatts,
            hours: addedHours,
            deviceName: "Primary Mobile Device",
          );

          await carbonRepository.saveRecord(carbonRecord);
          
          // Update last sync timestamp
          if (prefs != null) {
            await isar.writeTxn(() async {
              prefs.lastSyncTimestamp = now;
              await isar.collection<UserPreferencesModel>().put(prefs);
            });
          }

          return Future.value(true);
        } catch (e) {
          debugPrint("Background Task Error: $e");
          return Future.value(false);
        }
    }
    return Future.value(true);
  });
}

class BackgroundService {
  static Future<void> init() async {
    await Workmanager().initialize(
      callbackDispatcher,
    );
  }

  static Future<void> scheduleDeviceUsageUpdate() async {
    await Workmanager().registerPeriodicTask(
      "1",
      updateDeviceUsageTask,
      frequency: const Duration(minutes: 15),
      constraints: Constraints(
        networkType: NetworkType.notRequired,
        requiresBatteryNotLow: true,
      ),
    );
  }
}

