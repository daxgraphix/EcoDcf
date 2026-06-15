import 'package:hive/hive.dart';
import 'package:ecodcf/features/dscore/domain/entities/dscore.dart';

@HiveType(typeId: 20)
class DScoreModel {
  @HiveField(0)
  late double score;

  @HiveField(1)
  late String level;

  @HiveField(2)
  late String date;

  @HiveField(3)
  late String? breakdown;

  DScoreModel();

  factory DScoreModel.fromJson(DScore dscore) {
    return DScoreModel()
      ..score = dscore.score
      ..level = dscore.level
      ..date = dscore.date.toIso8601String()
      ..breakdown = dscore.breakdown != null ? _encodeBreakdown(dscore.breakdown!) : null;
  }

  static String _encodeBreakdown(Map<String, dynamic> breakdown) {
    return breakdown.map((key, value) => MapEntry(key, value.toString())).toString();
  }

  DScore toEntity() {
    return DScore(
      score: score,
      level: level,
      date: DateTime.parse(date),
      breakdown: breakdown != null ? _decodeBreakdown(breakdown!) : null,
    );
  }

  static Map<String, dynamic> _decodeBreakdown(String encoded) {
    return {};
  }
}
