import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculate_bmi/main.dart';
import 'package:calculate_bmi/services/bmi_service.dart';
import 'package:calculate_bmi/services/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });
  // ── Unit tests: BmiService ──────────────────────────────

  group('BmiService.calculateBmi', () {
    test('normal BMI for 70kg / 175cm', () {
      final bmi = BmiService.calculateBmi(70, 175);
      expect(bmi, closeTo(22.86, 0.01));
    });

    test('returns 0 when height is 0', () {
      expect(BmiService.calculateBmi(70, 0), 0);
    });

    test('overweight BMI for 90kg / 170cm', () {
      final bmi = BmiService.calculateBmi(90, 170);
      expect(bmi, closeTo(31.14, 0.01));
    });

    test('underweight BMI for 45kg / 170cm', () {
      final bmi = BmiService.calculateBmi(45, 170);
      expect(bmi, closeTo(15.57, 0.01));
    });
  });

  group('BmiService.getCategory', () {
    test('severe thinness below 16', () {
      expect(BmiService.getCategory(15), 'Severe Thinness');
    });

    test('normal for 22', () {
      expect(BmiService.getCategory(22), 'Normal');
    });

    test('overweight for 27', () {
      expect(BmiService.getCategory(27), 'Overweight');
    });

    test('obese class I for 32', () {
      expect(BmiService.getCategory(32), 'Obese Class I');
    });

    test('obese class III for 42', () {
      expect(BmiService.getCategory(42), 'Obese Class III');
    });
  });

  group('BmiService.calculateBodyFat', () {
    test('body fat for male, bmi 22, age 30', () {
      final bf = BmiService.calculateBodyFat(22, 30, 'male');
      // 1.20*22 + 0.23*30 - 10.8*1 - 5.4 = 26.4 +6.9 -10.8 -5.4 = 17.1
      expect(bf, closeTo(17.1, 0.01));
    });

    test('body fat for female, bmi 22, age 30', () {
      final bf = BmiService.calculateBodyFat(22, 30, 'female');
      // 1.20*22 + 0.23*30 - 10.8*0 - 5.4 = 26.4+6.9-0-5.4 = 27.9
      expect(bf, closeTo(27.9, 0.01));
    });

    test('never returns negative', () {
      expect(
        BmiService.calculateBodyFat(10, 5, 'male'),
        greaterThanOrEqualTo(0),
      );
    });
  });

  group('BmiService unit conversions', () {
    test('lbs to kg', () {
      expect(BmiService.lbsToKg(154), closeTo(69.85, 0.1));
    });

    test('inches to cm', () {
      expect(BmiService.inchesToCm(69), closeTo(175.26, 0.1));
    });
  });

  // ── Widget smoke test ───────────────────────────────────

  testWidgets('App renders with bottom navigation', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => LocaleProvider(),
        child: const CalculateBmiApp(),
      ),
    );
    await tester.pump(const Duration(seconds: 1));

    // Bottom nav items should be visible
    expect(find.text('Calculate'), findsOneWidget);
    expect(find.text('Reference'), findsOneWidget);
    expect(find.text('History'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
  });

  testWidgets('Calculator screen has inputs', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => LocaleProvider(),
        child: const CalculateBmiApp(),
      ),
    );
    await tester.pump(const Duration(seconds: 1));

    // Ensure we are on calculator tab
    await tester.tap(find.byIcon(Icons.calculate_rounded));
    await tester.pump(const Duration(milliseconds: 500));

    // Gender buttons
    expect(find.textContaining('Male'), findsAtLeastNWidgets(1));
    expect(find.textContaining('Female'), findsAtLeastNWidgets(1));

    // Calculate button
    expect(find.textContaining('CALCULATE'), findsAtLeastNWidgets(1));
  });
}
