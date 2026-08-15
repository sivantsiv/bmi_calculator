import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/user_settings.dart';
import '../services/bmi_service.dart';
import '../theme/app_theme.dart';
import 'package:provider/provider.dart';
import '../services/settings_provider.dart';
import '../l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  String _gender = 'male';
  bool _useMetric = true;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final settingsProvider = Provider.of<SettingsProvider>(context);
      if (!settingsProvider.isLoading) {
        _load(settingsProvider.settings);
        _initialized = true;
      }
    }
  }

  void _load(UserSettings s) {
    _nameController.text = s.name;
    _ageController.text = s.defaultAge.toString();
    _heightController.text = s.defaultHeight.toStringAsFixed(0);
    _weightController.text = s.defaultWeight.toStringAsFixed(0);
    _gender = s.defaultGender;
    _useMetric = s.useMetric;
  }

  Future<void> _save() async {
    final weight = BmiService.parseLocalizedDouble(_weightController.text);
    final height = BmiService.parseLocalizedDouble(_heightController.text);
    final age = BmiService.parseLocalizedInt(_ageController.text);

    if (weight == null || height == null || age == null) {
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.pleaseFillAll),
          backgroundColor: AppTheme.error,
        ),
      );
      return;
    }

    final provider = Provider.of<SettingsProvider>(context, listen: false);
    final currentLanguageCode = provider.settings.languageCode;

    final settings = UserSettings(
      name: _nameController.text.trim(),
      defaultGender: _gender,
      defaultAge: age,
      useMetric: _useMetric,
      defaultHeight: height,
      defaultWeight: weight,
      languageCode: currentLanguageCode,
    );
    
    await provider.updateSettings(settings);
    
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.settingsSaved),
        backgroundColor: AppTheme.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    if (settingsProvider.isLoading && !_initialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (!_initialized) {
      _load(settingsProvider.settings);
      _initialized = true;
    }

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildCard(
              title: l10n.profile,
              icon: Icons.person,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: l10n.userName,
                    prefixIcon: const Icon(Icons.badge, color: AppTheme.accent),
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: l10n.defaultAge,
                    prefixIcon: const Icon(Icons.cake, color: AppTheme.accent),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  l10n.defaultGender,
                  style: GoogleFonts.outfit(color: AppTheme.textSecondary),
                ),
                const SizedBox(height: 8),
                _buildGenderChips(l10n),
              ],
            ),
            const SizedBox(height: 16),
            _buildCard(
              title: l10n.defaults,
              icon: Icons.tune,
              children: [
                // Language selection
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.language,
                      style: GoogleFonts.outfit(color: AppTheme.textSecondary),
                    ),
                    _buildLanguageDropdown(context),
                  ],
                ),
                const SizedBox(height: 16),
                // Unit toggle
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.unitSystem,
                      style: GoogleFonts.outfit(color: AppTheme.textSecondary),
                    ),
                    SegmentedButton<bool>(
                      segments: [
                        ButtonSegment(value: true, label: Text(l10n.metric)),
                        ButtonSegment(value: false, label: Text(l10n.imperial)),
                      ],
                      selected: {_useMetric},
                      onSelectionChanged: (v) =>
                          setState(() => _useMetric = v.first),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith((
                          states,
                        ) {
                          if (states.contains(WidgetState.selected)) {
                            return AppTheme.primary;
                          }
                          return AppTheme.surfaceLight;
                        }),
                        foregroundColor: WidgetStateProperty.all(
                          AppTheme.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: _heightController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: _useMetric
                        ? l10n.defaultHeightCm
                        : l10n.defaultHeightIn,
                    prefixIcon: const Icon(
                      Icons.height,
                      color: AppTheme.accent,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: _weightController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: _useMetric
                        ? l10n.defaultWeightKg
                        : l10n.defaultWeightLbs,
                    prefixIcon: const Icon(
                      Icons.fitness_center,
                      color: AppTheme.accent,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Save button
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primary.withValues(alpha: 0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  onPressed: _save,
                  icon: const Icon(Icons.check),
                  label: Text(l10n.saveSettings),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // App info
            Text(
              '${l10n.appTitle} ${l10n.appVersion}',
              style: GoogleFonts.outfit(
                fontSize: 12,
                color: AppTheme.textSecondary.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
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
              Icon(icon, color: AppTheme.accent),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.outfit(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.accent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildLanguageDropdown(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localeProvider = Provider.of<SettingsProvider>(context);
    final languages = {
      'system': l10n.systemDefault,
      'en': 'English',
      'zh': '中文',
      'es': 'Español',
      'ar': 'العربية',
      'id': 'Bahasa Indonesia',
      'pt': 'Português',
      'fr': 'Français',
      'ja': '日本語',
      'ru': 'Русский',
      'de': 'Deutsch',
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppTheme.surfaceLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: localeProvider.settings.languageCode,
          dropdownColor: AppTheme.surface,
          items: languages.entries.map((e) {
            return DropdownMenuItem(
              value: e.key,
              child: Text(
                e.value,
                style: GoogleFonts.outfit(color: AppTheme.textPrimary),
              ),
            );
          }).toList(),
          onChanged: (val) {
            if (val != null) {
              localeProvider.setLocale(val);
            }
          },
        ),
      ),
    );
  }

  Widget _buildGenderChips(AppLocalizations l10n) {
    return Row(
      children: [
        _genderChip('male', Icons.male, l10n.male),
        const SizedBox(width: 12),
        _genderChip('female', Icons.female, l10n.female),
      ],
    );
  }

  Widget _genderChip(String value, IconData icon, String label) {
    final selected = _gender == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _gender = value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected
                ? AppTheme.primary.withValues(alpha: 0.3)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected ? AppTheme.primary : AppTheme.surfaceLight,
              width: 2,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: selected ? AppTheme.accent : AppTheme.textSecondary,
                size: 22,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w600,
                  color: selected
                      ? AppTheme.textPrimary
                      : AppTheme.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
