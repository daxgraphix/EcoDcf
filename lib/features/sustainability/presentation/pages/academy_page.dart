import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:ecodcf/features/sustainability/presentation/notifiers/academy_notifier.dart';
import 'package:ecodcf/features/sustainability/domain/entities/lesson.dart';

class AcademyPage extends ConsumerStatefulWidget {
  const AcademyPage({super.key});

  @override
  ConsumerState<AcademyPage> createState() => _AcademyPageState();
}

class _AcademyPageState extends ConsumerState<AcademyPage> {
  String selectedCategoryId = 'digital_sustainability';

  @override
  Widget build(BuildContext context) {
    final academyState = ref.watch(academyProvider);

    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: const Text('Eco Academy'),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                itemCount: academyState.categories.length,
                itemBuilder: (context, index) {
                  final cat = academyState.categories[index];
                  final isSelected = selectedCategoryId == cat.id;
                  return GestureDetector(
                    onTap: () => setState(() => selectedCategoryId = cat.id),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 100,
                      margin: const EdgeInsets.only(right: AppSpacing.md, top: AppSpacing.md),
                      padding: const EdgeInsets.all(AppSpacing.sm),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.forestGreen : Colors.white,
                        borderRadius: BorderRadius.circular(AppRadius.lg),
                        boxShadow: isSelected
                            ? [BoxShadow(color: AppColors.forestGreen.withValues(alpha: 0.3), blurRadius: 8, offset: const Offset(0, 4))]
                            : [],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _getIconData(cat.icon),
                            color: isSelected ? Colors.white : AppColors.forestGreen,
                            size: 32,
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            cat.title,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : AppColors.dark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.all(AppSpacing.md),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Recommended for You',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final filteredLessons = academyState.lessons.where((l) => l.category == selectedCategoryId).toList();
                  if (index >= filteredLessons.length) return null;
                  final lesson = filteredLessons[index];
                  return _LessonCard(lesson: lesson);
                },
                childCount: academyState.lessons.where((l) => l.category == selectedCategoryId).length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'lightbulb': return Icons.lightbulb_outline;
      case 'storage': return Icons.storage;
      case 'smartphone': return Icons.smartphone;
      case 'cloud': return Icons.cloud_queue;
      case 'psychology': return Icons.psychology;
      case 'play_circle': return Icons.play_circle_outline;
      default: return Icons.book;
    }
  }
}

class _LessonCard extends StatelessWidget {
  final Lesson lesson;
  const _LessonCard({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: const BorderSide(color: AppColors.grey200),
      ),
      child: InkWell(
        onTap: () => GoRouter.of(context).push('/academy/lesson', extra: lesson),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.leafGreen.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Icon(
                  _getCategoryIcon(lesson.category),
                  color: AppColors.leafGreen,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      lesson.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: AppColors.grey600, fontSize: 13),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      children: [
                        const Icon(Icons.timer_outlined, size: 14, color: AppColors.grey500),
                        const SizedBox(width: 4),
                        Text('${lesson.durationMinutes} min', style: const TextStyle(color: AppColors.grey500, fontSize: 12)),
                        const SizedBox(width: AppSpacing.md),
                        const Icon(Icons.quiz_outlined, size: 14, color: AppColors.grey500),
                        const SizedBox(width: 4),
                        Text('${lesson.quizzes.length} Quiz', style: const TextStyle(color: AppColors.grey500, fontSize: 12)),
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

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Foundations': return Icons.lightbulb;
      case 'Data Management': return Icons.storage;
      case 'Device Care': return Icons.smartphone;
      case 'Cloud Computing': return Icons.cloud;
      case 'AI Ethics': return Icons.psychology;
      case 'Streaming & Media': return Icons.play_circle;
      default: return Icons.book;
    }
  }
}

