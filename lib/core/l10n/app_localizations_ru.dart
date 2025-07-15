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

  @override
  String get accountFieldTitle => 'Счет';

  @override
  String get categoryFieldTitle => 'Статья';

  @override
  String get dateFieldTitle => 'Дата';

  @override
  String get timeFieldTitle => 'Время';

  @override
  String get commentHint => 'Комментарий';

  @override
  String get deleteIncome => 'Удалить доход';

  @override
  String get deleteOutcome => 'Удалить расход';

  @override
  String get validationErrorTitle => 'Ошибка заполнения';

  @override
  String get validationErrorContent =>
      'Пожалуйста, заполните все обязательные поля.';

  @override
  String get okButton => 'Oк';

  @override
  String get error => 'Ошибка';

  @override
  String get darkTheme => 'Темная тема';

  @override
  String get primaryColor => 'Основной цвет';

  @override
  String get sounds => 'Звуки';

  @override
  String get haptics => 'Хаптики';

  @override
  String get passcode => 'Код-пароль';

  @override
  String get sync => 'Синхронизация';

  @override
  String get language => 'Язык';

  @override
  String get about => 'О программе';

  @override
  String get findArticle => 'Найти статью';

  @override
  String get currency => 'Валюта';

  @override
  String get balance => 'Баланс';

  @override
  String get byDay => 'По дням';

  @override
  String get byMonth => 'По месяцам';

  @override
  String get updateAccountTitle => 'Редактировать счёт';

  @override
  String get updateAccountLabel => 'Введите новое название счета';

  @override
  String get cancel => 'Отмена';

  @override
  String get save => 'Сохранить';

  @override
  String get errorTitle => 'Ошибка';

  @override
  String get setPin => 'Установить PIN';

  @override
  String get changePin => 'Изменить PIN';

  @override
  String get deletePin => 'Удалить PIN';

  @override
  String get biometricUnlock => 'Разблокировка по FaceID/TouchID';

  @override
  String get biometricNotAvailable =>
      'Биометрия не поддерживается на этом устройстве';

  @override
  String get pinSet => 'PIN установлен';

  @override
  String get pinNotSet => 'PIN не установлен';
}
