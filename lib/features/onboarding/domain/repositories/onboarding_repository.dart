import 'package:ecodcf/features/onboarding/domain/entities/onboarding_step.dart';

abstract class OnboardingRepository {
  Future<List<OnboardingStep>> getOnboardingSteps();
}
