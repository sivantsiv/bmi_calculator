// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'myBMI';

  @override
  String get calculator => '计算';

  @override
  String get reference => '参考';

  @override
  String get history => '历史';

  @override
  String get settings => '设置';

  @override
  String get profile => '个人资料';

  @override
  String get userName => '您的姓名';

  @override
  String get defaultAge => '默认年龄';

  @override
  String get defaultGender => '默认性别';

  @override
  String get male => '男';

  @override
  String get female => '女';

  @override
  String get defaults => '默认设置';

  @override
  String get unitSystem => '单位制';

  @override
  String get metric => '公制';

  @override
  String get imperial => '英制';

  @override
  String get defaultHeightCm => '默认身高 (厘米)';

  @override
  String get defaultHeightIn => '默认身高 (英寸)';

  @override
  String get defaultWeightKg => '默认体重 (公斤)';

  @override
  String get defaultWeightLbs => '默认体重 (磅)';

  @override
  String get saveSettings => '保存设置';

  @override
  String get settingsSaved => '设置已保存';

  @override
  String get language => '语言';

  @override
  String get systemDefault => '系统默认';

  @override
  String get height => '身高';

  @override
  String get weight => '体重';

  @override
  String get age => '年龄';

  @override
  String get gender => '性别';

  @override
  String get calculateBmi => '开始计算';

  @override
  String get bmiResult => '您的 BMI 是';

  @override
  String get bmiCategory => '分类';

  @override
  String get saveResult => '保存结果';

  @override
  String get resultSaved => '结果已保存';

  @override
  String get historyEmpty => '暂无记录';

  @override
  String get clearHistory => '清除历史';

  @override
  String get deleteRecord => '删除';

  @override
  String get bmiTable => 'BMI 参考表';

  @override
  String get underweight => '体重过轻';

  @override
  String get normal => '正常体重';

  @override
  String get overweight => '超重';

  @override
  String get obese => '肥胖';

  @override
  String get severeThinness => '严重消瘦';

  @override
  String get moderateThinness => '中度消瘦';

  @override
  String get obeseClass1 => '肥胖 I 级';

  @override
  String get obeseClass2 => '肥胖 II 级';

  @override
  String get obeseClass3 => '肥胖 III 级';

  @override
  String get pleaseFillAll => '请填写所有字段并输入有效数字';

  @override
  String get savedToHistory => '已保存到历史记录';

  @override
  String get bodyFatRanges => '体脂肪率范围';

  @override
  String get bmiRange => 'BMI 范围';

  @override
  String get essentialFat => '必需脂肪';

  @override
  String get athletes => '运动员';

  @override
  String get fitness => '健身';

  @override
  String get average => '平均';

  @override
  String get aboutFormulas => '关于公式';

  @override
  String get formulaInfo =>
      'BMI = 体重 (kg) / 身高² (m²)\n\n体脂肪率 (Deurenberg):\nBF% = 1.20 × BMI + 0.23 × 年龄 − 10.8 × 性别 − 5.4\n(性别: 1 = 男, 0 = 女)\n\n以上数据仅供参考。如需准确评估，请咨询医疗专业人士。';

  @override
  String get deleteConfirm => '删除所有保存的记录？';

  @override
  String get cancel => '取消';

  @override
  String get bodyFat => '体脂肪';

  @override
  String get calculateSave => '计算您的 BMI 并保存！';

  @override
  String get ageLabel => '年龄';

  @override
  String get fatLabel => '脂肪';

  @override
  String get metricUnits => '公斤 / 厘米';

  @override
  String get imperialUnits => '磅 / 英寸';

  @override
  String get appVersion => 'v1.1';
}
