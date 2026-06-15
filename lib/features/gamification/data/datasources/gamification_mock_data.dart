import 'package:ecodcf/features/gamification/domain/entities/challenge.dart';

class GamificationMockData {
  static List<Challenge> getExtendedChallenges() {
    return const [
      Challenge(
        id: 'c1',
        title: 'Dark Mode Warrior',
        description: 'Keep Dark Mode enabled for 24 hours to save OLED battery.',
        icon: 'dark_mode',
        type: ChallengeType.device,
        targetValue: 24,
        currentProgress: 12,
        xpReward: 150,
      ),
      Challenge(
        id: 'c2',
        title: 'Email Purge',
        description: 'Unsubscribe from 10 unused newsletters.',
        icon: 'email',
        type: ChallengeType.carbon,
        targetValue: 10,
        currentProgress: 3,
        xpReward: 200,
      ),
      Challenge(
        id: 'c3',
        title: 'Streaming Detox',
        description: 'Limit video streaming to less than 1 hour today.',
        icon: 'play_circle',
        type: ChallengeType.carbon,
        targetValue: 1,
        currentProgress: 0,
        xpReward: 300,
      ),
      Challenge(
        id: 'c4',
        title: 'Tab Minimalist',
        description: 'Keep fewer than 5 browser tabs open for 3 hours.',
        icon: 'tab',
        type: ChallengeType.device,
        targetValue: 3,
        currentProgress: 1,
        xpReward: 100,
      ),
      Challenge(
        id: 'c5',
        title: 'Eco-Informer',
        description: 'Complete 5 Academy lessons this week.',
        icon: 'school',
        type: ChallengeType.education,
        targetValue: 5,
        currentProgress: 2,
        xpReward: 500,
      ),
    ];
  }
}

