// 📄 lib/providers/furniture_provider.dart
// ✅ Hive + Provider 기반 Furniture 상태 관리 Provider

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/furniture.dart';

class FurnitureProvider with ChangeNotifier {
  final Box<Furniture> _furnitureBox = Hive.box<Furniture>('furnitures');

  List<Furniture> get furnitures => _furnitureBox.values.toList();

  // ✅ 특정 Room에 속한 Furniture 목록 반환
  List<Furniture> getFurnitureByRoom(String roomId) {
    return _furnitureBox.values.where((f) => f.roomId == roomId).toList();
  }

  // ✅ 별칭 메서드 (다른 화면에서 getByRoom()으로 부름)
  List<Furniture> getByRoom(String roomId) => getFurnitureByRoom(roomId); // ✅ 추가

  void addFurniture(Furniture furniture) {
    _furnitureBox.add(furniture);
    notifyListeners();
  }

  void updateFurniture(int index, Furniture updatedFurniture) {
    _furnitureBox.putAt(index, updatedFurniture);
    notifyListeners();
  }

  void updateFurnitureById(String id, Furniture updatedFurniture) {
    final index = _furnitureBox.values.toList().indexWhere((f) => f.id == id);
    if (index != -1) {
      _furnitureBox.putAt(index, updatedFurniture);
      notifyListeners();
    }
  }

  void deleteFurniture(int index) {
    _furnitureBox.deleteAt(index);
    notifyListeners();
  }

  Furniture? getFurnitureById(String id) {
    try {
      return _furnitureBox.values.firstWhere((f) => f.id == id);
    } catch (_) {
      return null;
    }
  }

  // ✅ 구조(하위 위치) 추가
  void addStructure(String furnitureId, String newStructure) {
    final furniture = getFurnitureById(furnitureId);
    if (furniture != null) {
      final updatedStructures = (furniture.structures ?? [])..add(newStructure);
      final updatedFurniture = Furniture(
        name: furniture.name,
        id: furniture.id,
        roomId: furniture.roomId,
        structures: updatedStructures,
      );
      final index = _furnitureBox.values.toList().indexOf(furniture);
      if (index != -1) {
        _furnitureBox.putAt(index, updatedFurniture);
        notifyListeners();
      }
    }
  }
}
