import 'package:shared_preferences/shared_preferences.dart';
import '../models/bmi_record.dart';
import '../models/user_settings.dart';

class StorageService {
  static const _historyKey = 'bmi_history';
  static const _settingsKey = 'user_settings';

  // ── History ──────────────────────────────────────────

  static Future<List<BmiRecord>> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_historyKey);
    if (raw == null || raw.isEmpty) return [];
    return BmiRecord.decode(raw);
  }

  static Future<void> saveHistory(List<BmiRecord> records) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_historyKey, BmiRecord.encode(records));
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
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_settingsKey);
    if (raw == null || raw.isEmpty) return UserSettings();
    return UserSettings.decode(raw);
  }

  static Future<void> saveSettings(UserSettings settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_settingsKey, settings.encode());
  }
}
