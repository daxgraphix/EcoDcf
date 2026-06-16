import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/features/sustainability/domain/entities/lesson.dart';
import 'package:ecodcf/core/design_system/colors/app_colors.dart';
import 'package:ecodcf/features/sustainability/presentation/notifiers/academy_notifier.dart';
import 'package:flutter/services.dart';

class LessonDetailPage extends ConsumerWidget {
  final Lesson? lesson;
  const LessonDetailPage({super.key, this.lesson});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (lesson == null) {
      return const Scaffold(body: Center(child: Text('Lesson not found')));
    }

    return _LessonView(
      lesson: lesson!,
      onMarkComplete: () {
        ref.read(academyProvider.notifier).markLessonCompleted(lesson!.id);
      },
    );
  }
}

class _LessonView extends StatefulWidget {
  final Lesson lesson;
  final VoidCallback onMarkComplete;

  const _LessonView({
    required this.lesson,
    required this.onMarkComplete,
  });

  @override
  State<_LessonView> createState() => _LessonViewState();
}

class _LessonViewState extends State<_LessonView> {
  final PageController _pageController = PageController();
  int _currentStep = 0; // 0 to n-1 are sections, n is quiz
  int? _selectedQuizAnswer;
  bool _quizSubmitted = false;
  bool _isCorrect = false;

  int get _totalSections => widget.lesson.sections.length;
  bool get _hasQuiz => widget.lesson.quizzes.isNotEmpty;
  int get _totalSteps => _totalSections + (_hasQuiz ? 1 : 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < _totalSteps - 1) {
      setState(() {
        _currentStep++;
      });
      _pageController.animateToPage(
        _currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      widget.onMarkComplete();
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Mission "${widget.lesson.title}" Completed!'),
          backgroundColor: AppColors.forestGreen,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: Text(widget.lesson.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.forestGreen,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: AppColors.forestGreen,
        child: const Icon(Icons.arrow_back, color: Colors.white),
      ),
      body: Column(
        children: [
          // Progress Indicator
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              children: List.generate(_totalSteps, (index) {
                return Expanded(
                  child: Container(
                    height: 4,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: index <= _currentStep
                          ? AppColors.forestGreen
                          : AppColors.grey300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                );
              }),
            ),
          ),

          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ...widget.lesson.sections
                    .map((section) => _buildSection(section)),
                if (_hasQuiz) _buildQuiz(widget.lesson.quizzes.first),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: (_currentStep == _totalSteps - 1 &&
                        _hasQuiz &&
                        !_quizSubmitted)
                    ? (_selectedQuizAnswer != null ? _submitQuiz : null)
                    : _nextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.forestGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  _currentStep < _totalSections - 1
                      ? 'Next: ${widget.lesson.sections[_currentStep + 1].title}'
                      : (_currentStep == _totalSections - 1 && _hasQuiz)
                          ? 'Start Quiz'
                          : (_currentStep == _totalSteps - 1 && _quizSubmitted)
                              ? 'Finish Mission'
                              : 'Complete Mission',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(LessonSection section) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.forestGreen.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              section.title.toUpperCase(),
              style: const TextStyle(
                color: AppColors.forestGreen,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            _getSectionEmoji(section.title),
            style: const TextStyle(fontSize: 48),
          ),
          const SizedBox(height: 16),
          Text(
            section.content,
            style: const TextStyle(
              fontSize: 18,
              height: 1.6,
              color: AppColors.grey800,
            ),
          ),
          if (section.imageUrl != null) ...[
            const SizedBox(height: 24),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(section.imageUrl!),
            ),
          ],
        ],
      ),
    );
  }

  String _getSectionEmoji(String title) {
    final t = title.toLowerCase();
    if (t.contains('briefing')) return '📋';
    if (t.contains('learn')) return '💡';
    if (t.contains('field')) return '🚀';
    return '📖';
  }

  Widget _buildQuiz(Quiz quiz) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'FINAL CHALLENGE',
            style: TextStyle(
              color: AppColors.forestGreen,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            quiz.question,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.grey900,
            ),
          ),
          const SizedBox(height: 32),
          ...quiz.options.asMap().entries.map((entry) {
            final index = entry.key;
            final option = entry.value;
            final isSelected = _selectedQuizAnswer == index;

            Color borderColor = AppColors.grey300;
            Color bgColor = Colors.white;

            if (_quizSubmitted) {
              if (index == quiz.correctAnswerIndex) {
                borderColor = AppColors.forestGreen;
                bgColor = AppColors.forestGreen.withValues(alpha: 0.1);
              } else if (isSelected && index != quiz.correctAnswerIndex) {
                borderColor = AppColors.forestGreen;
                bgColor = AppColors.forestGreen.withValues(alpha: 0.1);
              }
            } else if (isSelected) {
              borderColor = AppColors.forestGreen;
              bgColor = AppColors.forestGreen.withValues(alpha: 0.05);
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: InkWell(
                onTap: _quizSubmitted
                    ? null
                    : () {
                        HapticFeedback.lightImpact();
                        setState(() {
                          _selectedQuizAnswer = index;
                        });
                      },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: bgColor,
                    border: Border.all(color: borderColor, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          option.text,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: isSelected
                                ? AppColors.forestGreen
                                : AppColors.grey800,
                          ),
                        ),
                      ),
                      if (_quizSubmitted && index == quiz.correctAnswerIndex)
                        const Icon(Icons.check_circle,
                            color: AppColors.forestGreen)
else if (_quizSubmitted &&
          isSelected &&
          index != quiz.correctAnswerIndex)
        const Icon(Icons.cancel, color: AppColors.forestGreen)
                      else if (!_quizSubmitted)
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.forestGreen
                                  : AppColors.grey400,
                              width: 2,
                            ),
                          ),
                          child: isSelected
                              ? Center(
                                  child: Container(
                                    width: 12,
                                    height: 12,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.forestGreen,
                                    ),
                                  ),
                                )
                              : null,
                        ),
                    ],
                  ),
                ),
              ),
            );
          }),
          if (_quizSubmitted) ...[
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isCorrect
                    ? AppColors.forestGreen.withValues(alpha: 0.1)
                    : AppColors.forestGreen.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    _isCorrect ? Icons.stars : Icons.info_outline,
                    color: AppColors.forestGreen,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _isCorrect
                          ? 'Excellent! You\'ve mastered this mission.'
                          : 'Not quite right, but you\'ve learned something new! Keep going.',
                      style: const TextStyle(
                        color: AppColors.forestGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _submitQuiz() {
    setState(() {
      _quizSubmitted = true;
      _isCorrect =
          _selectedQuizAnswer == widget.lesson.quizzes.first.correctAnswerIndex;
    });
  }
}
