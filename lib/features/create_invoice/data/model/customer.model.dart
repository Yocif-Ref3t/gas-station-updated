class CustomerModel {
  List<Customer>? customerList;

  CustomerModel({this.customerList});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      customerList = <Customer>[];
      json['data'].forEach((v) {
        customerList!.add(Customer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customerList != null) {
      data['data'] = customerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customer {
  int? customerId;
  String? nameAr;
  String? nameEn;
  String? email;
  String? phoneNo;
  int? accNo;
  String? name;
  List<UnpaidInvoices>? unpaidInvoices;

  Customer(
      {this.customerId,
      this.nameAr,
      this.nameEn,
      this.email,
      this.phoneNo,
      this.accNo,
      this.name,
      this.unpaidInvoices});

  Customer.fromJson(Map<String, dynamic> json) {
    customerId = json['CustomerId'];
    nameAr = json['NameAr'];
    nameEn = json['NameEn'];
    email = json['Email'];
    phoneNo = json['PhoneNo'];
    accNo = json['Acc_No'];
    name = json['name'];
    if (json['unpaidInvoices'] != null) {
      unpaidInvoices = <UnpaidInvoices>[];
      json['unpaidInvoices'].forEach((v) {
        unpaidInvoices!.add(UnpaidInvoices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CustomerId'] = customerId;
    data['NameAr'] = nameAr;
    data['NameEn'] = nameEn;
    data['Email'] = email;
    data['PhoneNo'] = phoneNo;
    data['Acc_No'] = accNo;
    data['name'] = name;
    if (unpaidInvoices != null) {
      data['unpaidInvoices'] =
          unpaidInvoices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UnpaidInvoices {
  int? cmpNo;
  int? accNo;
  int? sysubAccount;
  String? paidValue;
  String? adjnotValue;
  String? remainingValue;
  int? brnNo;
  String? branchName;
  int? customerId;
  int? invoiceNo;
  int? jurnalNo;
  String? debit;
  String? retPurSal;
  int? payValue;
  dynamic analyticAccounts;

  UnpaidInvoices(
      {this.cmpNo,
      this.accNo,
      this.sysubAccount,
      this.paidValue,
      this.adjnotValue,
      this.remainingValue,
      this.brnNo,
      this.branchName,
      this.customerId,
      this.invoiceNo,
      this.jurnalNo,
      this.debit,
      this.retPurSal,
      this.payValue,
      this.analyticAccounts});

  UnpaidInvoices.fromJson(Map<String, dynamic> json) {
    cmpNo = json['Cmp_No'];
    accNo = json['Acc_No'];
    sysubAccount = json['Sysub_Account'];
    paidValue = json['Paid_Value'];
    adjnotValue = json['Adjnot_value'];
    remainingValue = json['Remaining_value'];
    brnNo = json['Brn_No'];
    branchName = json['branch_name'];
    customerId = json['CustomerId'];
    invoiceNo = json['Invoice_no'];
    jurnalNo = json['jurnal_no'];
    debit = json['debit'];
    retPurSal = json['RetPur_Sal'];
    payValue = json['Pay_Value'];
    analyticAccounts = json['analyticAccounts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Cmp_No'] = cmpNo;
    data['Acc_No'] = accNo;
    data['Sysub_Account'] = sysubAccount;
    data['Paid_Value'] = paidValue;
    data['Adjnot_value'] = adjnotValue;
    data['Remaining_value'] = remainingValue;
    data['Brn_No'] = brnNo;
    data['branch_name'] = branchName;
    data['CustomerId'] = customerId;
    data['Invoice_no'] = invoiceNo;
    data['jurnal_no'] = jurnalNo;
    data['debit'] = debit;
    data['RetPur_Sal'] = retPurSal;
    data['Pay_Value'] = payValue;
    data['analyticAccounts'] = analyticAccounts;
    return data;
  }
}