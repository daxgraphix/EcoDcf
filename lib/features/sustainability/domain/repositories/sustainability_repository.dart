import 'package:ecodcf/features/sustainability/domain/entities/dscore.dart';

abstract class SustainabilityRepository {
  Future<DScore> getCurrentDScore();
  Future<List<DScore>> getDScoreHistory({DateTime? start, DateTime? end});
}
