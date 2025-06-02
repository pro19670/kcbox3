// 📄 lib/providers/room_provider.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/room.dart';

class RoomProvider with ChangeNotifier {
  final Box<Room> _roomBox = Hive.box<Room>('rooms');

  List<Room> get rooms => _roomBox.values.toList();

  List<Room> getRoomsBySpace(String spaceId) {
    return _roomBox.values.where((room) => room.spaceId == spaceId).toList();
  }

  void addRoom(Room room) {
    _roomBox.add(room);
    notifyListeners();
  }

  void updateRoom(int index, Room updatedRoom) {
    _roomBox.putAt(index, updatedRoom);
    notifyListeners();
  }

  void deleteRoom(int index) {
    _roomBox.deleteAt(index);
    notifyListeners();
  }

  Room? getRoomById(String id) {
    try {
      return _roomBox.values.firstWhere((room) => room.id == id);
    } catch (_) {
      return null;
    }
  }
}
