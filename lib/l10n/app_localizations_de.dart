// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'BMI Rechner';

  @override
  String get calculator => 'Rechnen';

  @override
  String get reference => 'Referenz';

  @override
  String get history => 'Verlauf';

  @override
  String get settings => 'Einstellungen';

  @override
  String get profile => 'Profil';

  @override
  String get userName => 'Ihr Name';

  @override
  String get defaultAge => 'Standardalter';

  @override
  String get defaultGender => 'Standardgeschlecht';

  @override
  String get male => 'Männlich';

  @override
  String get female => 'Weiblich';

  @override
  String get defaults => 'Standards';

  @override
  String get unitSystem => 'Einheitensystem';

  @override
  String get metric => 'Metrisch';

  @override
  String get imperial => 'Imperial';

  @override
  String get defaultHeightCm => 'Standardgröße (cm)';

  @override
  String get defaultHeightIn => 'Standardgröße (in)';

  @override
  String get defaultWeightKg => 'Standardgewicht (kg)';

  @override
  String get defaultWeightLbs => 'Standardgewicht (lbs)';

  @override
  String get saveSettings => 'EINSTELLUNGEN SPEICHERN';

  @override
  String get settingsSaved => 'Einstellungen gespeichert';

  @override
  String get language => 'Sprache';

  @override
  String get systemDefault => 'Systemstandard';

  @override
  String get height => 'Größe';

  @override
  String get weight => 'Gewicht';

  @override
  String get age => 'Alter';

  @override
  String get gender => 'Geschlecht';

  @override
  String get calculateBmi => 'BMI BERECHNEN';

  @override
  String get bmiResult => 'Dein BMI ist';

  @override
  String get bmiCategory => 'Kategorie';

  @override
  String get saveResult => 'ERGEBNIS SPEICHERN';

  @override
  String get resultSaved => 'Ergebnis gespeichert';

  @override
  String get historyEmpty => 'Noch keine Einträge';

  @override
  String get clearHistory => 'Verlauf leeren';

  @override
  String get deleteRecord => 'Löschen';

  @override
  String get bmiTable => 'BMI Referenztabelle';

  @override
  String get underweight => 'Untergewicht';

  @override
  String get normal => 'Normalgewicht';

  @override
  String get overweight => 'Übergewicht';

  @override
  String get obese => 'Adipositas';

  @override
  String get severeThinness => 'Starkes Untergewicht';

  @override
  String get moderateThinness => 'Mäßiges Untergewicht';

  @override
  String get obeseClass1 => 'Adipositas Grad I';

  @override
  String get obeseClass2 => 'Adipositas Grad II';

  @override
  String get obeseClass3 => 'Adipositas Grad III';

  @override
  String get pleaseFillAll =>
      'Bitte füllen Sie alle Felder mit gültigen Zahlen aus';

  @override
  String get savedToHistory => 'Im Verlauf gespeichert';

  @override
  String get bodyFatRanges => 'Körperfettanteil-Bereiche %';

  @override
  String get bmiRange => 'BMI-Bereich';

  @override
  String get essentialFat => 'Lebensnotwendiges Fett';

  @override
  String get athletes => 'Athleten';

  @override
  String get fitness => 'Fitness';

  @override
  String get average => 'Durchschnitt';

  @override
  String get aboutFormulas => 'Über die Formeln';

  @override
  String get formulaInfo =>
      'BMI = Gewicht (kg) / Größe² (m²)\n\nKörperfett (Deurenberg):\nKFA % = 1.20 × BMI + 0.23 × Alter − 10.8 × Geschlecht − 5.4\n(Geschlecht: 1 = männlich, 0 = weiblich)\n\nDies sind Schätzungen. Konsultieren Sie einen Arzt für eine genaue Beurteilung.';

  @override
  String get deleteConfirm => 'Alle gespeicherten Datensätze löschen?';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get bodyFat => 'Körperfett';

  @override
  String get calculateSave => 'Berechnen Sie Ihren BMI und speichern Sie ihn!';

  @override
  String get ageLabel => 'Alter';

  @override
  String get fatLabel => 'Fett';

  @override
  String get metricUnits => 'kg / cm';

  @override
  String get imperialUnits => 'lb / in';

  @override
  String get appVersion => 'v1.0';
}
