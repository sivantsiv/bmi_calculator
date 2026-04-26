import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/bmi_record.dart';
import '../theme/glass_container.dart';
import '../theme/app_theme.dart';
import '../l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../services/history_provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  Future<void> _delete(String id) async {
    await Provider.of<HistoryProvider>(context, listen: false).deleteRecord(id);
  }

  Future<void> _clearAll() async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          l10n.clearHistory,
          style: GoogleFonts.inter(color: AppTheme.textPrimary),
        ),
        content: Text(
          l10n.deleteConfirm,
          style: GoogleFonts.inter(color: AppTheme.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              l10n.cancel,
              style: GoogleFonts.inter(color: AppTheme.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              l10n.deleteRecord,
              style: GoogleFonts.inter(color: AppTheme.error),
            ),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      if (!mounted) return;
      await Provider.of<HistoryProvider>(context, listen: false).clearHistory();
    }
  }
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final history = Provider.of<HistoryProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(l10n.history),
        actions: [
          if (history.records.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep_rounded),
              tooltip: l10n.clearHistory,
              onPressed: _clearAll,
            ),
        ],
      ),
      body: history.isLoading
          ? const Center(child: CircularProgressIndicator())
          : history.records.isEmpty
          ? _buildEmpty(context)
          : _buildList(history.records),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.history,
            size: 64,
            color: AppTheme.textSecondary.withValues(alpha: 0.4),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.historyEmpty,
            style: GoogleFonts.outfit(
              fontSize: 18,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.calculateSave,
            style: GoogleFonts.outfit(
              fontSize: 14,
              color: AppTheme.textSecondary.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<BmiRecord> records) {
    final l10n = AppLocalizations.of(context)!;
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: records.length,
      itemBuilder: (context, index) {
        final r = records[index];
        final catColor = AppTheme.categoryColor(r.category);
        final dateStr = DateFormat('MMM d, yyyy – HH:mm').format(r.dateTime);
        final unitLabel = r.isMetric ? l10n.metricUnits : l10n.imperialUnits;

        return Dismissible(
          key: ValueKey(r.id),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 24),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.error.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.delete, color: AppTheme.error),
          ),
          onDismissed: (_) => _delete(r.id),
          child: GlassContainer(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // BMI circle
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: catColor.withValues(alpha: 0.15),
                    border: Border.all(color: catColor, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      r.bmi.toStringAsFixed(1),
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: catColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: catColor.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              _getLocalizedCategory(context, r.category),
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: catColor,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${r.bodyFatPercentage.toStringAsFixed(1)}% ${l10n.fatLabel}',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppTheme.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${r.weight.toStringAsFixed(1)} / ${r.height.toStringAsFixed(0)} ($unitLabel) · ${l10n.ageLabel} ${r.age} · ${r.gender[0].toUpperCase()}',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        dateStr,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: AppTheme.textSecondary.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
