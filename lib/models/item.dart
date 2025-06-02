// 📄 lib/models/item.dart
// ✅ 품목 모델 - locationPath 필드 추가

import 'package:hive/hive.dart';
part 'item.g.dart';

@HiveType(typeId: 0)
class Item extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String brand;

  @HiveField(2)
  int quantity;

  @HiveField(3)
  String? id;

  @HiveField(4)
  String? color;

  @HiveField(5)
  String? imagePath;

  @HiveField(6)
  String furnitureId;

  @HiveField(7)
  DateTime? createdAt;

  @HiveField(8)
  List<String>? logs;

  @HiveField(9)
  String? base64Image;

  @HiveField(10)
  String? locationPath; // ✅ 추가된 필드

  Item({
    required this.name,
    required this.brand,
    required this.quantity,
    required this.furnitureId,
    this.id,
    this.color,
    this.imagePath,
    this.createdAt,
    this.logs,
    this.base64Image,
    this.locationPath,
  });
}
