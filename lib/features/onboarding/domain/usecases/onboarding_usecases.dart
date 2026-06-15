import 'package:ecodcf/features/onboarding/domain/entities/onboarding_step.dart';
import 'package:ecodcf/features/onboarding/domain/repositories/onboarding_repository.dart';

abstract class GetOnboardingStepsUseCase {
  Future<List<OnboardingStep>> call();
}

class GetOnboardingStepsUseCaseImpl implements GetOnboardingStepsUseCase {
  final OnboardingRepository _repository;

  GetOnboardingStepsUseCaseImpl(this._repository);

  @override
  Future<List<OnboardingStep>> call() => _repository.getOnboardingSteps();
}
