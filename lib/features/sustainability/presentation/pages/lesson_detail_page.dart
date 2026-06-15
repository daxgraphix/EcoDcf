import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/features/sustainability/domain/entities/lesson.dart';
import 'package:ecodcf/core/design_system/colors/app_colors.dart';
import 'package:ecodcf/features/sustainability/presentation/notifiers/academy_notifier.dart';

class LessonDetailPage extends ConsumerWidget {
  const LessonDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(academyProvider);
    final lessonId = ModalRoute.of(context)?.settings.arguments as String? ?? '';
    final lesson = state.lessons.isEmpty
        ? const Lesson(id: '', title: '', description: '', content: '', category: '', durationMinutes: 0, icon: '')
        : state.lessons.firstWhere((l) => l.id == lessonId, orElse: () => state.lessons.first);

    return _LessonView(
      lesson: lesson,
      onQuizComplete: (score) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Quiz Score: $score%')),
        );
      },
      onMarkComplete: () {
        ref.read(academyProvider.notifier).markLessonCompleted(lesson.id);
      },
    );
  }
}

class _LessonView extends StatefulWidget {
  final Lesson lesson;
  final Function(int score) onQuizComplete;
  final VoidCallback onMarkComplete;

  const _LessonView({required this.lesson, required this.onQuizComplete, required this.onMarkComplete});

  @override
  State<_LessonView> createState() => _LessonViewState();
}

class _LessonViewState extends State<_LessonView> {
  int _currentSectionIndex = 0;
  int? _selectedAnswer;
  int _quizScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: Text(widget.lesson.title),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.forestGreen,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.lesson.title,
                    style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.lesson.description,
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.9)),
                  ),
                  const SizedBox(height: 8),
                  Text('${widget.lesson.durationMinutes} minutes', style: TextStyle(color: Colors.white.withValues(alpha: 0.8))),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: _buildContent(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (widget.lesson.quizzes.isNotEmpty) {
                    _showQuizDialog();
                  } else {
                    widget.onMarkComplete();
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.forestGreen),
                child: Text(widget.lesson.quizzes.isNotEmpty ? 'Take Quiz' : 'Mark as Complete'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (widget.lesson.sections.isNotEmpty) {
      final section = widget.lesson.sections[_currentSectionIndex];
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(section.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Text(section.content, style: Theme.of(context).textTheme.bodyMedium),
          if (section.imageUrl != null) ...[
            const SizedBox(height: 12),
            Image.asset(section.imageUrl!, height: 120),
          ],
          if (widget.lesson.sections.length > 1) ...[
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.lesson.sections.length,
                (i) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentSectionIndex == i ? AppColors.forestGreen : Colors.grey[300],
                  ),
                ),
              ),
            ),
          ],
        ],
      );
    }
    return SingleChildScrollView(child: Text(widget.lesson.content));
  }

  void _showQuizDialog() {
    final quiz = widget.lesson.quizzes.first;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Quiz: ${quiz.question}'),
        content: RadioGroup<int>(
          groupValue: _selectedAnswer,
          onChanged: (value) => setState(() => _selectedAnswer = value),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: quiz.options.asMap().map((i, option) {
              return MapEntry(
                i,
                RadioListTile<int>.adaptive(
                  title: Text(option.text),
                  value: i,
                ),
              );
            }).values.toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: _selectedAnswer == null
                ? null
                : () {
                    final isCorrect = _selectedAnswer == quiz.correctAnswerIndex;
                    if (isCorrect) _quizScore += quiz.options.length;
                    Navigator.pop(context);
                    if (_currentSectionIndex < widget.lesson.sections.length - 1) {
                      setState(() => _currentSectionIndex++);
                    } else {
                      final totalScore = (_quizScore / widget.lesson.quizzes.fold(0, (sum, q) => sum + q.options.length) * 100).round();
                      widget.onQuizComplete(totalScore);
                      widget.onMarkComplete();
                      Navigator.pop(context);
                    }
                  },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
