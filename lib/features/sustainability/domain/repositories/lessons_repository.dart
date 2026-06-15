import 'package:ecodcf/features/sustainability/domain/entities/lesson.dart';

abstract class LessonsRepository {
  Future<List<Lesson>> getAllLessons();
  Future<List<Lesson>> getLessonsByCategory(String categoryId);
  Future<Lesson> getLessonById(String id);
  Future<void> markLessonCompleted(String id);
}
