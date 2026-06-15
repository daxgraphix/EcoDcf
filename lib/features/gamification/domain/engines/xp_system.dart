import 'package:ecodcf/features/gamification/domain/entities/challenge.dart';

class XPSystem {
  int _totalXP = 0;
  final Map<String, GamificationBadge> _unlockedBadges = {};
  final List<int> _levelThresholds = [0, 500, 1000, 2000, 5000, 10000];

  int get totalXP => _totalXP;
  int get currentLevel => _levelThresholds.firstWhere((t) => t > _totalXP, orElse: () => _totalXP);

  void addXP(int xp) {
    _totalXP += xp;
  }

  bool checkBadgeUnlock(GamificationBadge badge) {
    if (_totalXP >= badge.xpRequired && !badge.isUnlocked) {
      _unlockedBadges[badge.id] = badge;
      return true;
    }
    return false;
  }

  List<GamificationBadge> getUnlockedBadges() => _unlockedBadges.values.toList();

  int getNextLevelXP() {
    for (final threshold in _levelThresholds) {
      if (threshold > _totalXP) return threshold;
    }
    return _totalXP;
  }

  int getXPForNextLevel() => (getNextLevelXP() - _totalXP).clamp(0, double.infinity).toInt();
}
