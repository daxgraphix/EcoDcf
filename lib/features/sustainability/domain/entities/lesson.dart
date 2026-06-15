import 'package:equatable/equatable.dart';

class Lesson extends Equatable {
  final String id;
  final String title;
  final String description;
  final String content;
  final String category;
  final int durationMinutes;
  final String icon;
  final bool isCompleted;
  final DateTime? completedAt;
  final List<Quiz> quizzes;
  final List<LessonSection> sections;

  const Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.category,
    required this.durationMinutes,
    required this.icon,
    this.isCompleted = false,
    this.completedAt,
    this.quizzes = const [],
    this.sections = const [],
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        content,
        category,
        durationMinutes,
        icon,
        isCompleted,
        completedAt,
        quizzes,
        sections,
      ];

  Lesson copyWith({
    String? id,
    String? title,
    String? description,
    String? content,
    String? category,
    int? durationMinutes,
    String? icon,
    bool? isCompleted,
    DateTime? completedAt,
    List<Quiz>? quizzes,
    List<LessonSection>? sections,
  }) {
    return Lesson(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      content: content ?? this.content,
      category: category ?? this.category,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      icon: icon ?? this.icon,
      isCompleted: isCompleted ?? this.isCompleted,
      completedAt: completedAt ?? this.completedAt,
      quizzes: quizzes ?? this.quizzes,
      sections: sections ?? this.sections,
    );
  }
}

class Quiz extends Equatable {
  final String id;
  final String question;
  final List<QuizOption> options;
  final int correctAnswerIndex;

  const Quiz({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });

  @override
  List<Object?> get props => [id, question, options, correctAnswerIndex];
}

class QuizOption extends Equatable {
  final String text;
  final bool isCorrect;

  const QuizOption({required this.text, this.isCorrect = false});

  @override
  List<Object?> get props => [text, isCorrect];
}

class LessonSection extends Equatable {
  final String title;
  final String content;
  final String? imageUrl;

  const LessonSection({
    required this.title,
    required this.content,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [title, content, imageUrl];
}

class Category {
  final String id;
  final String title;
  final String description;
  final String icon;

  const Category({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
  });
}