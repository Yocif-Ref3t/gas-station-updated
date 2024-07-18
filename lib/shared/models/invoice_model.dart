import 'package:gas_station_app/core/data_service/local_data/local_data.dart';
import 'package:gas_station_app/features/create_invoice/data/model/items_model.dart';
import 'package:hive/hive.dart';
part 'invoice_model.g.dart';

@HiveType(typeId: 4)
class InvoiceModel extends HiveObject {
  @HiveField(0)
  String? invoiceNo;
  @HiveField(1)
  String? customerName;
  @HiveField(2)
  int? docNo;
  @HiveField(3)
  String? returnNo;
  @HiveField(4)
  String? customerAddress;
  @HiveField(5)
  num? total;
  @HiveField(6)
  num? vat;
  @HiveField(7)
  String? visaName;
  @HiveField(8)
  num? visaNo;
  @HiveField(9)
  num? credit;
  @HiveField(10)
  num? paid;
  @HiveField(11)
  num? paidTotal;
  @HiveField(12)
  num? returnMony;
  @HiveField(13)
  String? username;
  @HiveField(14)
  num? iDNo;
  @HiveField(15)
  num? userId;
  @HiveField(16)
  num? retNet;
  @HiveField(17)
  num? retVat;
  @HiveField(18)
  String? notes;
  @HiveField(19)
  num? dlvStor;
  @HiveField(20)
  String? storeName;
  @HiveField(21)
  Company? company;
  @HiveField(22)
  Product? product;
  @HiveField(23)
  Salesman? salesman;
  @HiveField(24)
  String? periodName;

  //   to create invoice + product
  @HiveField(25)
  String? invDate;
  @HiveField(26)
  int? customerId;
  @HiveField(27)
  int? branchNo = getInvoiceData()?.branch?.id;
  @HiveField(28)
  int? storeNo = getInvoiceData()?.store?.id;
  @HiveField(29)
  int? pumpNo = int.tryParse(getInvoiceData()?.pump?.pumpNo ?? "");
  @HiveField(30)
  num? paymentType;
  @HiveField(31)
  int? periodWorkNumber;
  @HiveField(32)
  num? tips;
  @HiveField(33)
  num? net;
  @HiveField(34)
  num? delivery = 0;

  InvoiceModel({
    this.invoiceNo,
    this.customerName,
    this.invDate,
    this.docNo,
    this.returnNo,
    this.customerId,
    this.customerAddress,
    this.periodWorkNumber,
    this.total,
    this.net,
    this.paymentType,
    this.vat,
    this.delivery,
    this.visaName,
    this.visaNo,
    this.credit,
    this.paid,
    this.paidTotal,
    this.returnMony,
    this.username,
    this.iDNo,
    this.userId,
    this.retNet,
    this.retVat,
    this.tips,
    this.notes,
    this.dlvStor,
    this.storeName,
    this.company,
    this.product,
    this.salesman,
    this.periodName,
  });
  // get  allinvoice  +  model return from create invoice
  InvoiceModel.fromJson(Map<String, dynamic> json) {
    invoiceNo = json['Invoice_no'];
    customerName = json['customer_name'];
    invDate = json['InvDate'];
    docNo = json['Doc_No'];
    returnNo = json['Return_no'];
    customerId = json['CustomerId'];
    customerAddress = json['customer_address'];
    periodWorkNumber = json['Period_Work_No'];
    total = json['Total'];
    net = json['Net'];
    paymentType = json['payment_type'];
    vat = json['Vat'];
    delivery = json['delivery'];
    visaName = json['Visa_name'];
    visaNo = json['Visa_No'];
    credit = json['Credit'];
    paid = json['Paid'];
    paidTotal = json['Paid_Total'];
    returnMony = json['Return_Mony'];
    username = json['username'];
    iDNo = json['ID_No'];
    userId = json['user_id'];
    retNet = json['Ret_Net'];
    retVat = json['Ret_Vat'];
    tips = json['tips'];
    notes = json['Notes'];
    dlvStor = json['Dlv_Stor'];
    storeName = json['store_name'];
    periodName = json["Period_Name"];

    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;

    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;

    salesman =
        json['Salesman'] != null ? Salesman.fromJson(json['Salesman']) : null;
  }
  // create invoice and update
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['Invoice_no'] = invoiceNo;
    data["Brn_No"] = branchNo;
    data["store_no"] = storeNo;
    data["Pump_No"] = pumpNo;
    data['InvDate'] = invDate;
    data['Period_Work_No'] = periodWorkNumber;
    data['Pym_No'] = paymentType;
    data['Cstm_No'] = customerId;
    data['Itm_No'] = product?.itmNo;
    data['Unit_No'] = product?.unitNo;
    data['Qty'] = product?.qty;
    data['Itm_Sal'] = product?.itmSal;
    data['tips'] = tips;
    data['Net'] = net;
    data["Vat_Percent"] = product?.vatPercent;
    data["Taxv_ExtraHdr"] = product?.taxvExtraHdr;
    data["Tot_Sal"] = product?.totSal;
    data["Tot_Cost"] = product?.totalCost;
    data["delivery"] = delivery;
    data["Itm_Cost"] = product?.itmCost;

