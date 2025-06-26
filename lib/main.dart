import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/core/navigation/routers/app_router.dart';
import 'package:fin_tamer/features/account/data/entities/account_entity.dart';
import 'package:fin_tamer/core/local/objectbox_store.dart';
import 'package:fin_tamer/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final objectBox = await ObjectBox.create();
  final accountBox = objectBox.store.box<AccountEntity>();
  final accounts = accountBox.getAll();
  final newAccount = AccountEntity(
    userId: 1,
    name: 'Основной счёт',
    balance: '1000',
    currency: 'RUB',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
  final id = accountBox.put(newAccount);
  runApp(const ProviderScope(
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
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
    );
  }
}
