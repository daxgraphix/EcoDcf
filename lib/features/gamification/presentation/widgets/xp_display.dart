import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/core/design_system/colors/app_colors.dart';
import 'package:ecodcf/features/gamification/domain/entities/challenge.dart';
import 'package:ecodcf/features/gamification/presentation/notifiers/gamification_notifier.dart';

class XPDisplay extends ConsumerWidget {
  const XPDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gamificationProvider);
    final challenges = state.value ?? const <Challenge>[];
    final totalXP = challenges
        .where((challenge) => challenge.isCompleted)
        .fold<int>(0, (sum, challenge) => sum + challenge.xpReward);
    final currentLevel = (totalXP ~/ 1000) + 1;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.forestGreen, AppColors.ecoBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Level',
            style: TextStyle(color: Colors.white.withValues(alpha: 0.9)),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Level $currentLevel',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                '$totalXP XP',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: ((totalXP % 1000) / 1000).clamp(0, 1),
            backgroundColor: Colors.white.withValues(alpha: 0.3),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class BadgeDisplay extends StatelessWidget {
  final String id;
  final String title;
  final String icon;
  final bool isUnlocked;

  const BadgeDisplay({
    super.key,
    required this.id,
    required this.title,
    required this.icon,
    required this.isUnlocked,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: isUnlocked ? AppColors.success : AppColors.grey200,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.star,
            color: isUnlocked ? Colors.white : AppColors.grey600,
            size: 32,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            color: isUnlocked ? AppColors.forestGreen : AppColors.grey600,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class BadgeGrid extends ConsumerWidget {
  const BadgeGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gamificationProvider);
    final challenges = state.value ?? const <Challenge>[];
    final totalXP = challenges
        .where((challenge) => challenge.isCompleted)
        .fold<int>(0, (sum, challenge) => sum + challenge.xpReward);
    final unlockedBadges = _unlockedBadges(totalXP);

    const badges = [
      GamificationBadge(id: 'email_cleaner', title: 'Email Cleaner', description: '', icon: '', xpRequired: 500),
      GamificationBadge(id: 'digital_minimalist', title: 'Digital Minimalist', description: '', icon: '', xpRequired: 1000),
      GamificationBadge(id: 'green_streamer', title: 'Green Streamer', description: '', icon: '', xpRequired: 750),
      GamificationBadge(id: 'cloud_optimizer', title: 'Cloud Optimizer', description: '', icon: '', xpRequired: 1500),
      GamificationBadge(id: 'ai_efficient', title: 'AI Efficient', description: '', icon: '', xpRequired: 2000),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Badges', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 5,
          children: badges.map((b) => BadgeDisplay(
                id: b.id,
                title: b.title,
                icon: b.icon,
                isUnlocked: unlockedBadges.any((ub) => ub.id == b.id),
              )).toList(growable: false),
        ),
      ],
    );
  }
}

List<GamificationBadge> _unlockedBadges(int totalXP) {
  return const [
    GamificationBadge(id: 'email_cleaner', title: 'Email Cleaner', description: '', icon: '', xpRequired: 500),
    GamificationBadge(id: 'digital_minimalist', title: 'Digital Minimalist', description: '', icon: '', xpRequired: 1000),
    GamificationBadge(id: 'green_streamer', title: 'Green Streamer', description: '', icon: '', xpRequired: 750),
    GamificationBadge(id: 'cloud_optimizer', title: 'Cloud Optimizer', description: '', icon: '', xpRequired: 1500),
    GamificationBadge(id: 'ai_efficient', title: 'AI Efficient', description: '', icon: '', xpRequired: 2000),
  ].where((badge) => totalXP >= badge.xpRequired).toList(growable: false);
}

