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
    return academyDataAsync.when(
      data: (academyData) {
        final categories = academyData.categories;
        final selectedCategory = ValueNotifier<String?>(categories.isNotEmpty ? categories.first.id : null);

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
          floatingActionButton: Navigator.canPop(context)
              ? FloatingActionButton(
                  onPressed: () => Navigator.pop(context),
                  backgroundColor: AppColors.forestGreen,
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                )
              : null,
          body: ValueListenableBuilder<String?>(
            valueListenable: selectedCategory,
            builder: (context, selectedCategoryId, child) {
              final selectedCategoryTitle = selectedCategoryId == null
                  ? null
                  : academyData.categories.firstWhere((c) => c.id == selectedCategoryId,orElse: () => categories.first).title;
              final filteredLessons = selectedCategoryTitle == null
                  ? academyData.lessons
                  : academyData.lessons.where((l) => l.category == selectedCategoryTitle).toList();

              return CustomScrollView(
                slivers: [
                  const SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: AppSpacing.md),
                          Text(
                            'Eco Academy',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: AppSpacing.xs),
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
                    sliver: SliverToBoxAdapter(
                      child: _CategorySelector(
                        categories: categories,
                        selectedId: selectedCategoryId,
                        onSelected: (id) => selectedCategory.value = id,
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          if (index >= filteredLessons.length) return null;
                          final lesson = filteredLessons[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: AppSpacing.md),
                            child: _LessonCard(lesson: lesson),
                          );
                        },
                        childCount: filteredLessons.length,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (err, stack) => Scaffold(
        body: Center(child: Text('Error: $err')),
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

class _CategorySelector extends StatelessWidget {
  final List<Category> categories;
  final String? selectedId;
  final ValueChanged<String?> onSelected;

  const _CategorySelector({
    required this.categories,
    required this.selectedId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isSelected = cat.id == selectedId;
          return GestureDetector(
            onTap: () => onSelected(cat.id),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 100,
              margin: const EdgeInsets.only(right: AppSpacing.md),
              decoration: BoxDecoration(
                gradient: isSelected
                    ? const LinearGradient(
                        colors: [AppColors.forestGreen, AppColors.leafGreen],
                      )
                    : null,
                color: isSelected ? null : Colors.white,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                boxShadow: [
                  BoxShadow(
                    color: (isSelected ? AppColors.forestGreen : Colors.black)
                        .withValues(alpha: isSelected ? 0.3 : 0.05),
                    blurRadius: isSelected ? 12 : 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: (isSelected ? Colors.white : AppColors.forestGreen)
                          .withValues(alpha: isSelected ? 0.2 : 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _getIconData(cat.icon),
                      color: isSelected ? Colors.white : AppColors.forestGreen,
                      size: 24,
                    ),
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
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'military_tech':
        return Icons.military_tech;
      case 'lightbulb':
        return Icons.lightbulb;
      case 'smartphone':
        return Icons.smartphone;
      case 'cloud':
        return Icons.cloud;
      case 'psychology':
        return Icons.psychology;
      case 'play_circle':
        return Icons.play_circle;
      default:
        return Icons.book;
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
      case 'Training Ground':
        return Icons.military_tech;
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
