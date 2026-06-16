import 'package:ecodcf/features/sustainability/domain/entities/lesson.dart';
import 'package:ecodcf/features/sustainability/domain/repositories/lessons_repository.dart';
import 'package:ecodcf/features/sustainability/data/datasources/sustainability_mock_data.dart';
import 'package:ecodcf/features/sustainability/data/datasources/training_ground_data.dart';

class LessonsRepositoryImpl implements LessonsRepository {
  @override
  Future<List<Lesson>> getAllLessons() async {
    // Simulate slight delay for professional feel
    await Future.delayed(const Duration(milliseconds: 300));
    final mock = SustainabilityMockData.getExtendedLessons();
    final training = TrainingGroundData.missions;
    return [...training, ...mock];
  }

  @override
  Future<List<Lesson>> getLessonsByCategory(String categoryId) async {
    final all = await getAllLessons();
    return all
        .where((l) => l.category.toLowerCase() == categoryId.toLowerCase())
        .toList();
  }

  @override
  Future<Lesson> getLessonById(String id) async {
    final all = await getAllLessons();
    return all.firstWhere((l) => l.id == id);
  }

  @override
  Future<void> markLessonCompleted(String id) async {
    // Implement persistence (Isar) here if needed
  }
}
