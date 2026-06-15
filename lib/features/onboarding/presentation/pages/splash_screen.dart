import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ecodcf/core/design_system/colors/app_colors.dart';
import 'package:ecodcf/core/providers/preferences_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefsAsync = ref.watch(userPreferencesProvider);

    prefsAsync.whenData((prefs) {
      Future.delayed(const Duration(seconds: 2), () {
        if (context.mounted) {
          if (prefs.hasCompletedOnboarding) {
            context.go('/main');
          } else {
            context.go('/onboarding');
          }
        }
      });
    });

    return Scaffold(
      backgroundColor: AppColors.forestGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.co2,
                color: AppColors.forestGreen,
                size: 64,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'EcoDcf',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Digital Carbon Intelligence',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}

