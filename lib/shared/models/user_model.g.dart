// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      status: fields[0] as String?,
      message: fields[1] as String?,
      token: fields[2] as String?,
      username: fields[3] as String?,
      id: fields[4] as int?,
      email: fields[5] as String?,
      role: fields[6] as String?,
      cmpId: fields[7] as int?,
      cmpNo: fields[8] as int?,
      name: fields[9] as String?,
      logo: fields[10] as String?,
      taxNo: fields[11] as String?,
      cRNo: fields[12] as String?,
      taxExtraPrct: fields[13] as int?,
      allowNegative: fields[14] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.token)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.role)
      ..writeByte(7)
      ..write(obj.cmpId)
      ..writeByte(8)
      ..write(obj.cmpNo)
      ..writeByte(9)
      ..write(obj.name)
      ..writeByte(10)
      ..write(obj.logo)
      ..writeByte(11)
      ..write(obj.taxNo)
      ..writeByte(12)
      ..write(obj.cRNo)
      ..writeByte(13)
      ..write(obj.taxExtraPrct)
      ..writeByte(14)
      ..write(obj.allowNegative);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
