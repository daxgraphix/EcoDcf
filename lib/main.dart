import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/core/routes/app_router.dart';
import 'package:ecodcf/core/theme/app_theme.dart';
import 'package:ecodcf/core/providers/preferences_provider.dart';
import 'package:ecodcf/core/providers/initialization_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    const ProviderScope(
      child: EcoDcfApp(),
    ),
  );
}

class EcoDcfApp extends ConsumerWidget {
  const EcoDcfApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefsAsync = ref.watch(userPreferencesProvider);
    final initialization = ref.watch(appInitializationProvider);
    
    return prefsAsync.when(
      loading: () => const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
      error: (err, _) => MaterialApp(
        home: Scaffold(body: Center(child: Text('Critical Error: $err'))),
      ),
      data: (prefs) {
        final themeMode = prefs.themeMode == 'dark' ? ThemeMode.dark : ThemeMode.light;
        
        return MaterialApp.router(
          title: 'EcoDcf',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeMode,
          routerConfig: appRouter,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(prefs.fontSizeScale),
                accessibleNavigation: prefs.highContrastEnabled,
              ),
              child: initialization.when(
                data: (_) => child!,
                loading: () => const Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('Getting your personal eco-dashboard ready...'),
                      ],
                    ),
                  ),
                ),
                error: (err, stack) => Scaffold(
                  body: Center(
                    child: Text('Initialization Error: $err'),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
