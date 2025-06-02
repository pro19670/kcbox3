// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'furniture.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FurnitureAdapter extends TypeAdapter<Furniture> {
  @override
  final int typeId = 2;

  @override
  Furniture read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Furniture(
      name: fields[0] as String,
      id: fields[1] as String,
      structures: (fields[2] as List?)?.cast<String>(),
      roomId: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Furniture obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.structures)
      ..writeByte(3)
      ..write(obj.roomId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FurnitureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