    return data;
  }
}

@HiveType(typeId: 8)
class Company {
  @HiveField(0)
  int? cmpId;
  @HiveField(1)
  int? cmpNo;
  @HiveField(2)
  String? companyName;
  @HiveField(3)
  String? taxNo;
  @HiveField(4)
  String? cRNo;
  @HiveField(5)
  int? taxExtraPrct;
  @HiveField(6)
  String? logo;

  Company(
      {this.cmpId,
      this.cmpNo,
      this.companyName,
      this.taxNo,
      this.cRNo,
      this.taxExtraPrct,
      this.logo});

  Company.fromJson(Map<String, dynamic> json) {
    cmpId = json['cmpId'];
    cmpNo = json['Cmp_No'];
    companyName = json['company_name'];
    taxNo = json['Tax_No'];
    cRNo = json['CR_No'];
    taxExtraPrct = json['TaxExtra_Prct'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cmpId'] = cmpId;
    data['Cmp_No'] = cmpNo;
    data['company_name'] = companyName;
    data['Tax_No'] = taxNo;
    data['CR_No'] = cRNo;
    data['TaxExtra_Prct'] = taxExtraPrct;
    data['logo'] = logo;
    return data;
  }
}

@HiveType(typeId: 9)
class Salesman {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? nameEn;
  @HiveField(3)
  String? tel;

  Salesman({this.id, this.name, this.nameEn, this.tel});

  Salesman.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    nameEn = json['NameEn'];
    tel = json['Tel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['NameEn'] = nameEn;
    data['Tel'] = tel;
    return data;
  }
}

@HiveType(typeId: 10)
class Product {
  @HiveField(0)
  int? itmNo;
  @HiveField(1)
  int? shiftClose;
  @HiveField(2)
  String? nameAr;
  @HiveField(3)
  String? nameEn;
  @HiveField(4)
  int? unitNo;
  @HiveField(5)
  String? unitNmAr;
  @HiveField(6)
  String? unitNmEn;
  @HiveField(7)
  num? qty;
  @HiveField(8)
  num? itmSal;
  @HiveField(9)
  num? totSal;
  @HiveField(10)
  num? taxvExtraHdr;
  @HiveField(11)
  num? vatPercent;
  @HiveField(12)
  String? image;
  @HiveField(13)
  num? itmCost;
  @HiveField(14)
  num? totalCost;
  @HiveField(15)
  String? itemName;
  @HiveField(16)
  String? unitName;
  @HiveField(17)
  num? retQty;
  @HiveField(18)
  num? retVal;

  Product(
      {this.itmNo,
      this.shiftClose,
      this.nameAr,
      this.nameEn,
      this.unitNo,
      this.unitNmAr,
      this.unitNmEn,
      this.qty,
      this.itmSal,
      this.totSal,
      this.taxvExtraHdr,
      this.vatPercent,
      this.image,
      this.itmCost,
      this.totalCost,
      this.itemName,
      this.unitName,
      this.retQty,
      this.retVal});

  Product.fromJson(Map<String, dynamic> json) {
    itmNo = json['Itm_No'];
    shiftClose = json['Shift_Close'];
    nameAr = json['NameAr'];
    nameEn = json['NameEn'];
    unitNo = json['Unit_No'];
    unitNmAr = json['UnitNmAr'];
    unitNmEn = json['UnitNmEn'];
    qty = json['Qty'];
    itmSal = json['Itm_Sal'];
    totSal = json['Tot_Sal'];
    taxvExtraHdr = json['Taxv_ExtraHdr'];
    vatPercent = json['Vat_Percent'];
    image = json['Image'];
    totalCost = json['"Tot_Cost"'];
    itmCost = json['Itm_Cost'];
    itemName = json['item_name'];
    unitName = json['unit_name'];
    retQty = json['Ret_Qty'];
    retVal = json['Ret_Val'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Itm_No'] = itmNo;
    data['Shift_Close'] = shiftClose;
    data['NameAr'] = nameAr;
    data['NameEn'] = nameEn;
    data['Unit_No'] = unitNo;
    data['UnitNmAr'] = unitNmAr;
    data['UnitNmEn'] = unitNmEn;
    data['Qty'] = qty;
    data['Itm_Sal'] = itmSal;
    data['Tot_Sal'] = totSal;
    data['Taxv_ExtraHdr'] = taxvExtraHdr;
    data['Vat_Percent'] = vatPercent;
    data['Image'] = image;
    data['Itm_Cost'] = itmCost;
    data['item_name'] = itemName;
    data['unit_name'] = unitName;
    data['Ret_Qty'] = retQty;
    data['Ret_Val'] = retVal;
    data["Tot_Cost"] = totalCost;
    return data;
  }
}
