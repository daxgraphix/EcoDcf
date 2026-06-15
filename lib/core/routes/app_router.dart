import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecodcf/core/routes/app_routes.dart';
import 'package:ecodcf/core/presentation/widgets/main_shell.dart';
import 'package:ecodcf/features/onboarding/presentation/pages/splash_screen.dart';
import 'package:ecodcf/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:ecodcf/features/profile/presentation/pages/profile_page.dart';
import 'package:ecodcf/features/settings/presentation/pages/settings_page.dart';
import 'package:ecodcf/features/settings/presentation/pages/privacy_center_page.dart';
import 'package:ecodcf/features/dscore/presentation/pages/dscore_page.dart';
import 'package:ecodcf/features/analytics/presentation/pages/analytics_page.dart';
import 'package:ecodcf/features/sustainability/presentation/pages/academy_page.dart';
import 'package:ecodcf/features/sustainability/presentation/pages/lesson_detail_page.dart';
import 'package:ecodcf/features/onboarding/presentation/pages/permissions_onboarding_page.dart';
import 'package:ecodcf/features/report/presentation/pages/report_page.dart';
import 'package:ecodcf/features/gamification/presentation/pages/gamification_page.dart';
import 'package:ecodcf/features/onboarding/presentation/pages/onboarding_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorDashboard = GlobalKey<NavigatorState>(debugLabel: 'dashboard');
final GlobalKey<NavigatorState> _shellNavigatorChallenges = GlobalKey<NavigatorState>(debugLabel: 'challenges');
final GlobalKey<NavigatorState> _shellNavigatorAcademy = GlobalKey<NavigatorState>(debugLabel: 'academy');
final GlobalKey<NavigatorState> _shellNavigatorProfile = GlobalKey<NavigatorState>(debugLabel: 'profile');
final GlobalKey<NavigatorState> _shellNavigatorSettings = GlobalKey<NavigatorState>(debugLabel: 'settings');

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const OnboardingPage(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorDashboard,
          routes: [
            GoRoute(
              path: AppRoutes.main,
              builder: (context, state) => const DashboardPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorChallenges,
          routes: [
            GoRoute(
              path: AppRoutes.challenges,
              builder: (context, state) => const GamificationPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAcademy,
          routes: [
            GoRoute(
              path: AppRoutes.academy,
              builder: (context, state) => const AcademyPage(),
              routes: [
                GoRoute(
                  path: 'lesson',
                  builder: (context, state) => const LessonDetailPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfile,
          routes: [
            GoRoute(
              path: AppRoutes.profile,
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSettings,
          routes: [
            GoRoute(
              path: AppRoutes.settings,
              builder: (context, state) => const SettingsPage(),
              routes: [
                GoRoute(
                  path: 'privacy-center',
                  builder: (context, state) => const PrivacyCenterPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.dscore,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const DScorePage(),
    ),
    GoRoute(
      path: AppRoutes.analytics,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const AnalyticsPage(),
    ),
    GoRoute(
      path: AppRoutes.permissionsOnboarding,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const PermissionsOnboardingPage(),
    ),
    GoRoute(
      path: AppRoutes.reports,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const ReportPage(),
    ),
  ],
);