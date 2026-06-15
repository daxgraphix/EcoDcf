import 'package:ecodcf/features/onboarding/domain/entities/onboarding_step.dart';
import 'package:ecodcf/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  @override
  Future<List<OnboardingStep>> getOnboardingSteps() async {
    return [];
  }
}
