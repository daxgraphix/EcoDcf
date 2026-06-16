import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/features/sustainability/domain/entities/lesson.dart';
import 'package:ecodcf/features/sustainability/data/repositories/sustainability_repository_impl.dart';

final academyProvider = NotifierProvider<AcademyNotifier, AcademyState>(
  () => AcademyNotifier(),
);

class AcademyNotifier extends Notifier<AcademyState> {
  late final Future<SustainabilityRepository> _repositoryFuture;

  @override
  AcademyState build() {
    _repositoryFuture = ref.watch(sustainabilityRepositoryAsyncProvider.future);
    return AcademyState(
      lessons: [],
      categories: [],
      completedLessons: [],
      isLoading: true,
    );
  }

  Future<void> _loadInitialData() async {
    final repository = await _repositoryFuture;
    final categories = await repository.getCategories();
    final lessons = await repository.getLessons();
    state = state.copyWith(
      categories: categories,
      lessons: lessons,
      isLoading: false,
    );
  }

  Future<void> init() async {
    await _loadInitialData();
  }

  Future<void> refresh() async {
    state = state.copyWith(isLoading: true);
    await _loadInitialData();
  }

  Future<void> markLessonCompleted(String lessonId) async {
    final repository = await _repositoryFuture;
    await repository.markLessonAsCompleted(lessonId);
    final updated = [...state.completedLessons, lessonId];
    state = state.copyWith(completedLessons: updated);
  }
}

class AcademyState {
  final List<Lesson> lessons;
  final List<Category> categories;
  final List<String> completedLessons;
  final bool isLoading;

  AcademyState({
    required this.lessons,
    required this.categories,
    required this.completedLessons,
    this.isLoading = false,
  });

  AcademyState copyWith({
    List<Lesson>? lessons,
    List<Category>? categories,
    List<String>? completedLessons,
    bool? isLoading,
  }) {
    return AcademyState(
      lessons: lessons ?? this.lessons,
      categories: categories ?? this.categories,
      completedLessons: completedLessons ?? this.completedLessons,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
