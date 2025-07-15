import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @outcomes.
  ///
  /// In en, this message translates to:
  /// **'Outcomes'**
  String get outcomes;

  /// No description provided for @incomes.
  ///
  /// In en, this message translates to:
  /// **'Incomes'**
  String get incomes;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @accountTitle.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get accountTitle;

  /// No description provided for @categoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'My Categories'**
  String get categoriesTitle;

  /// No description provided for @incomeTitle.
  ///
  /// In en, this message translates to:
  /// **'My incomes'**
  String get incomeTitle;

  /// No description provided for @outcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'My outcomes'**
  String get outcomeTitle;

  /// No description provided for @historyTitle.
  ///
  /// In en, this message translates to:
  /// **'My history'**
  String get historyTitle;

  /// No description provided for @amountDayTitle.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amountDayTitle;

  /// No description provided for @amountHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amountHistoryTitle;

  /// No description provided for @filterStartDate.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get filterStartDate;

  /// No description provided for @filterEndDate.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get filterEndDate;

  /// No description provided for @filterStartDatePeriod.
  ///
  /// In en, this message translates to:
  /// **'Period: start'**
  String get filterStartDatePeriod;

  /// No description provided for @filterEndDatePeriod.
  ///
  /// In en, this message translates to:
  /// **'Period: end'**
  String get filterEndDatePeriod;

  /// No description provided for @filterSort.
  ///
  /// In en, this message translates to:
  /// **'Order by'**
  String get filterSort;

  /// No description provided for @notFound.
  ///
  /// In en, this message translates to:
  /// **'Not found'**
  String get notFound;

  /// No description provided for @byDate.
  ///
  /// In en, this message translates to:
  /// **'date'**
  String get byDate;

  /// No description provided for @byAmount.
  ///
  /// In en, this message translates to:
  /// **'amount'**
  String get byAmount;

  /// No description provided for @analytics.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get analytics;

  /// No description provided for @accountFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get accountFieldTitle;

  /// No description provided for @categoryFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get categoryFieldTitle;

  /// No description provided for @dateFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get dateFieldTitle;

  /// No description provided for @timeFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get timeFieldTitle;

  /// No description provided for @commentHint.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get commentHint;

  /// No description provided for @deleteIncome.
  ///
  /// In en, this message translates to:
  /// **'Delete income'**
  String get deleteIncome;

  /// No description provided for @deleteOutcome.
  ///
  /// In en, this message translates to:
  /// **'Delete outcome'**
  String get deleteOutcome;

  /// No description provided for @validationErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Validation error'**
  String get validationErrorTitle;

  /// No description provided for @validationErrorContent.
  ///
  /// In en, this message translates to:
  /// **'Please fill all required fields.'**
  String get validationErrorContent;

  /// No description provided for @okButton.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get okButton;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark theme'**
  String get darkTheme;

  /// No description provided for @primaryColor.
  ///
  /// In en, this message translates to:
  /// **'Primary color'**
  String get primaryColor;

  /// No description provided for @sounds.
  ///
  /// In en, this message translates to:
  /// **'Sounds'**
  String get sounds;

  /// No description provided for @haptics.
  ///
  /// In en, this message translates to:
  /// **'Haptics'**
  String get haptics;

  /// No description provided for @passcode.
  ///
  /// In en, this message translates to:
  /// **'Passcode'**
  String get passcode;

  /// No description provided for @sync.
  ///
  /// In en, this message translates to:
  /// **'Sync'**
  String get sync;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @findArticle.
  ///
  /// In en, this message translates to:
  /// **'Find transaction'**
  String get findArticle;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @byDay.
  ///
  /// In en, this message translates to:
  /// **'By day'**
  String get byDay;

  /// No description provided for @byMonth.
  ///
  /// In en, this message translates to:
  /// **'By month'**
  String get byMonth;

  /// No description provided for @updateAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Update account'**
  String get updateAccountTitle;

  /// No description provided for @updateAccountLabel.
  ///
  /// In en, this message translates to:
  /// **'Enter new account name'**
  String get updateAccountLabel;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorTitle;

  /// No description provided for @setPin.
  ///
  /// In en, this message translates to:
  /// **'Set PIN'**
  String get setPin;

  /// No description provided for @changePin.
  ///
  /// In en, this message translates to:
  /// **'Change PIN'**
  String get changePin;

  /// No description provided for @deletePin.
  ///
  /// In en, this message translates to:
  /// **'Delete PIN'**
  String get deletePin;

  /// No description provided for @biometricUnlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock with FaceID/TouchID'**
  String get biometricUnlock;

  /// No description provided for @biometricNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Biometrics not supported on this device'**
  String get biometricNotAvailable;

  /// No description provided for @pinSet.
  ///
  /// In en, this message translates to:
  /// **'PIN is set'**
  String get pinSet;

  /// No description provided for @pinNotSet.
  ///
  /// In en, this message translates to:
  /// **'PIN is not set'**
  String get pinNotSet;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
