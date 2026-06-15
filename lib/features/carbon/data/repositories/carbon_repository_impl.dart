import 'package:isar/isar.dart';
import 'package:ecodcf/features/carbon/domain/entities/carbon_record.dart';
import 'package:ecodcf/features/carbon/domain/repositories/carbon_repository.dart';
import 'package:ecodcf/features/carbon/data/models/carbon_record_model.dart';

class CarbonRepositoryImpl implements CarbonRepository {
  final Isar _isar;

  CarbonRepositoryImpl(this._isar);

  @override
  Future<List<CarbonRecord>> getAllRecords() async {
    final models = await _isar.carbonRecordModels.where().findAll();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Stream<List<CarbonRecord>> watchAllRecords() {
    return _isar.carbonRecordModels
        .where()
        .watch()
        .map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<CarbonRecord> getRecordById(String id) async {
    final model = await _isar.carbonRecordModels.filter().remoteIdEqualTo(id).findFirst();
    if (model == null) throw Exception('Record not found');
    return model.toEntity();
  }

  @override
  Future<void> saveRecord(CarbonRecord record) async {
    final model = CarbonRecordModel.fromEntity(record);
    await _isar.writeTxn(() async {
      await _isar.carbonRecordModels.put(model);
    });
  }

  @override
  Future<void> deleteRecord(String id) async {
    await _isar.writeTxn(() async {
      await _isar.carbonRecordModels.filter().remoteIdEqualTo(id).deleteAll();
    });
  }

  @override
  Future<double> getTotalCarbon({DateTime? start, DateTime? end}) async {
    final query = _isar.carbonRecordModels.where();
    
    if (start != null || end != null) {
        // Simple implementation for now, Isar allows more complex range queries
        final records = await query.findAll();
        return records
            .where((r) => (start == null || r.createdAt.isAfter(start)) && (end == null || r.createdAt.isBefore(end)))
            .fold<double>(0.0, (sum, r) => sum + r.carbonValue);
    }

    final total = await _isar.carbonRecordModels.where().carbonValueProperty().sum();
    return total;
  }

  @override
  Future<List<CarbonRecord>> getRecordsByType(String type) async {
    final models = await _isar.carbonRecordModels.filter().typeEqualTo(type).findAll();
    return models.map((m) => m.toEntity()).toList();
  }
}

