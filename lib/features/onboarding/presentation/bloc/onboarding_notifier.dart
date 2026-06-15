import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/features/onboarding/domain/entities/onboarding_step.dart';
import 'package:ecodcf/core/providers/preferences_provider.dart';

final onboardingProvider = StateNotifierProvider<OnboardingNotifier, OnboardingState>(
  (ref) => OnboardingNotifier(ref),
);

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  final Ref _ref;
  OnboardingNotifier(this._ref) : super(OnboardingInitial()) {
    loadSteps();
  }

  void loadSteps() {
    state = OnboardingLoading();
    final steps = [
      const OnboardingStep(
        title: 'Hidden Carbon Costs',
        description: 'Did you know the internet produces ~3.7% of global greenhouse gas emissions? That\'s more than the aviation industry.',
        icon: '☁️',
      ),
      const OnboardingStep(
        title: 'Streaming & Data',
        description: 'Streaming 1 hour of HD video emits ~60g of CO2e. We help you track these invisible impacts in real-time.',
        icon: '📱',
      ),
      const OnboardingStep(
        title: 'Science-Backed Tracking',
        description: 'EcoDcf uses the latest research from IEA and The Shift Project to calculate your exact digital footprint.',
        icon: '🔬',
      ),
      const OnboardingStep(
        title: 'Empowering Change',
        description: 'Small habits like clearing emails or using dark mode can save kilos of CO2 annually. Join the movement.',
        icon: '🌿',
      ),
    ];
    state = OnboardingLoaded(steps);
  }

  Future<void> completeOnboarding() async {
    await _ref.read(userPreferencesProvider.notifier).completeOnboarding();
  }
}

abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class OnboardingLoading extends OnboardingState {}

class OnboardingLoaded extends OnboardingState {
  final List<OnboardingStep> steps;

  OnboardingLoaded(this.steps);
}
