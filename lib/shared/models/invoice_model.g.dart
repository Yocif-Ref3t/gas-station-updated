// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InvoiceModelAdapter extends TypeAdapter<InvoiceModel> {
  @override
  final int typeId = 4;

  @override
  InvoiceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InvoiceModel(
      invoiceNo: fields[0] as String?,
      customerName: fields[1] as String?,
      invDate: fields[25] as String?,
      docNo: fields[2] as int?,
      returnNo: fields[3] as String?,
      customerId: fields[26] as int?,
      customerAddress: fields[4] as String?,
      periodWorkNumber: fields[31] as int?,
      total: fields[5] as num?,
      net: fields[33] as num?,
      paymentType: fields[30] as num?,
      vat: fields[6] as num?,
      delivery: fields[34] as num?,
      visaName: fields[7] as String?,
      visaNo: fields[8] as num?,
      credit: fields[9] as num?,
      paid: fields[10] as num?,
      paidTotal: fields[11] as num?,
      returnMony: fields[12] as num?,
      username: fields[13] as String?,
      iDNo: fields[14] as num?,
      userId: fields[15] as num?,
      retNet: fields[16] as num?,
      retVat: fields[17] as num?,
      tips: fields[32] as num?,
      notes: fields[18] as String?,
      dlvStor: fields[19] as num?,
      storeName: fields[20] as String?,
      company: fields[21] as Company?,
      product: fields[22] as Product?,
      salesman: fields[23] as Salesman?,
      periodName: fields[24] as String?,
    )
      ..branchNo = fields[27] as int?
      ..storeNo = fields[28] as int?
      ..pumpNo = fields[29] as int?;
  }

  @override
  void write(BinaryWriter writer, InvoiceModel obj) {
    writer
      ..writeByte(35)
      ..writeByte(0)
      ..write(obj.invoiceNo)
      ..writeByte(1)
      ..write(obj.customerName)
      ..writeByte(2)
      ..write(obj.docNo)
      ..writeByte(3)
      ..write(obj.returnNo)
      ..writeByte(4)
      ..write(obj.customerAddress)
      ..writeByte(5)
      ..write(obj.total)
      ..writeByte(6)
      ..write(obj.vat)
      ..writeByte(7)
      ..write(obj.visaName)
      ..writeByte(8)
      ..write(obj.visaNo)
      ..writeByte(9)
      ..write(obj.credit)
      ..writeByte(10)
      ..write(obj.paid)
      ..writeByte(11)
      ..write(obj.paidTotal)
      ..writeByte(12)
      ..write(obj.returnMony)
      ..writeByte(13)
      ..write(obj.username)
      ..writeByte(14)
      ..write(obj.iDNo)
      ..writeByte(15)
      ..write(obj.userId)
      ..writeByte(16)
      ..write(obj.retNet)
      ..writeByte(17)
      ..write(obj.retVat)
      ..writeByte(18)
      ..write(obj.notes)
      ..writeByte(19)
      ..write(obj.dlvStor)
      ..writeByte(20)
      ..write(obj.storeName)
      ..writeByte(21)
      ..write(obj.company)
      ..writeByte(22)
      ..write(obj.product)
      ..writeByte(23)
      ..write(obj.salesman)
      ..writeByte(24)
      ..write(obj.periodName)
      ..writeByte(25)
      ..write(obj.invDate)
      ..writeByte(26)
      ..write(obj.customerId)
      ..writeByte(27)
      ..write(obj.branchNo)
      ..writeByte(28)
      ..write(obj.storeNo)
      ..writeByte(29)
      ..write(obj.pumpNo)
      ..writeByte(30)
      ..write(obj.paymentType)
      ..writeByte(31)
      ..write(obj.periodWorkNumber)
      ..writeByte(32)
      ..write(obj.tips)
      ..writeByte(33)
      ..write(obj.net)
      ..writeByte(34)
      ..write(obj.delivery);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvoiceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CompanyAdapter extends TypeAdapter<Company> {
  @override
  final int typeId = 8;

  @override
  Company read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Company(
      cmpId: fields[0] as int?,
      cmpNo: fields[1] as int?,
      companyName: fields[2] as String?,
      taxNo: fields[3] as String?,
      cRNo: fields[4] as String?,
      taxExtraPrct: fields[5] as int?,
      logo: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Company obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.cmpId)
      ..writeByte(1)
      ..write(obj.cmpNo)
      ..writeByte(2)
      ..write(obj.companyName)
      ..writeByte(3)
      ..write(obj.taxNo)
      ..writeByte(4)
      ..write(obj.cRNo)
      ..writeByte(5)
      ..write(obj.taxExtraPrct)
      ..writeByte(6)
      ..write(obj.logo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SalesmanAdapter extends TypeAdapter<Salesman> {
  @override
  final int typeId = 9;

  @override
  Salesman read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Salesman(
      id: fields[0] as int?,
      name: fields[1] as String?,
      nameEn: fields[2] as String?,
      tel: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Salesman obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.nameEn)
      ..writeByte(3)
      ..write(obj.tel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalesmanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 10;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      itmNo: fields[0] as int?,
      shiftClose: fields[1] as int?,
      nameAr: fields[2] as String?,
      nameEn: fields[3] as String?,
      unitNo: fields[4] as int?,
      unitNmAr: fields[5] as String?,
      unitNmEn: fields[6] as String?,
      qty: fields[7] as num?,
      itmSal: fields[8] as num?,
      totSal: fields[9] as num?,
      taxvExtraHdr: fields[10] as num?,
      vatPercent: fields[11] as num?,
      image: fields[12] as String?,
      itmCost: fields[13] as num?,
      totalCost: fields[14] as num?,
      itemName: fields[15] as String?,
      unitName: fields[16] as String?,
      retQty: fields[17] as num?,
      retVal: fields[18] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.itmNo)
      ..writeByte(1)
      ..write(obj.shiftClose)
      ..writeByte(2)
      ..write(obj.nameAr)
      ..writeByte(3)
      ..write(obj.nameEn)
      ..writeByte(4)
      ..write(obj.unitNo)
      ..writeByte(5)
      ..write(obj.unitNmAr)
      ..writeByte(6)
      ..write(obj.unitNmEn)
      ..writeByte(7)
      ..write(obj.qty)
      ..writeByte(8)
      ..write(obj.itmSal)
      ..writeByte(9)
      ..write(obj.totSal)
      ..writeByte(10)
      ..write(obj.taxvExtraHdr)
      ..writeByte(11)
      ..write(obj.vatPercent)
      ..writeByte(12)
      ..write(obj.image)
      ..writeByte(13)
      ..write(obj.itmCost)
      ..writeByte(14)
      ..write(obj.totalCost)
      ..writeByte(15)
      ..write(obj.itemName)
      ..writeByte(16)
      ..write(obj.unitName)
      ..writeByte(17)
      ..write(obj.retQty)
      ..writeByte(18)
      ..write(obj.retVal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
