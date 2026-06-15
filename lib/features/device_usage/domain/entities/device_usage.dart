import 'package:equatable/equatable.dart';

class DeviceUsage extends Equatable {
  final String id;
  final String deviceType;
  final String deviceName;
  final double activeHours;
  final double powerConsumptionWatts;
  final double screenTimeMinutes;
  final DateTime date;

  const DeviceUsage({
    required this.id,
    required this.deviceType,
    required this.deviceName,
    required this.activeHours,
    required this.powerConsumptionWatts,
    required this.screenTimeMinutes,
    required this.date,
  });

  @override
  List<Object?> get props => [
        id,
        deviceType,
        deviceName,
        activeHours,
        powerConsumptionWatts,
        screenTimeMinutes,
        date,
      ];

  DeviceUsage copyWith({
    String? id,
    String? deviceType,
    String? deviceName,
    double? activeHours,
    double? powerConsumptionWatts,
    double? screenTimeMinutes,
    DateTime? date,
  }) {
    return DeviceUsage(
      id: id ?? this.id,
      deviceType: deviceType ?? this.deviceType,
      deviceName: deviceName ?? this.deviceName,
      activeHours: activeHours ?? this.activeHours,
      powerConsumptionWatts: powerConsumptionWatts ?? this.powerConsumptionWatts,
      screenTimeMinutes: screenTimeMinutes ?? this.screenTimeMinutes,
      date: date ?? this.date,
    );
  }
}