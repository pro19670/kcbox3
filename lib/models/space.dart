import 'package:hive/hive.dart';

part 'space.g.dart';

@HiveType(typeId: 3)
class Space extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  Space({
    required this.id,
    required this.name,
  });
}
