import 'package:flutter/material.dart';
import '../models/user_settings.dart';
import 'storage_service.dart';

class SettingsProvider with ChangeNotifier {
  UserSettings _settings = UserSettings();
  bool _isLoading = true;

  UserSettings get settings => _settings;
  bool get isLoading => _isLoading;

  Locale? get locale {
    if (_settings.languageCode == 'system') return null;
    return Locale(_settings.languageCode);
  }

  SettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    _settings = await StorageService.loadSettings();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateSettings(UserSettings newSettings) async {
    _settings = newSettings;
    await StorageService.saveSettings(_settings);
    notifyListeners();
  }

  Future<void> setLocale(String languageCode) async {
    _settings = _settings.copyWith(languageCode: languageCode);
    await StorageService.saveSettings(_settings);
    notifyListeners();
  }

  Future<void> updateUnits(bool useMetric) async {
    _settings = _settings.copyWith(useMetric: useMetric);
    await StorageService.saveSettings(_settings);
    notifyListeners();
  }
}
