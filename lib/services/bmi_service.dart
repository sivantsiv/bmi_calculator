import 'dart:math';

class BmiService {
  /// Calculate BMI from weight (kg) and height (cm).
  static double calculateBmi(double weightKg, double heightCm) {
    if (heightCm <= 0) return 0;
    final heightM = heightCm / 100.0;
    return weightKg / (heightM * heightM);
  }

  /// Estimate body fat % using the Deurenberg formula:
  /// BF% = 1.20 × BMI + 0.23 × Age − 10.8 × sex − 5.4
  /// where sex = 1 for male, 0 for female.
  static double calculateBodyFat(double bmi, int age, String gender) {
    final sex = gender.toLowerCase() == 'male' ? 1.0 : 0.0;
    final bf = 1.20 * bmi + 0.23 * age - 10.8 * sex - 5.4;
    return max(0, bf);
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
