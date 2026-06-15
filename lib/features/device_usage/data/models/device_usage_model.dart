import 'package:isar/isar.dart';
import 'package:ecodcf/features/device_usage/domain/entities/device_usage.dart';

part 'device_usage_model.g.dart';

@collection
class DeviceUsageModel {
  Id id = Isar.autoIncrement;

  late String remoteId;

  late String deviceType;

  late String deviceName;

  late double activeHours;

  late double powerConsumptionWatts;

  late double screenTimeMinutes;

  late DateTime date;

  DeviceUsage toEntity() {
    return DeviceUsage(
      id: remoteId,
      deviceType: deviceType,
      deviceName: deviceName,
      activeHours: activeHours,
      powerConsumptionWatts: powerConsumptionWatts,
      screenTimeMinutes: screenTimeMinutes,
      date: date,
    );
  }

  static DeviceUsageModel fromEntity(DeviceUsage entity) {
    return DeviceUsageModel()
      ..remoteId = entity.id
      ..deviceType = entity.deviceType
      ..deviceName = entity.deviceName
      ..activeHours = entity.activeHours
      ..powerConsumptionWatts = entity.powerConsumptionWatts
      ..screenTimeMinutes = entity.screenTimeMinutes
      ..date = entity.date;
  }
}

