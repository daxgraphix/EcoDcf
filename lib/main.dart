import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/core/routes/app_router.dart';
import 'package:ecodcf/core/theme/app_theme.dart';
import 'package:ecodcf/core/providers/app_provider.dart';
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
    final themeMode = ref.watch(appThemeProvider);
    final initialization = ref.watch(appInitializationProvider);
    
    return MaterialApp.router(
      title: 'EcoDcf',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode == 'dark' ? ThemeMode.dark : ThemeMode.light,
      routerConfig: appRouter,
      builder: (context, child) {
        return initialization.when(
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
        );
      },
    );
  }
}
