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
  String selectedCategoryId = 'training';
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
                onPressed: () => _showSearchDialog(context),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: _buildCategorySelector(academyState),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.md),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedCategoryId == 'training'
                        ? 'Training Ground Missions'
                        : 'Recommended for You',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.forestGreen.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppSpacing.xs),
                    ),
                    child: Text(
                      '${_getFilteredLessons(academyState).length} Lessons',
                      style: const TextStyle(
                        color: AppColors.forestGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          academyState.isLoading
              ? const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(AppSpacing.xl),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                )
              : SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final filteredLessons = _getFilteredLessons(academyState);
                        if (index >= filteredLessons.length) return null;
                        final lesson = filteredLessons[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: AppSpacing.md),
                          child: _LessonCard(lesson: lesson),
                        );
                      },
                      childCount: _getFilteredLessons(academyState).length,
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  List<Lesson> _getFilteredLessons(academyState) {
    return academyState.lessons.where((l) {
      final category = academyState.categories.firstWhere(
        (c) => c.id == selectedCategoryId,
        orElse: () => academyState.categories.first,
      );
      return l.category.toLowerCase() == category.title.toLowerCase();
    }).toList();
  }

  Widget _buildCategorySelector(academyState) {
    return SizedBox(
      height: 120,
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
                    color: (isSelected
                            ? AppColors.forestGreen
                            : Colors.black)
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
                      color: (isSelected
                              ? Colors.white
                              : AppColors.forestGreen)
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

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search Lessons'),
        content: TextField(
          controller: _searchController,
          decoration: const InputDecoration(hintText: 'Enter lesson title...'),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Implement search logic
              Navigator.pop(context);
            },
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'military_tech':
        return Icons.military_tech;
      case 'lightbulb':
        return Icons.lightbulb_outline;
      case 'smartphone':
        return Icons.smartphone;
      case 'cloud':
        return Icons.cloud_queue;
      case 'psychology':
        return Icons.psychology;
      case 'play_circle':
        return Icons.play_circle_outline;
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
