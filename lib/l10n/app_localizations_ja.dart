// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'myBMI';

  @override
  String get calculator => '計算';

  @override
  String get reference => '参照';

  @override
  String get history => '履歴';

  @override
  String get settings => '設定';

  @override
  String get profile => 'プロフィール';

  @override
  String get userName => 'お名前';

  @override
  String get defaultAge => 'デフォルトの年齢';

  @override
  String get defaultGender => '性別';

  @override
  String get male => '男性';

  @override
  String get female => '女性';

  @override
  String get defaults => 'デフォルト設定';

  @override
  String get unitSystem => '単位系';

  @override
  String get metric => 'メートル法';

  @override
  String get imperial => 'ヤード・ポンド法';

  @override
  String get defaultHeightCm => '身長 (cm)';

  @override
  String get defaultHeightIn => '身長 (in)';

  @override
  String get defaultWeightKg => '体重 (kg)';

  @override
  String get defaultWeightLbs => '体重 (lbs)';

  @override
  String get saveSettings => '設定を保存';

  @override
  String get settingsSaved => '設定を保存しました';

  @override
  String get language => '言語';

  @override
  String get systemDefault => 'システムデフォルト';

  @override
  String get height => '身長';

  @override
  String get weight => '体重';

  @override
  String get age => '年齢';

  @override
  String get gender => '性別';

  @override
  String get calculateBmi => 'BMIを計算';

  @override
  String get bmiResult => 'あなたのBMIは';

  @override
  String get bmiCategory => 'カテゴリー';

  @override
  String get saveResult => '結果を保存';

  @override
  String get resultSaved => '結果を保存しました';

  @override
  String get historyEmpty => '履歴がありません';

  @override
  String get clearHistory => '履歴を消去';

  @override
  String get deleteRecord => '削除';

  @override
  String get bmiTable => 'BMI参照表';

  @override
  String get underweight => '低体重';

  @override
  String get normal => '普通体重';

  @override
  String get overweight => '肥満(1度)';

  @override
  String get obese => '肥満(2度以上)';

  @override
  String get severeThinness => '重度の痩せ';

  @override
  String get moderateThinness => '中等度の痩せ';

  @override
  String get obeseClass1 => '肥満(1度)';

  @override
  String get obeseClass2 => '肥満(2度)';

  @override
  String get obeseClass3 => '肥満(3度)';

  @override
  String get pleaseFillAll => 'すべての項目に正しい数値を入力してください';

  @override
  String get savedToHistory => '履歴に保存しました';

  @override
  String get bodyFatRanges => '体脂肪率の範囲';

  @override
  String get bmiRange => 'BMI範囲';

  @override
  String get essentialFat => '必須脂肪';

  @override
  String get athletes => 'アスリート';

  @override
  String get fitness => 'フィットネス';

  @override
  String get average => '標準';

  @override
  String get aboutFormulas => '計算式について';

  @override
  String get formulaInfo =>
      'BMI = 体重 (kg) / 身長² (m²)\n\n体脂肪率 (Deurenberg):\nBF% = 1.20 × BMI + 0.23 × 年齢 − 10.8 × 性別 − 5.4\n(性別: 1 = 男性, 0 = 女性)\n\nこれらは推定値です。正確な評価については医療専門家にご相談ください。';

  @override
  String get deleteConfirm => 'すべての保存済み記録を削除しますか？';

  @override
  String get cancel => 'キャンセル';

  @override
  String get bodyFat => '体脂肪';

  @override
  String get calculateSave => 'BMIを計算して保存しましょう！';

  @override
  String get ageLabel => '年齢';

  @override
  String get fatLabel => '体脂肪';

  @override
  String get metricUnits => 'kg / cm';

  @override
  String get imperialUnits => 'lb / in';

  @override
  String get appVersion => 'v1.1';
}
