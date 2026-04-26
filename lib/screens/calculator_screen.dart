import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/bmi_record.dart';
import '../services/bmi_service.dart';
import '../theme/app_theme.dart';
import '../theme/glass_container.dart';
import '../l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../services/settings_provider.dart';
import '../services/history_provider.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen>
    with SingleTickerProviderStateMixin {
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _ageController = TextEditingController();
  String _gender = 'male';
  bool _useMetric = true;

  bool _hasResult = false;
  double _bmi = 0;
  double _bodyFat = 0;
  String _category = '';

  late AnimationController _animController;
  late Animation<double> _gaugeAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _gaugeAnimation = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeOutCubic),
    );
    _loadDefaults();
  }

  void _loadDefaults() {
    final s = Provider.of<SettingsProvider>(context, listen: false).settings;
    _gender = s.defaultGender;
    _ageController.text = s.defaultAge.toString();
    _useMetric = s.useMetric;
    _heightController.text = s.defaultHeight.toStringAsFixed(0);
    _weightController.text = s.defaultWeight.toStringAsFixed(0);
  }

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _ageController.dispose();
    _animController.dispose();
    super.dispose();
  }

  void _calculate() {
    final weight = double.tryParse(_weightController.text);
    final height = double.tryParse(_heightController.text);
    final age = int.tryParse(_ageController.text);

    final weightErr = BmiService.validateWeight(weight, _useMetric);
    final heightErr = BmiService.validateHeight(height, _useMetric);
    final ageErr = BmiService.validateAge(age);

    if (weightErr != null || heightErr != null || ageErr != null) {
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(weightErr ?? heightErr ?? ageErr ?? l10n.pleaseFillAll),
          backgroundColor: AppTheme.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
      return;
    }

    double weightKg = _useMetric ? weight! : BmiService.lbsToKg(weight!);
    double heightCm = _useMetric ? height! : BmiService.inchesToCm(height!);

    final bmi = BmiService.calculateBmi(weightKg, heightCm);
    final bf = BmiService.calculateBodyFat(bmi, age!, _gender);
    final cat = BmiService.getCategory(bmi);

    setState(() {
      _bmi = bmi;
      _bodyFat = bf;
      _category = cat;
      _hasResult = true;
      _gaugeAnimation = Tween<double>(begin: 0, end: bmi.clamp(0, 50) / 50)
          .animate(
            CurvedAnimation(
              parent: _animController,
              curve: Curves.easeOutCubic,
            ),
          );
    });
    _animController.forward(from: 0);
  }

  Future<void> _saveResult() async {
    final weight = double.tryParse(_weightController.text);
    final height = double.tryParse(_heightController.text);
    final age = int.tryParse(_ageController.text);

    if (weight == null || height == null || age == null) return;

    final record = BmiRecord(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      weight: weight,
      height: height,
      age: age,
      gender: _gender,
      bmi: _bmi,
      bodyFatPercentage: _bodyFat,
      category: _category,
      dateTime: DateTime.now(),
      isMetric: _useMetric,
    );
    
    await Provider.of<HistoryProvider>(context, listen: false).addRecord(record);
    
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.resultSaved),
        backgroundColor: AppTheme.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: Text(l10n.calculateBmi)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // ── Input Card ────────────────────────────────
            _buildInputCard(),
            const SizedBox(height: 24),
            // ── Calculate Button ──────────────────────────
            ElevatedButton(
              onPressed: _calculate,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
              ),
              child: Text(l10n.calculateBmi),
            ),
            const SizedBox(height: 32),
            // ── Result ────────────────────────────────────
            if (_hasResult) _buildResultCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputCard() {
    final l10n = AppLocalizations.of(context)!;
    return GlassContainer(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Gender toggle
          _buildGenderToggle(l10n),
          const SizedBox(height: 24),
          // Unit toggle
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                l10n.imperial,
                style: GoogleFonts.outfit(
                  color: AppTheme.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Switch(
                  value: _useMetric,
                  activeTrackColor: AppTheme.accent.withValues(alpha: 0.5),
                  activeColor: AppTheme.accent,
                  onChanged: (v) => setState(() => _useMetric = v),
                ),
              ),
              Text(
                l10n.metric,
                style: GoogleFonts.outfit(
                  color: AppTheme.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Weight
          TextField(
            controller: _weightController,
            keyboardType: TextInputType.number,
            style: GoogleFonts.outfit(fontSize: 18),
            decoration: InputDecoration(
              labelText: _useMetric
                  ? l10n.weight + ' (kg)'
                  : l10n.weight + ' (lbs)',
              prefixIcon: const Icon(
                Icons.fitness_center_rounded,
                color: AppTheme.accent,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Height
          TextField(
            controller: _heightController,
            keyboardType: TextInputType.number,
            style: GoogleFonts.outfit(fontSize: 18),
            decoration: InputDecoration(
              labelText: _useMetric
                  ? l10n.height + ' (cm)'
                  : l10n.height + ' (inches)',
              prefixIcon: const Icon(
                Icons.straighten_rounded,
                color: AppTheme.accent,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Age
          TextField(
            controller: _ageController,
            keyboardType: TextInputType.number,
            style: GoogleFonts.outfit(fontSize: 18),
            decoration: InputDecoration(
              labelText: l10n.age,
              prefixIcon: const Icon(
                Icons.cake_rounded,
                color: AppTheme.accent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderToggle(AppLocalizations l10n) {
    return Row(
      children: [
        _buildGenderOption(
          'male',
          Icons.male_rounded,
          l10n.male,
          const Color(0xFF42A5F5),
        ),
        const SizedBox(width: 16),
        _buildGenderOption(
          'female',
          Icons.female_rounded,
          l10n.female,
          const Color(0xFFEF5350),
        ),
      ],
    );
  }

  Widget _buildGenderOption(
    String value,
    IconData icon,
    String label,
    Color color,
  ) {
    bool isSelected = _gender == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _gender = value),
        child: GlassContainer(
          borderRadius: 16,
          padding: const EdgeInsets.symmetric(vertical: 16),
          opacity: isSelected ? 0.3 : 0.1,
          gradientColors: isSelected
              ? [color.withValues(alpha: 0.3), color.withValues(alpha: 0.1)]
              : null,
          child: Column(
            children: [
              Icon(
                icon,
                size: 32,
                color: isSelected ? color : AppTheme.textSecondary,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: isSelected ? Colors.white : AppTheme.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultCard() {
    final l10n = AppLocalizations.of(context)!;
    final catColor = AppTheme.categoryColor(_category);
    return AnimatedBuilder(
      animation: _animController,
      builder: (context, child) {
        return GlassContainer(
          padding: const EdgeInsets.all(32),
          gradientColors: [
            catColor.withValues(alpha: 0.15),
            Colors.white.withValues(alpha: 0.05),
          ],
          child: Column(
            children: [
              // Gauge
              SizedBox(
                height: 180,
                width: 180,
                child: CustomPaint(
                  painter: _BmiGaugePainter(
                    progress: _gaugeAnimation.value,
                    color: catColor,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _bmi.toStringAsFixed(1),
                          style: GoogleFonts.outfit(
                            fontSize: 48,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'BMI',
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Category chip
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [catColor, catColor.withValues(alpha: 0.7)],
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: catColor.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  _getLocalizedCategory(context, _category).toUpperCase(),
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Body fat
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.water_drop_rounded,
                    color: AppTheme.accent,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${l10n.bodyFat}: ${_bodyFat.toStringAsFixed(1)}%',
                    style: GoogleFonts.outfit(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Save button
              TextButton.icon(
                onPressed: _saveResult,
                icon: const Icon(Icons.bookmark_add_rounded),
                label: Text(l10n.saveResult),
                style: TextButton.styleFrom(
                  foregroundColor: AppTheme.accent,
                  textStyle: GoogleFonts.outfit(
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getLocalizedCategory(BuildContext context, String category) {
    final l10n = AppLocalizations.of(context)!;
    switch (category) {
      case 'Severe Thinness':
        return l10n.severeThinness;
      case 'Moderate Thinness':
        return l10n.moderateThinness;
      case 'Underweight':
        return l10n.underweight;
      case 'Normal':
        return l10n.normal;
      case 'Overweight':
        return l10n.overweight;
      case 'Obese Class I':
        return l10n.obeseClass1;
      case 'Obese Class II':
        return l10n.obeseClass2;
      case 'Obese Class III':
        return l10n.obeseClass3;
      default:
        return category;
    }
  }
}

// AnimatedBuilder is just an alias — use AnimatedBuilder widget
// We use AnimatedBuilder above with CustomPaint for the gauge.

class _BmiGaugePainter extends CustomPainter {
  final double progress;
  final Color color;

  _BmiGaugePainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 8;
    const startAngle = 2.3; // radians (≈ 7 o'clock)
    const sweepTotal = 2 * 3.14159 - 2 * (2.3 - 3.14159); // ≈ 4.88 radians

    // Background arc
    final bgPaint = Paint()
      ..color = AppTheme.surfaceLight
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepTotal,
      false,
      bgPaint,
    );

    // Progress arc
    final fgPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepTotal * progress,
      false,
      fgPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _BmiGaugePainter old) =>
      old.progress != progress || old.color != color;
}
