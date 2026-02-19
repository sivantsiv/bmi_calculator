import 'dart:convert';

class UserSettings {
  final String name;
  final String defaultGender; // 'male' or 'female'
  final int defaultAge;
  final bool useMetric;
  final double defaultHeight; // cm or inches
  final double defaultWeight; // kg or lbs
  final String languageCode;

  UserSettings({
    this.name = '',
    this.defaultGender = 'male',
    this.defaultAge = 25,
    this.useMetric = true,
    this.defaultHeight = 170.0,
    this.defaultWeight = 70.0,
    this.languageCode = 'system',
  });

  UserSettings copyWith({
    String? name,
    String? defaultGender,
    int? defaultAge,
    bool? useMetric,
    double? defaultHeight,
    double? defaultWeight,
    String? languageCode,
  }) => UserSettings(
    name: name ?? this.name,
    defaultGender: defaultGender ?? this.defaultGender,
    defaultAge: defaultAge ?? this.defaultAge,
    useMetric: useMetric ?? this.useMetric,
    defaultHeight: defaultHeight ?? this.defaultHeight,
    defaultWeight: defaultWeight ?? this.defaultWeight,
    languageCode: languageCode ?? this.languageCode,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'defaultGender': defaultGender,
    'defaultAge': defaultAge,
    'useMetric': useMetric,
    'defaultHeight': defaultHeight,
    'defaultWeight': defaultWeight,
    'languageCode': languageCode,
  };

  factory UserSettings.fromJson(Map<String, dynamic> json) => UserSettings(
    name: json['name'] as String? ?? '',
    defaultGender: json['defaultGender'] as String? ?? 'male',
    defaultAge: json['defaultAge'] as int? ?? 25,
    useMetric: json['useMetric'] as bool? ?? true,
    defaultHeight: (json['defaultHeight'] as num?)?.toDouble() ?? 170.0,
    defaultWeight: (json['defaultWeight'] as num?)?.toDouble() ?? 70.0,
    languageCode: json['languageCode'] as String? ?? 'system',
  );

  String encode() => json.encode(toJson());

  static UserSettings decode(String source) =>
      UserSettings.fromJson(json.decode(source) as Map<String, dynamic>);
}
