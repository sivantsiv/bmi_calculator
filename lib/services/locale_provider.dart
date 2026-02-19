import 'package:flutter/material.dart';
import 'storage_service.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  LocaleProvider() {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final settings = await StorageService.loadSettings();
    if (settings.languageCode == 'system') {
      _locale = null;
    } else {
      _locale = Locale(settings.languageCode);
    }
    notifyListeners();
  }

  Future<void> setLocale(String languageCode) async {
    if (languageCode == 'system') {
      if (_locale == null) return;
      _locale = null;
    } else {
      if (_locale?.languageCode == languageCode) return;
      _locale = Locale(languageCode);
    }

    // Save to storage
    final settings = await StorageService.loadSettings();
    await StorageService.saveSettings(
      settings.copyWith(languageCode: languageCode),
    );

    notifyListeners();
  }
}
