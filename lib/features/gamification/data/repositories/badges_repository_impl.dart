import 'package:isar/isar.dart';
import 'package:ecodcf/features/gamification/domain/entities/challenge.dart';
import 'package:ecodcf/features/gamification/domain/repositories/gamification_repository.dart';
import 'package:ecodcf/features/gamification/data/models/badge_model.dart';

class BadgesRepositoryImpl implements BadgesRepository {
  final Isar _isar;

  BadgesRepositoryImpl(this._isar);

  @override
  Future<List<GamificationBadge>> getAllBadges() async {
    final models = await _isar.badgeModels.where().findAll();
    if (models.isEmpty) {
      // Seed initial badges if empty
      await _seedBadges();
      return getAllBadges();
    }
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<GamificationBadge>> getUnlockedBadges() async {
    final models = await _isar.badgeModels.filter().isUnlockedEqualTo(true).findAll();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<void> unlockBadge(String id) async {
    await _isar.writeTxn(() async {
      final model = await _isar.badgeModels.filter().remoteIdEqualTo(id).findFirst();
      if (model != null) {
        model.isUnlocked = true;
        model.unlockedAt = DateTime.now();
        await _isar.badgeModels.put(model);
      }
    });
  }

  Future<void> _seedBadges() async {
    final initialBadges = [
      const GamificationBadge(
        id: 'digital_minimalist',
        title: 'Digital Minimalist',
        description: 'Maintain low device usage for a week',
        icon: 'assets/icons/device.png',
        xpRequired: 1000,
      ),
      const GamificationBadge(
        id: 'email_cleaner',
        title: 'Email Cleaner',
        description: 'Reduce email usage significantly',
        icon: 'assets/icons/email.png',
        xpRequired: 500,
      ),
      const GamificationBadge(
        id: 'green_streamer',
        title: 'Green Streamer',
        description: 'Stream videos sustainably',
        icon: 'assets/icons/video.png',
        xpRequired: 750,
      ),
      const GamificationBadge(
        id: 'cloud_optimizer',
        title: 'Cloud Optimizer',
        description: 'Optimize cloud storage usage',
        icon: 'assets/icons/cloud.png',
        xpRequired: 1500,
      ),
      const GamificationBadge(
        id: 'ai_efficient',
        title: 'AI Efficient User',
        description: 'Use AI tools responsibly',
        icon: 'assets/icons/ai.png',
        xpRequired: 2000,
      ),
    ];

    await _isar.writeTxn(() async {
      for (final badge in initialBadges) {
        await _isar.badgeModels.put(BadgeModel.fromEntity(badge));
      }
    });
  }
}

