// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'myBMI';

  @override
  String get calculator => 'Расчет';

  @override
  String get reference => 'Справка';

  @override
  String get history => 'История';

  @override
  String get settings => 'Настройки';

  @override
  String get profile => 'Профиль';

  @override
  String get userName => 'Ваше имя';

  @override
  String get defaultAge => 'Возраст по умолчанию';

  @override
  String get defaultGender => 'Пол по умолчанию';

  @override
  String get male => 'Мужской';

  @override
  String get female => 'Женский';

  @override
  String get defaults => 'Стандарты';

  @override
  String get unitSystem => 'Система единиц';

  @override
  String get metric => 'Метрическая';

  @override
  String get imperial => 'Имперская';

  @override
  String get defaultHeightCm => 'Рост (см)';

  @override
  String get defaultHeightIn => 'Рост (дюймы)';

  @override
  String get defaultWeightKg => 'Вес (кг)';

  @override
  String get defaultWeightLbs => 'Вес (фунты)';

  @override
  String get saveSettings => 'СОХРАНИТЬ НАСТРОЙКИ';

  @override
  String get settingsSaved => 'Настройки сохранены';

  @override
  String get language => 'Язык';

  @override
  String get systemDefault => 'Системный по умолчанию';

  @override
  String get height => 'Рост';

  @override
  String get weight => 'Вес';

  @override
  String get age => 'Возраст';

  @override
  String get gender => 'Пол';

  @override
  String get calculateBmi => 'РАССЧИТАТЬ ИМТ';

  @override
  String get bmiResult => 'Ваш ИМТ:';

  @override
  String get bmiCategory => 'Категория';

  @override
  String get saveResult => 'СОХРАНИТЬ РЕЗУЛЬТАТ';

  @override
  String get resultSaved => 'Результат сохранен';

  @override
  String get historyEmpty => 'Записей нет';

  @override
  String get clearHistory => 'Очистить историю';

  @override
  String get deleteRecord => 'Удалить';

  @override
  String get bmiTable => 'Таблица ИМТ';

  @override
  String get underweight => 'Недостаточный вес';

  @override
  String get normal => 'Норма';

  @override
  String get overweight => 'Избыточный вес';

  @override
  String get obese => 'Ожирение';

  @override
  String get severeThinness => 'Выраженный дефицит массы';

  @override
  String get moderateThinness => 'Умеренный дефицит массы';

  @override
  String get obeseClass1 => 'Ожирение I степени';

  @override
  String get obeseClass2 => 'Ожирение II степени';

  @override
  String get obeseClass3 => 'Ожирение III степени';

  @override
  String get pleaseFillAll =>
      'Пожалуйста, заполните все поля корректными числами';

  @override
  String get savedToHistory => 'Сохранено в историю';

  @override
  String get bodyFatRanges => 'Диапазоны жира в организме %';

  @override
  String get bmiRange => 'Диапазон ИМТ';

  @override
  String get essentialFat => 'Необходимый жир';

  @override
  String get athletes => 'Атлеты';

  @override
  String get fitness => 'Фитнес';

  @override
  String get average => 'Средний';

  @override
  String get aboutFormulas => 'О формулах';

  @override
  String get formulaInfo =>
      'ИМТ = вес (кг) / рост² (м²)\n\nЖир в организме (Deurenberg):\n%ЖО = 1.20 × ИМТ + 0.23 × Возраст − 10.8 × Пол − 5.4\n(Пол: 1 = мужской, 0 = женский)\n\nЭто оценочные данные. Обратитесь к врачу для точной оценки.';

  @override
  String get deleteConfirm => 'Удалить все сохраненные записи?';

  @override
  String get cancel => 'Отмена';

  @override
  String get bodyFat => 'Жир в организме';

  @override
  String get calculateSave => 'Рассчитайте свой ИМТ и сохраните его!';

  @override
  String get ageLabel => 'Возраст';

  @override
  String get fatLabel => 'жира';

  @override
  String get metricUnits => 'кг / см';

  @override
  String get imperialUnits => 'фунт / дюйм';

  @override
  String get appVersion => 'v1.1';
}
