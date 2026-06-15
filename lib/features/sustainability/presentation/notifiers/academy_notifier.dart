import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/features/sustainability/domain/entities/lesson.dart';
import 'package:ecodcf/features/sustainability/domain/repositories/lessons_repository.dart';
import 'package:ecodcf/features/sustainability/data/repositories/lessons_repository_impl.dart';

final academyProvider = NotifierProvider<AcademyNotifier, AcademyState>(
  () => AcademyNotifier(),
);

class AcademyNotifier extends Notifier<AcademyState> {
  final LessonsRepository _repository = LessonsRepositoryImpl();

  @override
  AcademyState build() {
    return AcademyState(
      lessons: [],
      categories: _getCategories(),
      completedLessons: [],
    );
  }

  List<Category> _getCategories() {
    return [
      const Category(
        id: 'digital_sustainability',
        title: 'Digital Sustainability',
        description: 'Learn about sustainable digital practices',
        icon: 'assets/icons/device.png',
      ),
      const Category(
        id: 'ai_sustainability',
        title: 'AI Sustainability',
        description: 'Green AI and responsible AI usage',
        icon: 'assets/icons/ai.png',
      ),
      const Category(
        id: 'green_internet',
        title: 'Green Internet',
        description: 'Sustainable web and internet practices',
        icon: 'assets/icons/network.png',
      ),
      const Category(
        id: 'cloud_computing',
        title: 'Cloud Computing Impact',
        description: 'Understanding cloud environmental costs',
        icon: 'assets/icons/cloud.png',
      ),
      const Category(
        id: 'ewaste',
        title: 'E-Waste',
        description: 'Managing electronic waste responsibly',
        icon: 'assets/icons/ewaste.png',
      ),
      const Category(
        id: 'sdgs',
        title: 'SDGs',
        description: 'Connecting digital to Sustainable Development Goals',
        icon: 'assets/icons/sdg.png',
      ),
    ];
  }

  Future<void> init() async {
    final lessons = await _repository.getAllLessons();
    state = state.copyWith(lessons: lessons);
  }

  Future<void> loadLessonsByCategory(String categoryId) async {
    final lessons = await _repository.getLessonsByCategory(categoryId);
    state = state.copyWith(lessons: lessons);
  }

  Future<void> markLessonCompleted(String lessonId) async {
    await _repository.markLessonCompleted(lessonId);
    final updated = [...state.completedLessons, lessonId];
    state = state.copyWith(completedLessons: updated);
  }
}

class AcademyState {
  final List<Lesson> lessons;
  final List<Category> categories;
  final List<String> completedLessons;

  AcademyState({
    required this.lessons,
    required this.categories,
    required this.completedLessons,
  });

  AcademyState copyWith({
    List<Lesson>? lessons,
    List<Category>? categories,
    List<String>? completedLessons,
  }) {
    return AcademyState(
      lessons: lessons ?? this.lessons,
      categories: categories ?? this.categories,
      completedLessons: completedLessons ?? this.completedLessons,
    );
  }
}
