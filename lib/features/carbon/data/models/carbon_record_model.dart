import 'package:isar/isar.dart';
import 'package:ecodcf/features/carbon/domain/entities/carbon_record.dart';

part 'carbon_record_model.g.dart';

@collection
class CarbonRecordModel {
  Id id = Isar.autoIncrement;

  late String remoteId;

  late String type;

  late double carbonValue;

  late String unit;

  late DateTime createdAt;

  late List<String> metadataKeys;
  late List<String> metadataValues;

  CarbonRecord toEntity() {
    final metadata = <String, dynamic>{};
    for (var i = 0; i < metadataKeys.length; i++) {
      metadata[metadataKeys[i]] = metadataValues[i];
    }
    return CarbonRecord(
      id: remoteId,
      type: type,
      carbonValue: carbonValue,
      unit: unit,
      createdAt: createdAt,
      metadata: metadata.isEmpty ? null : metadata,
    );
  }

  static CarbonRecordModel fromEntity(CarbonRecord entity) {
    final model = CarbonRecordModel()
      ..remoteId = entity.id
      ..type = entity.type
      ..carbonValue = entity.carbonValue
      ..unit = entity.unit
      ..createdAt = entity.createdAt;
    
    final keys = <String>[];
    final values = <String>[];
    entity.metadata?.forEach((key, value) {
      keys.add(key);
      values.add(value.toString());
    });
    model.metadataKeys = keys;
    model.metadataValues = values;
    
    return model;
  }
}

