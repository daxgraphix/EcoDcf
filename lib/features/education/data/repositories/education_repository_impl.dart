import 'package:ecodcf/features/education/domain/entities/education_lesson.dart';
import 'package:ecodcf/features/education/domain/repositories/education_repository.dart';

class EducationRepositoryImpl implements EducationRepository {
  @override
  Future<List<EducationLesson>> getAllLessons() async => [];

  @override
  Future<EducationLesson> getLessonById(String id) async {
    throw UnimplementedError();
  }
}
