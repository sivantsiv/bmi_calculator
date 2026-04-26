import 'dart:convert';

class BmiRecord {
  final String id;
  final double weight; // kg (metric) or lbs (imperial)
  final double height; // cm (metric) or inches (imperial)
  final int age;
  final String gender; // 'male' or 'female'
  final double bmi;
  final double bodyFatPercentage;
  final String category;
  final DateTime dateTime;
  final bool isMetric;

  BmiRecord({
    required this.id,
    required this.weight,
    required this.height,
    required this.age,
    required this.gender,
    required this.bmi,
    required this.bodyFatPercentage,
    required this.category,
    required this.dateTime,
    this.isMetric = true,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'weight': weight,
        'height': height,
        'age': age,
        'gender': gender,
        'bmi': bmi,
        'bodyFatPercentage': bodyFatPercentage,
        'category': category,
        'dateTime': dateTime.toIso8601String(),
        'isMetric': isMetric,
      };

  factory BmiRecord.fromJson(Map<String, dynamic> json) => BmiRecord(
        id: json['id'] as String? ?? DateTime.now().millisecondsSinceEpoch.toString(),
        weight: (json['weight'] as num).toDouble(),
        height: (json['height'] as num).toDouble(),
        age: json['age'] as int,
        gender: json['gender'] as String,
        bmi: (json['bmi'] as num).toDouble(),
        bodyFatPercentage: (json['bodyFatPercentage'] as num).toDouble(),
        category: json['category'] as String,
        dateTime: DateTime.parse(json['dateTime'] as String),
        isMetric: json['isMetric'] as bool? ?? true,
      );

  static String encode(List<BmiRecord> records) =>
      json.encode(records.map((r) => r.toJson()).toList());

  static List<BmiRecord> decode(String source) =>
      (json.decode(source) as List<dynamic>)
          .map((item) => BmiRecord.fromJson(item as Map<String, dynamic>))
          .toList();
}
