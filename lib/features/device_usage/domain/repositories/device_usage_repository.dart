import 'package:ecodcf/features/device_usage/domain/entities/device_usage.dart';

abstract class DeviceUsageRepository {
  Future<List<DeviceUsage>> getAllUsage();
  Stream<List<DeviceUsage>> watchAllUsage();
  Future<List<DeviceUsage>> getTodayUsage();
  Stream<List<DeviceUsage>> watchTodayUsage();
  Future<DeviceUsage?> getUsageByDate(DateTime date);
  Future<void> saveUsage(DeviceUsage usage);
  Future<void> deleteUsage(String id);
  Future<double> getTotalCarbonFootprint({DateTime? start, DateTime? end});
}
