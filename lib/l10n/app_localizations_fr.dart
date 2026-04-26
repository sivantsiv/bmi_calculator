// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Calculateur d\'IMC';

  @override
  String get calculator => 'Calculer';

  @override
  String get reference => 'Référence';

  @override
  String get history => 'Historique';

  @override
  String get settings => 'Paramètres';

  @override
  String get profile => 'Profil';

  @override
  String get userName => 'Votre Nom';

  @override
  String get defaultAge => 'Âge par défaut';

  @override
  String get defaultGender => 'Sexe par défaut';

  @override
  String get male => 'Homme';

  @override
  String get female => 'Femme';

  @override
  String get defaults => 'Défauts';

  @override
  String get unitSystem => 'Système d\'unités';

  @override
  String get metric => 'Métrique';

  @override
  String get imperial => 'Impérial';

  @override
  String get defaultHeightCm => 'Taille par défaut (cm)';

  @override
  String get defaultHeightIn => 'Taille par défaut (in)';

  @override
  String get defaultWeightKg => 'Poids par défaut (kg)';

  @override
  String get defaultWeightLbs => 'Poids par défaut (lbs)';

  @override
  String get saveSettings => 'ENREGISTRER LES PARAMÈTRES';

  @override
  String get settingsSaved => 'Paramètres enregistrés';

  @override
  String get language => 'Langue';

  @override
  String get systemDefault => 'Système par défaut';

  @override
  String get height => 'Taille';

  @override
  String get weight => 'Poids';

  @override
  String get age => 'Âge';

  @override
  String get gender => 'Sexe';

  @override
  String get calculateBmi => 'CALCULER L\'IMC';

  @override
  String get bmiResult => 'Votre IMC est';

  @override
  String get bmiCategory => 'Catégorie';

  @override
  String get saveResult => 'ENREGISTRER LE RÉSULTAT';

  @override
  String get resultSaved => 'Résultat enregistré';

  @override
  String get historyEmpty => 'Aucun enregistrement';

  @override
  String get clearHistory => 'Effacer l\'historique';

  @override
  String get deleteRecord => 'Supprimer';

  @override
  String get bmiTable => 'Tableau de référence de l\'IMC';

  @override
  String get underweight => 'Insuffisance pondérale';

  @override
  String get normal => 'Normal';

  @override
  String get overweight => 'Surpoids';

  @override
  String get obese => 'Obésité';

  @override
  String get severeThinness => 'Maigreur extrême';

  @override
  String get moderateThinness => 'Maigreur modérée';

  @override
  String get obeseClass1 => 'Obésité Classe I';

  @override
  String get obeseClass2 => 'Obésité Classe II';

  @override
  String get obeseClass3 => 'Obésité Classe III';

  @override
  String get pleaseFillAll =>
      'Veuillez remplir tous les champs avec des chiffres valides';

  @override
  String get savedToHistory => 'Enregistré dans l\'historique';

  @override
  String get bodyFatRanges => 'Plages de graisse corporelle %';

  @override
  String get bmiRange => 'Plage d\'IMC';

  @override
  String get essentialFat => 'Graisse essentielle';

  @override
  String get athletes => 'Athlètes';

  @override
  String get fitness => 'Fitness';

  @override
  String get average => 'Moyenne';

  @override
  String get aboutFormulas => 'À propos des formules';

  @override
  String get formulaInfo =>
      'IMC = poids (kg) / taille² (m²)\n\nGraisse corporelle (Deurenberg) :\n%GC = 1,20 × IMC + 0,23 × Âge − 10,8 × Sexe − 5,4\n(Sexe : 1 = homme, 0 = femme)\n\nCes données sont des estimations. Consultez un professionnel de santé pour une évaluation précise.';

  @override
  String get deleteConfirm =>
      'Supprimer tous les enregistrements sauvegardés ?';

  @override
  String get cancel => 'Annuler';

  @override
  String get bodyFat => 'Graisse corporelle';

  @override
  String get calculateSave => 'Calculez votre IMC et enregistrez-le !';

  @override
  String get ageLabel => 'Âge';

  @override
  String get fatLabel => 'de graisse';

  @override
  String get metricUnits => 'kg / cm';

  @override
  String get imperialUnits => 'lb / in';

  @override
  String get appVersion => 'v1.1';
}
