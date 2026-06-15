import 'package:ecodcf/features/dscore/domain/entities/dscore.dart';

abstract class DScoreRepository {
  Future<DScore?> getCurrentScore();
  Future<List<DScore>> getAllScores();
  Future<void> saveScore(DScore score);
}
