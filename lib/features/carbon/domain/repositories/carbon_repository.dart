import 'package:ecodcf/features/carbon/domain/entities/carbon_record.dart';

abstract class CarbonRepository {
  Future<List<CarbonRecord>> getAllRecords();
  Stream<List<CarbonRecord>> watchAllRecords();
  Future<CarbonRecord> getRecordById(String id);
  Future<void> saveRecord(CarbonRecord record);
  Future<void> deleteRecord(String id);
  Future<double> getTotalCarbon({DateTime? start, DateTime? end});
  Future<List<CarbonRecord>> getRecordsByType(String type);
}
