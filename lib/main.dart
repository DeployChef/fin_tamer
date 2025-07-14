import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/core/navigation/routers/app_router.dart';
import 'package:fin_tamer/features/settings/domain/services/app_theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:worker_manager/worker_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fin_tamer/core/utils/widgets/blur_guard.dart';

void main() async {
  await dotenv.load();
  await workerManager.init();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(
    child: MainApp(),
  ));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeAsync = ref.watch(appThemeServiceProvider);
    return themeAsync.when(
      data: (themeState) => _buildMaterialApp(themeState),
      loading: () => _buildMaterialApp(null),
      error: (error, stack) => _buildMaterialApp(null),
    );
  }

  Widget _buildMaterialApp(AppThemeState? themeState) {
    final theme = themeState?.lightTheme ?? ThemeData.light();
    final darkTheme = themeState?.darkTheme ?? ThemeData.dark();
    final isDark = themeState?.isDark ?? false;
    return MaterialApp.router(
      theme: theme,
      darkTheme: darkTheme,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ru'), // Russian
      ],
      routerConfig: AppRouter.router,
      builder: (context, child) => BlurGuard(child: child ?? const SizedBox()),
    );
  }
}
