import 'package:isar/isar.dart';

part 'lesson_progress_model.g.dart';

@collection
class LessonProgressModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String lessonId;

  late bool isCompleted;

  late DateTime completedAt;
}
