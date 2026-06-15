import 'package:ecodcf/features/sustainability/data/datasources/sustainability_mock_data.dart';
import 'package:ecodcf/features/sustainability/domain/entities/lesson.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class SustainabilityRepository {
  Future<List<Lesson>> getLessons();
  Future<List<Category>> getCategories();
  Future<void> markLessonAsCompleted(String lessonId);
}

class SustainabilityRepositoryImpl implements SustainabilityRepository {
  @override
  Future<List<Lesson>> getLessons() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return SustainabilityMockData.getExtendedLessons();
  }

  @override
  Future<List<Category>> getCategories() async {
    return const [
      Category(id: 'found', title: 'Foundations', description: 'Basics of digital carbon', icon: 'lightbulb'),
      Category(id: 'data', title: 'Data Management', description: 'Clean your digital footprint', icon: 'storage'),
      Category(id: 'device', title: 'Device Care', description: 'Extend hardware lifespan', icon: 'smartphone'),
      Category(id: 'cloud', title: 'Cloud Computing', description: 'Green server strategies', icon: 'cloud'),
      Category(id: 'ai', title: 'AI Ethics', description: 'Sustainable artificial intelligence', icon: 'psychology'),
      Category(id: 'media', title: 'Streaming & Media', description: 'Eco-friendly consumption', icon: 'play_circle'),
    ];
  }

  @override
  Future<void> markLessonAsCompleted(String lessonId) async {
    // In a real app, update Isar/Backend
  }
}

final sustainabilityRepositoryProvider = Provider<SustainabilityRepository>((ref) {
  return SustainabilityRepositoryImpl();
});

final lessonsProvider = FutureProvider<List<Lesson>>((ref) {
  return ref.watch(sustainabilityRepositoryProvider).getLessons();
});

final categoriesProvider = FutureProvider<List<Category>>((ref) {
  return ref.watch(sustainabilityRepositoryProvider).getCategories();
});

