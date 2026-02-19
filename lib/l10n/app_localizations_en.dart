// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Calculate BMI';

  @override
  String get calculator => 'Calculate';

  @override
  String get reference => 'Reference';

  @override
  String get history => 'History';

  @override
  String get settings => 'Settings';

  @override
  String get profile => 'Profile';

  @override
  String get userName => 'Your Name';

  @override
  String get defaultAge => 'Default Age';

  @override
  String get defaultGender => 'Default Gender';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get defaults => 'Defaults';

  @override
  String get unitSystem => 'Unit System';

  @override
  String get metric => 'Metric';

  @override
  String get imperial => 'Imperial';

  @override
  String get defaultHeightCm => 'Default Height (cm)';

  @override
  String get defaultHeightIn => 'Default Height (in)';

  @override
  String get defaultWeightKg => 'Default Weight (kg)';

  @override
  String get defaultWeightLbs => 'Default Weight (lbs)';

  @override
  String get saveSettings => 'SAVE SETTINGS';

  @override
  String get settingsSaved => 'Settings saved';

  @override
  String get language => 'Language';

  @override
  String get systemDefault => 'System Default';

  @override
  String get height => 'Height';

  @override
  String get weight => 'Weight';

  @override
  String get age => 'Age';

  @override
  String get gender => 'Gender';

  @override
  String get calculateBmi => 'CALCULATE BMI';

  @override
  String get bmiResult => 'Your BMI is';

  @override
  String get bmiCategory => 'Category';

  @override
  String get saveResult => 'SAVE RESULT';

  @override
  String get resultSaved => 'Result saved';

  @override
  String get historyEmpty => 'No records yet';

  @override
  String get clearHistory => 'Clear History';

  @override
  String get deleteRecord => 'Delete';

  @override
  String get bmiTable => 'BMI Reference Table';

  @override
  String get underweight => 'Underweight';

  @override
  String get normal => 'Normal';

  @override
  String get overweight => 'Overweight';

  @override
  String get obese => 'Obese';

  @override
  String get severeThinness => 'Severe Thinness';

  @override
  String get moderateThinness => 'Moderate Thinness';

  @override
  String get obeseClass1 => 'Obese Class I';

  @override
  String get obeseClass2 => 'Obese Class II';

  @override
  String get obeseClass3 => 'Obese Class III';

  @override
  String get pleaseFillAll => 'Please fill in all fields with valid numbers';

  @override
  String get savedToHistory => 'Saved to history';

  @override
  String get bodyFatRanges => 'Body Fat % Ranges';

  @override
  String get bmiRange => 'BMI Range';

  @override
  String get essentialFat => 'Essential Fat';

  @override
  String get athletes => 'Athletes';

  @override
  String get fitness => 'Fitness';

  @override
  String get average => 'Average';

  @override
  String get aboutFormulas => 'About the formulas';

  @override
  String get formulaInfo =>
      'BMI = weight (kg) / height² (m²)\n\nBody Fat (Deurenberg):\nBF% = 1.20 × BMI + 0.23 × Age − 10.8 × Sex − 5.4\n(Sex: 1 = male, 0 = female)\n\nThese are estimates. Consult a healthcare professional for accurate assessment.';

  @override
  String get deleteConfirm => 'Delete all saved records?';

  @override
  String get cancel => 'Cancel';

  @override
  String get bodyFat => 'Body Fat';

  @override
  String get calculateSave => 'Calculate your BMI and save it!';

  @override
  String get ageLabel => 'Age';

  @override
  String get fatLabel => 'fat';

  @override
  String get metricUnits => 'kg / cm';

  @override
  String get imperialUnits => 'lbs / in';

  @override
  String get appVersion => 'v1.0';
}
