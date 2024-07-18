// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InvoiceDataModelAdapter extends TypeAdapter<InvoiceDataModel> {
  @override
  final int typeId = 5;

  @override
  InvoiceDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InvoiceDataModel(
      branch: fields[0] as BranchModel?,
      store: fields[1] as StoreModel?,
      pump: fields[2] as PumpModel?,
    );
  }

  @override
  void write(BinaryWriter writer, InvoiceDataModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.branch)
      ..writeByte(1)
      ..write(obj.store)
      ..writeByte(2)
      ..write(obj.pump);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvoiceDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
