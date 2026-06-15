import 'package:ecodcf/features/education/domain/entities/education_lesson.dart';

abstract class EducationRepository {
  Future<List<EducationLesson>> getAllLessons();
  Future<EducationLesson> getLessonById(String id);
}
