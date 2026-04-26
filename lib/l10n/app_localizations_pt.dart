// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Calculadora de IMC';

  @override
  String get calculator => 'Calcular';

  @override
  String get reference => 'Referência';

  @override
  String get history => 'Histórico';

  @override
  String get settings => 'Definições';

  @override
  String get profile => 'Perfil';

  @override
  String get userName => 'Seu Nome';

  @override
  String get defaultAge => 'Idade Padrão';

  @override
  String get defaultGender => 'Género Padrão';

  @override
  String get male => 'Masculino';

  @override
  String get female => 'Feminino';

  @override
  String get defaults => 'Predefinições';

  @override
  String get unitSystem => 'Sistema de Unidades';

  @override
  String get metric => 'Métrico';

  @override
  String get imperial => 'Imperial';

  @override
  String get defaultHeightCm => 'Altura Padrão (cm)';

  @override
  String get defaultHeightIn => 'Altura Padrão (in)';

  @override
  String get defaultWeightKg => 'Peso Padrão (kg)';

  @override
  String get defaultWeightLbs => 'Peso Padrão (lbs)';

  @override
  String get saveSettings => 'GUARDAR DEFINIÇÕES';

  @override
  String get settingsSaved => 'Definições guardadas';

  @override
  String get language => 'Idioma';

  @override
  String get systemDefault => 'Sistema padrão';

  @override
  String get height => 'Altura';

  @override
  String get weight => 'Peso';

  @override
  String get age => 'Idade';

  @override
  String get gender => 'Género';

  @override
  String get calculateBmi => 'CALCULAR IMC';

  @override
  String get bmiResult => 'O seu IMC é';

  @override
  String get bmiCategory => 'Categoria';

  @override
  String get saveResult => 'GUARDAR RESULTADO';

  @override
  String get resultSaved => 'Resultado guardado';

  @override
  String get historyEmpty => 'Nenhum registo';

  @override
  String get clearHistory => 'Limpar Histórico';

  @override
  String get deleteRecord => 'Apagar';

  @override
  String get bmiTable => 'Tabela de Referência de IMC';

  @override
  String get underweight => 'Abaixo do peso';

  @override
  String get normal => 'Normal';

  @override
  String get overweight => 'Sobrepeso';

  @override
  String get obese => 'Obesidade';

  @override
  String get severeThinness => 'Magreza severa';

  @override
  String get moderateThinness => 'Magreza moderada';

  @override
  String get obeseClass1 => 'Obesidade Classe I';

  @override
  String get obeseClass2 => 'Obesidade Classe II';

  @override
  String get obeseClass3 => 'Obesidade Classe III';

  @override
  String get pleaseFillAll =>
      'Por favor, preencha todos os campos com números válidos';

  @override
  String get savedToHistory => 'Guardado no histórico';

  @override
  String get bodyFatRanges => 'Intervalos de gordura corporal %';

  @override
  String get bmiRange => 'Intervalo de IMC';

  @override
  String get essentialFat => 'Gordura essencial';

  @override
  String get athletes => 'Atletas';

  @override
  String get fitness => 'Fitness';

  @override
  String get average => 'Média';

  @override
  String get aboutFormulas => 'Sobre as fórmulas';

  @override
  String get formulaInfo =>
      'IMC = peso (kg) / altura² (m²)\n\nGordura corporal (Deurenberg):\n%GC = 1,20 × IMC + 0,23 × Idade − 10,8 × Sexo − 5,4\n(Sexo: 1 = masculino, 0 = feminino)\n\nEstas são estimativas. Consulte um profissional de saúde para uma avaliação precisa.';

  @override
  String get deleteConfirm => 'Apagar todos os registos guardados?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get bodyFat => 'Gordura Corporal';

  @override
  String get calculateSave => 'Calcule o seu IMC e guarde-o!';

  @override
  String get ageLabel => 'Idade';

  @override
  String get fatLabel => 'de gordura';

  @override
  String get metricUnits => 'kg / cm';

  @override
  String get imperialUnits => 'lb / in';

  @override
  String get appVersion => 'v1.1';
}
