import 'package:isar/isar.dart';
import 'package:ecodcf/features/device_usage/domain/entities/device_usage.dart';
import 'package:ecodcf/features/device_usage/domain/repositories/device_usage_repository.dart';
import 'package:ecodcf/features/device_usage/data/models/device_usage_model.dart';

class DeviceUsageRepositoryImpl implements DeviceUsageRepository {
  final Isar _isar;

  DeviceUsageRepositoryImpl(this._isar);

  @override
  Future<List<DeviceUsage>> getAllUsage() async {
    final models = await _isar.deviceUsageModels.where().findAll();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Stream<List<DeviceUsage>> watchAllUsage() {
    return _isar.deviceUsageModels
        .where()
        .watch()
        .map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<List<DeviceUsage>> getTodayUsage() async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final models = await _isar.deviceUsageModels
        .filter()
        .dateBetween(startOfDay, endOfDay)
        .findAll();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Stream<List<DeviceUsage>> watchTodayUsage() {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return _isar.deviceUsageModels
        .filter()
        .dateBetween(startOfDay, endOfDay)
        .watch()
        .map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<DeviceUsage?> getUsageByDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final model = await _isar.deviceUsageModels
        .filter()
        .dateBetween(startOfDay, endOfDay)
        .findFirst();
    return model?.toEntity();
  }

  @override
  Future<void> saveUsage(DeviceUsage usage) async {
    final model = DeviceUsageModel.fromEntity(usage);
    await _isar.writeTxn(() async {
      await _isar.deviceUsageModels.put(model);
    });
  }

  @override
  Future<void> deleteUsage(String id) async {
    await _isar.writeTxn(() async {
      await _isar.deviceUsageModels.filter().remoteIdEqualTo(id).deleteAll();
    });
  }

  @override
  Future<double> getTotalCarbonFootprint({DateTime? start, DateTime? end}) async {
    final models = await _isar.deviceUsageModels
        .filter()
        .optional(start != null && end != null, (query) => query.dateBetween(start!, end!))
        .optional(start != null && end == null, (query) => query.dateGreaterThan(start!))
        .optional(start == null && end != null, (query) => query.dateLessThan(end!))
        .findAll();
    
    double total = 0.0;
    for (final model in models) {
      final kwh = (model.powerConsumptionWatts * model.activeHours) / 1000;
      total += kwh * 0.475; // Emission factor
    }
    return total;
  }
}

