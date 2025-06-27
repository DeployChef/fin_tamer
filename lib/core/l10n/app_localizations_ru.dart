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
  String get categories => 'Статьи';

  @override
  String get settings => 'Настройки';

  @override
  String get accountTitle => 'Мой счет';

  @override
  String get categoriesTitle => 'Мои статьи';

  @override
  String get incomeTitle => 'Мои доходы';

  @override
  String get outcomeTitle => 'Мои расходы';

  @override
  String get historyTitle => 'Моя история';

  @override
  String get amountDayTitle => 'Всего';

  @override
  String get amountHistoryTitle => 'Сумма';

  @override
  String get filterStartDate => 'Начало';

  @override
  String get filterEndDate => 'Конец';

  @override
  String get filterStartDatePeriod => 'Период: начало';

  @override
  String get filterEndDatePeriod => 'Период: конец';

  @override
  String get filterSort => 'Сортировка';

  @override
  String get notFound => 'Записи не найдены';

  @override
  String get byDate => 'по дате';

  @override
  String get byAmount => 'по сумме';

  @override
  String get analytics => 'Анализ';
}
