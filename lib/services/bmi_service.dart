import 'dart:math';

class BmiService {
  // Constants for validation
  static const double minHeightCm = 50;
  static const double maxHeightCm = 250;
  static const double minWeightKg = 10;
  static const double maxWeightKg = 500;
  static const int minAge = 0;
  static const int maxAge = 120;

  /// Calculate BMI from weight (kg) and height (cm).
  static double calculateBmi(double weightKg, double heightCm) {
    if (heightCm <= 0) return 0;
    final heightM = heightCm / 100.0;
    return weightKg / (heightM * heightM);
  }

  /// Parse numeric input allowing comma as decimal separator.
  static double? parseLocalizedDouble(String? text) {
    if (text == null || text.trim().isEmpty) return null;
    return double.tryParse(text.trim().replaceAll(',', '.'));
  }

  /// Parse integer input with trimming.
  static int? parseLocalizedInt(String? text) {
    if (text == null || text.trim().isEmpty) return null;
    return int.tryParse(text.trim());
  }

  /// Estimate body fat % using the Deurenberg formula:
  /// BF% = 1.20 × BMI + 0.23 × Age − 10.8 × sex − 5.4
  /// where sex = 1 for male, 0 for female.
  static double calculateBodyFat(double bmi, int age, String gender) {
    if (bmi <= 0 || age < 0) return 0;
    final sex = gender.trim().toLowerCase() == 'male' ? 1.0 : 0.0;
    final bf = 1.20 * bmi + 0.23 * age - 10.8 * sex - 5.4;
    return max(0, bf);
  }

  /// Validate inputs.
  static String? validateWeight(double? weight, bool isMetric) {
    if (weight == null) return 'Invalid weight';
    final weightKg = isMetric ? weight : lbsToKg(weight);
    if (weightKg < minWeightKg) return 'Weight too low';
    if (weightKg > maxWeightKg) return 'Weight too high';
    return null;
  }

  static String? validateHeight(double? height, bool isMetric) {
    if (height == null) return 'Invalid height';
    final heightCm = isMetric ? height : inchesToCm(height);
    if (heightCm < minHeightCm) return 'Height too low';
    if (heightCm > maxHeightCm) return 'Height too high';
    return null;
  }

  static String? validateAge(int? age) {
    if (age == null) return 'Invalid age';
    if (age < minAge) return 'Age cannot be negative';
    if (age > maxAge) return 'Age too high';
    return null;
  }

  /// Return readable BMI category.
  static String getCategory(double bmi) {
    if (bmi < 16.0) return 'Severe Thinness';
    if (bmi < 17.0) return 'Moderate Thinness';
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25.0) return 'Normal';
    if (bmi < 30.0) return 'Overweight';
    if (bmi < 35.0) return 'Obese Class I';
    if (bmi < 40.0) return 'Obese Class II';
    return 'Obese Class III';
  }

  /// Convert lbs to kg.
  static double lbsToKg(double lbs) => lbs * 0.453592;

  /// Convert inches to cm.
  static double inchesToCm(double inches) => inches * 2.54;

  /// Convert kg to lbs.
  static double kgToLbs(double kg) => kg / 0.453592;

  /// Convert cm to inches.
  static double cmToInches(double cm) => cm / 2.54;
}
