import 'package:equatable/equatable.dart';

class Challenge extends Equatable {
  final String id;
  final String title;
  final String description;
  final String icon;
  final int xpReward;
  final ChallengeType type;
  final int targetValue;
  final double currentProgress;
  final bool isCompleted;
  final DateTime? completedAt;

  const Challenge({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.xpReward,
    required this.type,
    required this.targetValue,
    this.currentProgress = 0,
    this.isCompleted = false,
    this.completedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        icon,
        xpReward,
        type,
        targetValue,
        currentProgress,
        isCompleted,
        completedAt,
      ];

  Challenge copyWith({
    String? id,
    String? title,
    String? description,
    String? icon,
    int? xpReward,
    ChallengeType? type,
    int? targetValue,
    double? currentProgress,
    bool? isCompleted,
    DateTime? completedAt,
  }) {
    return Challenge(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      xpReward: xpReward ?? this.xpReward,
      type: type ?? this.type,
      targetValue: targetValue ?? this.targetValue,
      currentProgress: currentProgress ?? this.currentProgress,
      isCompleted: isCompleted ?? this.isCompleted,
      completedAt: completedAt ?? this.completedAt,
    );
  }
}

enum ChallengeType {
  email,
  streaming,
  cloud,
  ai,
  device,
  search,
  social,
  carbon,
  education,
}

class GamificationBadge extends Equatable {
  final String id;
  final String title;
  final String description;
  final String icon;
  final int xpRequired;
  final bool isUnlocked;
  final DateTime? unlockedAt;

  const GamificationBadge({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.xpRequired,
    this.isUnlocked = false,
    this.unlockedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        icon,
        xpRequired,
        isUnlocked,
        unlockedAt,
      ];

  GamificationBadge copyWith({
    String? id,
    String? title,
    String? description,
    String? icon,
    int? xpRequired,
    bool? isUnlocked,
    DateTime? unlockedAt,
  }) {
    return GamificationBadge(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      xpRequired: xpRequired ?? this.xpRequired,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      unlockedAt: unlockedAt ?? this.unlockedAt,
    );
  }
}