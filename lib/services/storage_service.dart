import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/bmi_record.dart';
import '../models/user_settings.dart';

class StorageService {
  static const _historyKey = 'bmi_history';
  static const _settingsKey = 'user_settings';

  // ── History ──────────────────────────────────────────

  static Future<List<BmiRecord>> loadHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_historyKey);
      if (raw == null || raw.isEmpty) return [];
      return BmiRecord.decode(raw);
    } catch (e) {
      debugPrint('Error loading history: $e');
      return [];
    }
  }

  static Future<void> saveHistory(List<BmiRecord> records) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_historyKey, BmiRecord.encode(records));
    } catch (e) {
      debugPrint('Error saving history: $e');
    }
  }

  static Future<void> addRecord(BmiRecord record) async {
    final history = await loadHistory();
    history.insert(0, record); // newest first
    await saveHistory(history);
  }

  static Future<void> deleteRecord(int index) async {
    final history = await loadHistory();
    if (index >= 0 && index < history.length) {
      history.removeAt(index);
      await saveHistory(history);
    }
  }

  static Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_historyKey);
  }

  // ── Settings ─────────────────────────────────────────

  static Future<UserSettings> loadSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_settingsKey);
      if (raw == null || raw.isEmpty) return UserSettings();
      return UserSettings.decode(raw);
    } catch (e) {
      debugPrint('Error loading settings: $e');
      return UserSettings();
    }
  }

  static Future<void> saveSettings(UserSettings settings) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_settingsKey, settings.encode());
    } catch (e) {
      debugPrint('Error saving settings: $e');
    }
  }
}
