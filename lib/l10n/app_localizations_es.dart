// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'myBMI';

  @override
  String get calculator => 'Calcular';

  @override
  String get reference => 'Referencia';

  @override
  String get history => 'Historial';

  @override
  String get settings => 'Ajustes';

  @override
  String get profile => 'Perfil';

  @override
  String get userName => 'Tu nombre';

  @override
  String get defaultAge => 'Edad predeterminada';

  @override
  String get defaultGender => 'Género predeterminado';

  @override
  String get male => 'Masculino';

  @override
  String get female => 'Femenino';

  @override
  String get defaults => 'Valores por defecto';

  @override
  String get unitSystem => 'Sistema de unidades';

  @override
  String get metric => 'Métrico';

  @override
  String get imperial => 'Imperial';

  @override
  String get defaultHeightCm => 'Altura (cm)';

  @override
  String get defaultHeightIn => 'Altura (in)';

  @override
  String get defaultWeightKg => 'Peso (kg)';

  @override
  String get defaultWeightLbs => 'Peso (lbs)';

  @override
  String get saveSettings => 'GUARDAR AJUSTES';

  @override
  String get settingsSaved => 'Ajustes guardados';

  @override
  String get language => 'Idioma';

  @override
  String get systemDefault => 'Sistema predeterminado';

  @override
  String get height => 'Altura';

  @override
  String get weight => 'Peso';

  @override
  String get age => 'Edad';

  @override
  String get gender => 'Género';

  @override
  String get calculateBmi => 'CALCULAR IMC';

  @override
  String get bmiResult => 'Tu IMC es';

  @override
  String get bmiCategory => 'Categoría';

  @override
  String get saveResult => 'GUARDAR RESULTADO';

  @override
  String get resultSaved => 'Resultado guardado';

  @override
  String get historyEmpty => 'Sin registros';

  @override
  String get clearHistory => 'Limpiar historial';

  @override
  String get deleteRecord => 'Eliminar';

  @override
  String get bmiTable => 'Tabla de referencia de IMC';

  @override
  String get underweight => 'Bajo peso';

  @override
  String get normal => 'Normal';

  @override
  String get overweight => 'Sobrepeso';

  @override
  String get obese => 'Obesidad';

  @override
  String get severeThinness => 'Delgadez severa';

  @override
  String get moderateThinness => 'Delgadez moderada';

  @override
  String get obeseClass1 => 'Obesidad Clase I';

  @override
  String get obeseClass2 => 'Obesidad Clase II';

  @override
  String get obeseClass3 => 'Obesidad Clase III';

  @override
  String get pleaseFillAll =>
      'Por favor, complete todos los campos con números válidos';

  @override
  String get savedToHistory => 'Guardado en el historial';

  @override
  String get bodyFatRanges => 'Rangos de grasa corporal %';

  @override
  String get bmiRange => 'Rango de IMC';

  @override
  String get essentialFat => 'Grasa esencial';

  @override
  String get athletes => 'Atletas';

  @override
  String get fitness => 'Fitness';

  @override
  String get average => 'Promedio';

  @override
  String get aboutFormulas => 'Sobre las fórmulas';

  @override
  String get formulaInfo =>
      'IMC = peso (kg) / altura² (m²)\n\nGrasa corporal (Deurenberg):\n%GC = 1.20 × IMC + 0.23 × Edad − 10.8 × Sexo − 5.4\n(Sexo: 1 = hombre, 0 = mujer)\n\nEstas son estimaciones. Consulte a un profesional de la salud para una evaluación precisa.';

  @override
  String get deleteConfirm => '¿Eliminar todos los registros guardados?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get bodyFat => 'Grasa corporal';

  @override
  String get calculateSave => '¡Calcula tu IMC y guárdalo!';

  @override
  String get ageLabel => 'Edad';

  @override
  String get fatLabel => 'de grasa';

  @override
  String get metricUnits => 'kg / cm';

  @override
  String get imperialUnits => 'lb / in';

  @override
  String get appVersion => 'v1.1';
}
