import 'package:hive/hive.dart';

part 'furniture.g.dart';

@HiveType(typeId: 2)
class Furniture extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String id;

  @HiveField(2)
  List<String>? structures;

  @HiveField(3)
String roomId;

  Furniture({
    required this.name,
    required this.id,
    this.structures,
    required this.roomId
  });
}
