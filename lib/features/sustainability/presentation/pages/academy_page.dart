import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:ecodcf/features/sustainability/domain/entities/lesson.dart';
import 'package:ecodcf/features/sustainability/data/repositories/sustainability_repository_impl.dart';

class AcademyPage extends ConsumerWidget {
  const AcademyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final academyDataAsync = ref.watch(academyDataProvider);

    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('Eco Academy'),
        centerTitle: true,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearchDialog(context),
          ),
        ],
      ),
      body: academyDataAsync.when(
        data: (academyData) {
          final trainingGroundLessons = academyData.lessons.where((l) => l.category == 'Training Ground').toList();
          return CustomScrollView(
            slivers: [
              const SliverPadding(
                padding: EdgeInsets.all(AppSpacing.md),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Training Ground Missions',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: AppSpacing.sm),
                      Text(
                        'Master sustainability through interactive missions',
                        style: TextStyle(color: AppColors.grey600),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index >= trainingGroundLessons.length) return null;
                      final lesson = trainingGroundLessons[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.md),
                        child: _LessonCard(lesson: lesson),
                      );
                    },
                    childCount: trainingGroundLessons.length,
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search Lessons'),
        content: const TextField(
          decoration: InputDecoration(hintText: 'Enter lesson title...'),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }
}

class _LessonCard extends StatelessWidget {
  final Lesson lesson;
  const _LessonCard({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: const BorderSide(color: AppColors.grey200),
      ),
      child: InkWell(
        onTap: () =>
            GoRouter.of(context).push('/academy/lesson', extra: lesson),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.forestGreen, AppColors.leafGreen],
                  ),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Icon(
                  _getCategoryIcon(lesson.category),
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      lesson.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.grey600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      children: [
                        _buildChip(const Icon(Icons.timer_outlined, size: 14),
                            '${lesson.durationMinutes} min'),
                        const SizedBox(width: AppSpacing.md),
                        _buildChip(const Icon(Icons.quiz_outlined, size: 14),
                            '${lesson.quizzes.length} Quiz'),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.grey400),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(Icon icon, String text) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(color: AppColors.grey500, fontSize: 12),
        ),
      ],
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Foundations':
        return Icons.lightbulb;
      case 'Device Care':
        return Icons.smartphone;
      case 'Cloud Computing':
        return Icons.cloud;
      case 'AI Ethics':
        return Icons.psychology;
      case 'Streaming & Media':
        return Icons.play_circle;
      default:
        return Icons.book;
    }
  }
}
