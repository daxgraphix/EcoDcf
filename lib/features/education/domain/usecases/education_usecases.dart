import 'package:ecodcf/features/education/domain/entities/education_lesson.dart';
import 'package:ecodcf/features/education/domain/repositories/education_repository.dart';

abstract class GetLessonsUseCase {
  Future<List<EducationLesson>> call();
}

class GetLessonsUseCaseImpl implements GetLessonsUseCase {
  final EducationRepository _repository;

  GetLessonsUseCaseImpl(this._repository);

  @override
  Future<List<EducationLesson>> call() => _repository.getAllLessons();
}
