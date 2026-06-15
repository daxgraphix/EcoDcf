import 'package:isar/isar.dart';
import 'package:ecodcf/features/gamification/domain/entities/challenge.dart';

part 'badge_model.g.dart';

@collection
class BadgeModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String remoteId;

  late String title;

  late String description;

  late String icon;

  late int xpRequired;

  late bool isUnlocked;

  DateTime? unlockedAt;

  GamificationBadge toEntity() {
    return GamificationBadge(
      id: remoteId,
      title: title,
      description: description,
      icon: icon,
      xpRequired: xpRequired,
      isUnlocked: isUnlocked,
      unlockedAt: unlockedAt,
    );
  }

  static BadgeModel fromEntity(GamificationBadge entity) {
    return BadgeModel()
      ..remoteId = entity.id
      ..title = entity.title
      ..description = entity.description
      ..icon = entity.icon
      ..xpRequired = entity.xpRequired
      ..isUnlocked = entity.isUnlocked
      ..unlockedAt = entity.unlockedAt;
  }
}

