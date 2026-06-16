import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ecodcf/features/onboarding/domain/entities/onboarding_step.dart';
import 'package:ecodcf/features/onboarding/presentation/bloc/onboarding_notifier.dart';
import 'package:ecodcf/core/design_system/colors/app_colors.dart';
import 'package:ecodcf/core/providers/preferences_provider.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingProvider);
    final steps = state is OnboardingLoaded ? state.steps : <OnboardingStep>[];

    final prefsAsync = ref.watch(userPreferencesProvider);
    prefsAsync.when(
      data: (prefs) {
        if (prefs.hasCompletedOnboarding) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go('/main');
          });
        }
      },
      loading: () {},
      error: (err, _) {},
    );

    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.forestGreen, AppColors.leafGreen],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          
          if (steps.isNotEmpty) ...[
            PageView.builder(
              controller: _pageController,
              itemCount: steps.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                return _buildOnboardingStep(steps[index]);
              },
            ),
            
            Positioned(
              bottom: 60,
              left: 32,
              right: 32,
              child: Column(
                children: [
                  _buildNavigationSection(steps),
                  const SizedBox(height: 32),
                  _buildDotIndicator(steps.length),
                ],
              ),
            ),
          ] else ...[
            const Center(child: CircularProgressIndicator(color: Colors.white)),
          ],
        ],
      ),
    );
  }

  Widget _buildOnboardingStep(OnboardingStep step) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 2),
            ),
            child: Center(
              child: Text(
                step.icon,
                style: const TextStyle(fontSize: 50),
              ),
            ),
          ),
          const SizedBox(height: 48),
          Text(
            step.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            step.description,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 100), // Space for navigation at bottom
        ],
      ),
    );
  }

  Widget _buildNavigationSection(List<OnboardingStep> steps) {
    final isLastPage = _currentPage == steps.length - 1;
    
    return Row(
      children: [
        if (!isLastPage)
          TextButton(
            onPressed: () => ref.read(onboardingProvider.notifier).completeOnboarding(),
            child: const Text('Skip', style: TextStyle(color: Colors.white70)),
          ),
        const Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: AppColors.forestGreen,
            minimumSize: const Size(140, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          onPressed: () {
            if (_currentPage < steps.length - 1) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutCubic,
              );
            } else {
              ref.read(onboardingProvider.notifier).completeOnboarding();
            }
          },
          child: Text(
            isLastPage ? 'Get Started' : 'Next',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildDotIndicator(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: _currentPage == index ? 24 : 8,
          decoration: BoxDecoration(
            color: _currentPage == index ? Colors.white : Colors.white38,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
