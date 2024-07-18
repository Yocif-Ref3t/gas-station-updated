class InvoiceItemModel {
  List<InvoiceItem>? itemList;

  InvoiceItemModel({this.itemList});

  InvoiceItemModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      itemList = <InvoiceItem>[];
      json['data'].forEach((v) {
        itemList!.add(InvoiceItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (itemList != null) {
      data['data'] = itemList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InvoiceItem {
  int? itmNo;
  String? nameAr;
  String? nameEn;
  double? itmSal;
  int? unitNo;
  String? unitNmAr;
  String? unitNmEn;
  int? vatPercent;
  int? taxvExtraHdr;
  double? itmCost;
  String? image;
  String? imagePath;
  int? storeNo;
  String? storeName;
  String? storeBalance;
  int? shiftClose;
  String? name;
  String? unit;
  double? itemTax;

  InvoiceItem(
      {this.itmNo,
      this.nameAr,
      this.nameEn,
      this.itmSal,
      this.unitNo,
      this.unitNmAr,
      this.unitNmEn,
      this.vatPercent,
      this.taxvExtraHdr,
      this.itmCost,
      this.image,
      this.imagePath,
      this.storeNo,
      this.storeName,
      this.storeBalance,
      this.shiftClose,
      this.name,
      this.unit,
      this.itemTax});

  InvoiceItem.fromJson(Map<String, dynamic> json) {
    itmNo = json['Itm_No'];
    nameAr = json['NameAr'];
    nameEn = json['NameEn'];
    itmSal = json['Itm_Sal'];
    unitNo = json['Unit_No'];
    unitNmAr = json['UnitNmAr'];
    unitNmEn = json['UnitNmEn'];
    vatPercent = json['Vat_Percent'];
    taxvExtraHdr = json['Taxv_ExtraHdr'];
    itmCost = json['Itm_Cost'];
    image = json['Image'];
    imagePath = json['image_path'];
    storeNo = json['store_no'];
    storeName = json['store_name'];
    storeBalance = json['storeBalance'];
    shiftClose = json['Shift_Close'];
    name = json['name'];
    unit = json['unit'];
    itemTax = json['item_tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Itm_No'] = itmNo;
    data['NameAr'] = nameAr;
    data['NameEn'] = nameEn;
    data['Itm_Sal'] = itmSal;
    data['Unit_No'] = unitNo;
    data['UnitNmAr'] = unitNmAr;
    data['UnitNmEn'] = unitNmEn;
    data['Vat_Percent'] = vatPercent;
    data['Taxv_ExtraHdr'] = taxvExtraHdr;
    data['Itm_Cost'] = itmCost;
    data['Image'] = image;
    data['image_path'] = imagePath;
    data['store_no'] = storeNo;
    data['store_name'] = storeName;
    data['storeBalance'] = storeBalance;
    data['Shift_Close'] = shiftClose;
    data['name'] = name;
    data['unit'] = unit;
    data['item_tax'] = itemTax;
    return data;
  }
}
