import 'package:hive/hive.dart';
import 'package:ecodcf/features/dscore/data/models/dscore_model.dart';
import 'package:ecodcf/features/dscore/domain/entities/dscore.dart';
import 'package:ecodcf/features/dscore/domain/repositories/dscore_repository.dart';

class DScoreRepositoryImpl implements DScoreRepository {
  final Box<DScoreModel> dscoreBox;

  DScoreRepositoryImpl(this.dscoreBox);

  @override
  Future<DScore?> getCurrentScore() async {
    final models = dscoreBox.values.toList();
    if (models.isEmpty) return null;
    models.sort((a, b) => b.date.compareTo(a.date));
    return models.first.toEntity();
  }

  @override
  Future<List<DScore>> getAllScores() async {
    return dscoreBox.values.map((m) => m.toEntity()).toList();
  }

  @override
  Future<void> saveScore(DScore score) async {
    final model = DScoreModel.fromJson(score);
    await dscoreBox.add(model);
  }
}
