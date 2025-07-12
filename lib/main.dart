import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/core/navigation/routers/app_router.dart';
import 'package:fin_tamer/features/settings/domain/services/app_theme_service.dart';
import 'package:fin_tamer/features/settings/domain/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:worker_manager/worker_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await workerManager.init();

  runApp(const ProviderScope(
    child: MainApp(),
  ));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lightThemeAsync = ref.watch(appThemeServiceProvider);
    final isDarkAsync = ref.watch(themeServiceProvider);

    return lightThemeAsync.when(
      data: (lightTheme) => isDarkAsync.when(
        data: (isDark) => MaterialApp.router(
          theme: lightTheme,
          darkTheme:
              lightTheme, // Пока используем ту же тему для темного режима
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
        ),
        loading: () => MaterialApp.router(
          theme: lightTheme,
          darkTheme: lightTheme,
          themeMode: ThemeMode.system,
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
        ),
        error: (error, stack) => MaterialApp.router(
          theme: lightTheme,
          darkTheme: lightTheme,
          themeMode: ThemeMode.system,
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
        ),
      ),
      loading: () => MaterialApp.router(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
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
      ),
      error: (error, stack) => MaterialApp.router(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
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
      ),
    );
  }
}
