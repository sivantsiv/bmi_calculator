import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../l10n/app_localizations.dart';

class ReferenceTableScreen extends StatelessWidget {
  const ReferenceTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.bmiTable)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── BMI Categories ────────────────────────────
            _sectionTitle(context, l10n.bmiCategory),
            const SizedBox(height: 8),
            _buildBmiTable(context),
            const SizedBox(height: 28),
            // ── Body Fat % Ranges ─────────────────────────
            _sectionTitle(context, l10n.bodyFatRanges),
            const SizedBox(height: 8),
            _buildBodyFatTable(context),
            const SizedBox(height: 28),
            // ── Info Card ─────────────────────────────────
            _buildInfoCard(context),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppTheme.accent,
      ),
    );
  }

  Widget _buildBmiTable(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final rows = <_BmiRow>[
      _BmiRow(l10n.severeThinness, '< 16.0', AppTheme.underweight),
      _BmiRow(l10n.moderateThinness, '16.0 – 16.9', AppTheme.underweight),
      _BmiRow(l10n.underweight, '17.0 – 18.4', AppTheme.underweight),
      _BmiRow(l10n.normal, '18.5 – 24.9', AppTheme.normal),
      _BmiRow(l10n.overweight, '25.0 – 29.9', AppTheme.overweight),
      _BmiRow(l10n.obeseClass1, '30.0 – 34.9', AppTheme.obese),
      _BmiRow(l10n.obeseClass2, '35.0 – 39.9', AppTheme.obese),
      _BmiRow(l10n.obeseClass3, '≥ 40.0', AppTheme.obese),
    ];

    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            _tableHeader([l10n.bmiCategory, l10n.bmiRange]),
            ...rows.map((r) => _colorRow(r.label, r.range, r.color)),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyFatTable(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            _tableHeader([l10n.bmiCategory, l10n.male, l10n.female]),
            _threeColRow(
              l10n.essentialFat,
              '2–5%',
              '10–13%',
              AppTheme.underweight,
            ),
            _threeColRow(l10n.athletes, '6–13%', '14–20%', AppTheme.normal),
            _threeColRow(l10n.fitness, '14–17%', '21–24%', AppTheme.normal),
            _threeColRow(l10n.average, '18–24%', '25–31%', AppTheme.overweight),
            _threeColRow(l10n.obese, '≥ 25%', '≥ 32%', AppTheme.obese),
          ],
        ),
      ),
    );
  }

  Widget _tableHeader(List<String> labels) {
    return Container(
      color: AppTheme.primary.withValues(alpha: 0.3),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: labels
            .map(
              (l) => Expanded(
                child: Text(
                  l,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textPrimary,
                    fontSize: 14,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _colorRow(String label, String range, Color color) {
    return Container(
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: color, width: 4)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              range,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(color: AppTheme.textSecondary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _threeColRow(String label, String men, String women, Color color) {
    return Container(
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: color, width: 4)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              men,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(color: AppTheme.textSecondary),
            ),
          ),
          Expanded(
            child: Text(
              women,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(color: AppTheme.textSecondary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.info_outline, color: AppTheme.accent),
              const SizedBox(width: 8),
              Text(
                l10n.aboutFormulas,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: AppTheme.accent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            l10n.formulaInfo,
            style: GoogleFonts.inter(
              color: AppTheme.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _BmiRow {
  final String label;
  final String range;
  final Color color;
  _BmiRow(this.label, this.range, this.color);
}
