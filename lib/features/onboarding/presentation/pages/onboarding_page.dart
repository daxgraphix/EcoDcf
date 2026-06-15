import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/features/onboarding/domain/entities/onboarding_step.dart';
import 'package:ecodcf/features/onboarding/presentation/bloc/onboarding_notifier.dart';
import 'package:ecodcf/core/design_system/colors/app_colors.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingProvider);
    final steps = state is OnboardingLoaded ? state.steps.cast<OnboardingStep>().toList() : <OnboardingStep>[];

    return Scaffold(
      backgroundColor: AppColors.forestGreen,
      body: steps.isNotEmpty
          ? Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: steps.length,
                    onPageChanged: (index) => setState(() => _currentPage = index),
                    itemBuilder: (context, index) {
                      final step = steps[index];
                      return _buildOnboardingStep(step);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DotIndicator(count: steps.length, currentIndex: _currentPage),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.forestGreen,
                        ),
                        onPressed: () {
                          if (_currentPage < steps.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            ref.read(onboardingProvider.notifier).completeOnboarding();
                            // Splash will auto-redirect due to riverpod watch, 
                            // but we can also manually navigate
                          }
                        },
                        child: Text(_currentPage == steps.length - 1 ? 'Get Started' : 'Next'),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator(color: Colors.white)),
    );
  }

  Widget _buildOnboardingStep(OnboardingStep step) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            step.icon,
            style: const TextStyle(fontSize: 80),
          ),
          const SizedBox(height: 32),
          Text(
            step.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            step.description,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;

  const DotIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Dot(active: index == currentIndex),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final bool active;

  const Dot({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? Colors.white : Colors.white38,
        shape: BoxShape.circle,
      ),
    );
  }
}
