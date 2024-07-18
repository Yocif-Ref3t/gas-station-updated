// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pump_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PumpModelAdapter extends TypeAdapter<PumpModel> {
  @override
  final int typeId = 6;

  @override
  PumpModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PumpModel(
      id: fields[0] as String,
      compId: fields[1] as String,
      branchNo: fields[2] as String,
      pumpNo: fields[3] as String,
      pumpName: fields[4] as String,
      types: (fields[5] as List).cast<PumpType>(),
    );
  }

  @override
  void write(BinaryWriter writer, PumpModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.compId)
      ..writeByte(2)
      ..write(obj.branchNo)
      ..writeByte(3)
      ..write(obj.pumpNo)
      ..writeByte(4)
      ..write(obj.pumpName)
      ..writeByte(5)
      ..write(obj.types);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PumpModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
