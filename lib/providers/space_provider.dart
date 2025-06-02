// 📄 lib/providers/space_provider.dart
// ✅ Space 상태 관리 Provider (Hive 연동)
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/space.dart';

class SpaceProvider with ChangeNotifier {
  final Box<Space> _spaceBox = Hive.box<Space>('spaces');

  List<Space> get spaces => _spaceBox.values.toList();

  void addSpace(Space space) {
    _spaceBox.add(space);
    notifyListeners();
  }

  void updateSpace(int index, Space updated) {
    _spaceBox.putAt(index, updated);
    notifyListeners();
  }

  void deleteSpace(int index) {
    _spaceBox.deleteAt(index);
    notifyListeners();
  }

  Space? getSpaceById(String id) {
    try {
      return _spaceBox.values.firstWhere((s) => s.id == id);
    } catch (_) {
      return null;
    }
  }
}
