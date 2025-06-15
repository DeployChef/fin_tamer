// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get outcomes => 'Расходы';

  @override
  String get incomes => 'Доходы';

  @override
  String get account => 'Счет';

  @override
  String get categories => 'Категории';

  @override
  String get settings => 'Настройки';

  @override
  String get accountTitle => 'Мой счет';

  @override
  String get categoriesTitle => 'Мои статьи';
}
