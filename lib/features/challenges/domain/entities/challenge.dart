import 'package:equatable/equatable.dart';

class Challenge extends Equatable {
  final String id;
  final String title;
  final String description;
  final String icon;
  final int xpReward;
  final bool isCompleted;
  final DateTime? completedAt;

  const Challenge({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.xpReward,
    this.isCompleted = false,
    this.completedAt,
  });

  @override
  List<Object?> get props => [id, title, description, icon, xpReward, isCompleted, completedAt];

  Challenge copyWith({String? id, String? title, String? description, String? icon, int? xpReward, bool? isCompleted, DateTime? completedAt}) {
    return Challenge(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      xpReward: xpReward ?? this.xpReward,
      isCompleted: isCompleted ?? this.isCompleted,
      completedAt: completedAt ?? this.completedAt,
    );
  }
}