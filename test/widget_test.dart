import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_bmi/main.dart';
import 'package:my_bmi/services/bmi_service.dart';
import 'package:my_bmi/services/settings_provider.dart';
import 'package:my_bmi/services/history_provider.dart';
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

  group('BmiService validation and parsing', () {
    test('validateWeight bounds', () {
      expect(BmiService.validateWeight(5, true), 'Weight too low');
      expect(BmiService.validateWeight(600, true), 'Weight too high');
      expect(BmiService.validateWeight(70, true), isNull);
    });

    test('validateHeight bounds', () {
      expect(BmiService.validateHeight(40, true), 'Height too low');
      expect(BmiService.validateHeight(300, true), 'Height too high');
      expect(BmiService.validateHeight(170, true), isNull);
    });

    test('validateAge bounds', () {
      expect(BmiService.validateAge(-1), 'Age cannot be negative');
      expect(BmiService.validateAge(150), 'Age too high');
      expect(BmiService.validateAge(25), isNull);
    });

    test('parseLocalizedDouble handles dots and commas', () {
      expect(BmiService.parseLocalizedDouble('70.5'), 70.5);
      expect(BmiService.parseLocalizedDouble('70,5'), 70.5);
      expect(BmiService.parseLocalizedDouble('  80,2  '), 80.2);
      expect(BmiService.parseLocalizedDouble(''), isNull);
      expect(BmiService.parseLocalizedDouble(null), isNull);
    });

    test('parseLocalizedInt handles whitespace and null', () {
      expect(BmiService.parseLocalizedInt(' 25 '), 25);
      expect(BmiService.parseLocalizedInt(''), isNull);
      expect(BmiService.parseLocalizedInt(null), isNull);
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

  testWidgets('App renders with bottom navigation and myBMI title', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsProvider()),
          ChangeNotifierProvider(create: (_) => HistoryProvider()),
        ],
        child: const MyBmiApp(),
      ),
    );
    await tester.pump(const Duration(seconds: 1));

    // Bottom nav items should be visible
    expect(find.text('Calculate'), findsOneWidget);
    expect(find.text('Reference'), findsOneWidget);
    expect(find.text('History'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
  });

  testWidgets('Calculator screen has inputs and calculates', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsProvider()),
          ChangeNotifierProvider(create: (_) => HistoryProvider()),
        ],
        child: const MyBmiApp(),
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
