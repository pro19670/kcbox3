// 📄 lib/providers/item_provider.dart
// ✅ Hive + Provider 기반 Item 상태 관리 및 구조별 필터링

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/item.dart';

class ItemProvider with ChangeNotifier {
  final Box<Item> _itemBox = Hive.box<Item>('items');

  List<Item> get items => _itemBox.values.toList();

  void addItem(Item item) {
    _itemBox.add(item);
    notifyListeners();
  }

  void updateItem(int index, Item updatedItem) {
    _itemBox.putAt(index, updatedItem);
    notifyListeners();
  }

  void deleteItem(int index) {
    _itemBox.deleteAt(index);
    notifyListeners();
  }

  /// ✅ 특정 가구의 구조명(서랍)에 속한 항목만 가져오기
  List<Item> getItemsByDrawer(String furnitureId, String structureName) {
    return _itemBox.values
        .where((item) =>
            item.furnitureId == furnitureId &&
            item.locationPath == structureName)
        .toList();
  }
}