import 'package:flutter/material.dart';
import '../models/bmi_record.dart';
import 'storage_service.dart';

class HistoryProvider with ChangeNotifier {
  List<BmiRecord> _records = [];
  bool _isLoading = true;

  List<BmiRecord> get records => _records;
  bool get isLoading => _isLoading;

  HistoryProvider() {
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    _records = await StorageService.loadHistory();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addRecord(BmiRecord record) async {
    _records.insert(0, record);
    notifyListeners();
    // Persist in background
    await StorageService.saveHistory(_records);
  }

  Future<void> deleteRecord(String id) async {
    _records.removeWhere((r) => r.id == id);
    notifyListeners();
    // Persist in background
    await StorageService.saveHistory(_records);
  }

  Future<void> clearHistory() async {
    _records.clear();
    notifyListeners();
    await StorageService.clearHistory();
  }
}
