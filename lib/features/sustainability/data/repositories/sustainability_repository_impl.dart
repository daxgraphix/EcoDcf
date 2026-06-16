import 'package:ecodcf/features/sustainability/data/datasources/sustainability_mock_data.dart';
import 'package:ecodcf/features/sustainability/data/datasources/training_ground_data.dart';
import 'package:ecodcf/features/sustainability/domain/entities/lesson.dart';
import 'package:ecodcf/features/sustainability/data/models/lesson_progress_model.dart';
import 'package:ecodcf/core/providers/database/isar_provider.dart';
import 'package:isar/isar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class SustainabilityRepository {
  Future<List<Lesson>> getLessons();
  Future<List<Category>> getCategories();
  Future<void> markLessonAsCompleted(String lessonId);
}

class SustainabilityRepositoryImpl implements SustainabilityRepository {
  final Isar _isar;

  SustainabilityRepositoryImpl(this._isar);

  @override
  Future<List<Lesson>> getLessons() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));

    final mockLessons = SustainabilityMockData.getExtendedLessons();
    final trainingMissions = TrainingGroundData.missions;
    final allLessons = [...trainingMissions, ...mockLessons];

    // Fetch progress from Isar
    final progressList = await _isar.lessonProgressModels.where().findAll();
    final progressMap = {for (var p in progressList) p.lessonId: p};

    // Merge progress into lessons
    return allLessons.map((lesson) {
      final progress = progressMap[lesson.id];
      if (progress != null) {
        return lesson.copyWith(
          isCompleted: progress.isCompleted,
          completedAt: progress.completedAt,
        );
      }
      return lesson;
    }).toList();
  }

  @override
  Future<List<Category>> getCategories() async {
    return const [
      Category(
          id: 'training',
          title: 'Training Ground',
          description: 'Complete missions to become an Eco-Warrior',
          icon: 'military_tech'),
      Category(
          id: 'found',
          title: 'Foundations',
          description: 'Basics of digital carbon',
          icon: 'lightbulb'),
      Category(
          id: 'device',
          title: 'Device Care',
          description: 'Extend hardware lifespan',
          icon: 'smartphone'),
      Category(
          id: 'cloud',
          title: 'Cloud Computing',
          description: 'Green server strategies',
          icon: 'cloud'),
      Category(
          id: 'ai',
          title: 'AI Ethics',
          description: 'Sustainable artificial intelligence',
          icon: 'psychology'),
      Category(
          id: 'media',
          title: 'Streaming & Media',
          description: 'Eco-friendly consumption',
          icon: 'play_circle'),
    ];
  }

  @override
  Future<void> markLessonAsCompleted(String lessonId) async {
    final progress = LessonProgressModel()
      ..lessonId = lessonId
      ..isCompleted = true
      ..completedAt = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.lessonProgressModels.put(progress);
    });
  }
}

final sustainabilityRepositoryProvider =
    Provider<SustainabilityRepository>((ref) {
  final isar = ref.watch(isarProvider).value;
  if (isar == null) throw Exception('Isar not initialized');
  return SustainabilityRepositoryImpl(isar);
});

final lessonsProvider = FutureProvider<List<Lesson>>((ref) {
  return ref.watch(sustainabilityRepositoryProvider).getLessons();
});

final categoriesProvider = FutureProvider<List<Category>>((ref) {
  return ref.watch(sustainabilityRepositoryProvider).getCategories();
});
