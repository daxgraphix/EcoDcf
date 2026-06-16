import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'eco_coach_provider.g.dart';

@riverpod
class EcoCoach extends _$EcoCoach {
  @override
  String build() {
    return "You're doing great! Try to reduce your streaming time today.";
  }

  void updateInsight(String newInsight) {
    state = newInsight;
  }
}
