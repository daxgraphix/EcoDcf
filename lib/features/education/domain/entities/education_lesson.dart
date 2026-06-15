import 'package:equatable/equatable.dart';

class EducationLesson extends Equatable {
  final String id;
  final String title;
  final String description;
  final String content;
  final int durationMinutes;
  final String category;

  const EducationLesson({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.durationMinutes,
    required this.category,
  });

  @override
  List<Object?> get props => [id, title, description, content, durationMinutes, category];
}