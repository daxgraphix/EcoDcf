import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/features/education/domain/entities/education_lesson.dart';

final educationProvider = StateNotifierProvider<EducationNotifier, EducationState>((ref) {
  return EducationNotifier();
});

abstract class EducationState {}

class EducationInitial extends EducationState {}

class EducationLoading extends EducationState {}

class EducationLoaded extends EducationState {
  final List<EducationLesson> lessons;

  EducationLoaded(this.lessons);
}

class EducationError extends EducationState {
  final String message;

  EducationError(this.message);
}

class EducationNotifier extends StateNotifier<EducationState> {
  EducationNotifier() : super(EducationInitial());
}
