import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_id.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_zh.dart';

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
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('id'),
    Locale('ja'),
    Locale('pt'),
    Locale('ru'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Calculate BMI'**
  String get appTitle;

  /// No description provided for @calculator.
  ///
  /// In en, this message translates to:
  /// **'Calculate'**
  String get calculator;

  /// No description provided for @reference.
  ///
  /// In en, this message translates to:
  /// **'Reference'**
  String get reference;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'Your Name'**
  String get userName;

  /// No description provided for @defaultAge.
  ///
  /// In en, this message translates to:
  /// **'Default Age'**
  String get defaultAge;

  /// No description provided for @defaultGender.
  ///
  /// In en, this message translates to:
  /// **'Default Gender'**
  String get defaultGender;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @defaults.
  ///
  /// In en, this message translates to:
  /// **'Defaults'**
  String get defaults;

  /// No description provided for @unitSystem.
  ///
  /// In en, this message translates to:
  /// **'Unit System'**
  String get unitSystem;

  /// No description provided for @metric.
  ///
  /// In en, this message translates to:
  /// **'Metric'**
  String get metric;

  /// No description provided for @imperial.
  ///
  /// In en, this message translates to:
  /// **'Imperial'**
  String get imperial;

  /// No description provided for @defaultHeightCm.
  ///
  /// In en, this message translates to:
  /// **'Default Height (cm)'**
  String get defaultHeightCm;

  /// No description provided for @defaultHeightIn.
  ///
  /// In en, this message translates to:
  /// **'Default Height (in)'**
  String get defaultHeightIn;

  /// No description provided for @defaultWeightKg.
  ///
  /// In en, this message translates to:
  /// **'Default Weight (kg)'**
  String get defaultWeightKg;

  /// No description provided for @defaultWeightLbs.
  ///
  /// In en, this message translates to:
  /// **'Default Weight (lbs)'**
  String get defaultWeightLbs;

  /// No description provided for @saveSettings.
  ///
  /// In en, this message translates to:
  /// **'SAVE SETTINGS'**
  String get saveSettings;

  /// No description provided for @settingsSaved.
  ///
  /// In en, this message translates to:
  /// **'Settings saved'**
  String get settingsSaved;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @systemDefault.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get systemDefault;

  /// No description provided for @height.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get height;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @calculateBmi.
  ///
  /// In en, this message translates to:
  /// **'CALCULATE BMI'**
  String get calculateBmi;

  /// No description provided for @bmiResult.
  ///
  /// In en, this message translates to:
  /// **'Your BMI is'**
  String get bmiResult;

  /// No description provided for @bmiCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get bmiCategory;

  /// No description provided for @saveResult.
  ///
  /// In en, this message translates to:
  /// **'SAVE RESULT'**
  String get saveResult;

  /// No description provided for @resultSaved.
  ///
  /// In en, this message translates to:
  /// **'Result saved'**
  String get resultSaved;

  /// No description provided for @historyEmpty.
  ///
  /// In en, this message translates to:
  /// **'No records yet'**
  String get historyEmpty;

  /// No description provided for @clearHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear History'**
  String get clearHistory;

  /// No description provided for @deleteRecord.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteRecord;

  /// No description provided for @bmiTable.
  ///
  /// In en, this message translates to:
  /// **'BMI Reference Table'**
  String get bmiTable;

  /// No description provided for @underweight.
  ///
  /// In en, this message translates to:
  /// **'Underweight'**
  String get underweight;

  /// No description provided for @normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get normal;

  /// No description provided for @overweight.
  ///
  /// In en, this message translates to:
  /// **'Overweight'**
  String get overweight;

  /// No description provided for @obese.
  ///
  /// In en, this message translates to:
  /// **'Obese'**
  String get obese;

  /// No description provided for @severeThinness.
  ///
  /// In en, this message translates to:
  /// **'Severe Thinness'**
  String get severeThinness;

  /// No description provided for @moderateThinness.
  ///
  /// In en, this message translates to:
  /// **'Moderate Thinness'**
  String get moderateThinness;

  /// No description provided for @obeseClass1.
  ///
  /// In en, this message translates to:
  /// **'Obese Class I'**
  String get obeseClass1;

  /// No description provided for @obeseClass2.
  ///
  /// In en, this message translates to:
  /// **'Obese Class II'**
  String get obeseClass2;

  /// No description provided for @obeseClass3.
  ///
  /// In en, this message translates to:
  /// **'Obese Class III'**
  String get obeseClass3;

  /// No description provided for @pleaseFillAll.
  ///
  /// In en, this message translates to:
  /// **'Please fill in all fields with valid numbers'**
  String get pleaseFillAll;

  /// No description provided for @savedToHistory.
  ///
  /// In en, this message translates to:
  /// **'Saved to history'**
  String get savedToHistory;

  /// No description provided for @bodyFatRanges.
  ///
  /// In en, this message translates to:
  /// **'Body Fat % Ranges'**
  String get bodyFatRanges;

  /// No description provided for @bmiRange.
  ///
  /// In en, this message translates to:
  /// **'BMI Range'**
  String get bmiRange;

  /// No description provided for @essentialFat.
  ///
  /// In en, this message translates to:
  /// **'Essential Fat'**
  String get essentialFat;

  /// No description provided for @athletes.
  ///
  /// In en, this message translates to:
  /// **'Athletes'**
  String get athletes;

  /// No description provided for @fitness.
  ///
  /// In en, this message translates to:
  /// **'Fitness'**
  String get fitness;

  /// No description provided for @average.
  ///
  /// In en, this message translates to:
  /// **'Average'**
  String get average;

  /// No description provided for @aboutFormulas.
  ///
  /// In en, this message translates to:
  /// **'About the formulas'**
  String get aboutFormulas;

  /// No description provided for @formulaInfo.
  ///
  /// In en, this message translates to:
  /// **'BMI = weight (kg) / height² (m²)\n\nBody Fat (Deurenberg):\nBF% = 1.20 × BMI + 0.23 × Age − 10.8 × Sex − 5.4\n(Sex: 1 = male, 0 = female)\n\nThese are estimates. Consult a healthcare professional for accurate assessment.'**
  String get formulaInfo;

  /// No description provided for @deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete all saved records?'**
  String get deleteConfirm;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @bodyFat.
  ///
  /// In en, this message translates to:
  /// **'Body Fat'**
  String get bodyFat;

  /// No description provided for @calculateSave.
  ///
  /// In en, this message translates to:
  /// **'Calculate your BMI and save it!'**
  String get calculateSave;

  /// No description provided for @ageLabel.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get ageLabel;

  /// No description provided for @fatLabel.
  ///
  /// In en, this message translates to:
  /// **'fat'**
  String get fatLabel;

  /// No description provided for @metricUnits.
  ///
  /// In en, this message translates to:
  /// **'kg / cm'**
  String get metricUnits;

  /// No description provided for @imperialUnits.
  ///
  /// In en, this message translates to:
  /// **'lbs / in'**
  String get imperialUnits;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'v1.1'**
  String get appVersion;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'id',
    'ja',
    'pt',
    'ru',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'id':
      return AppLocalizationsId();
    case 'ja':
      return AppLocalizationsJa();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
