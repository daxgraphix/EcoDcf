import 'package:isar/isar.dart';
import 'package:ecodcf/features/gamification/domain/entities/challenge.dart';

part 'challenge_model.g.dart';

@collection
class ChallengeModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String remoteId;

  late String title;

  late String description;

  late String icon;

  late int xpReward;

  @enumerated
  late ChallengeType type;

  late int targetValue;

  late double currentProgress;

  late bool isCompleted;

  DateTime? completedAt;

  Challenge toEntity() {
    return Challenge(
      id: remoteId,
      title: title,
      description: description,
      icon: icon,
      xpReward: xpReward,
      type: type,
      targetValue: targetValue,
      currentProgress: currentProgress,
      isCompleted: isCompleted,
      completedAt: completedAt,
    );
  }

  static ChallengeModel fromEntity(Challenge entity) {
    return ChallengeModel()
      ..remoteId = entity.id
      ..title = entity.title
      ..description = entity.description
      ..icon = entity.icon
      ..xpReward = entity.xpReward
      ..type = entity.type
      ..targetValue = entity.targetValue
      ..currentProgress = entity.currentProgress
      ..isCompleted = entity.isCompleted
      ..completedAt = entity.completedAt;
  }
}

