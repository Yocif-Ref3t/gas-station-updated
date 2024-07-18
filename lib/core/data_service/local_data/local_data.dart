import 'package:dartz/dartz.dart';
import 'package:gas_station_app/core/constans/boxs.dart';
import 'package:gas_station_app/core/data_service/failure.dart';
import 'package:gas_station_app/shared/models/invoice_data_model.dart';
import 'package:gas_station_app/shared/models/invoice_model.dart';
import 'package:gas_station_app/shared/models/user_model.dart';
import 'package:hive/hive.dart';

bool checkLocalLogin() {
  var box = Hive.box<UserModel>(kUserBox);
  var data = box.values.toList();
  if (data.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

UserModel? getUser() {
  var box = Hive.box<UserModel>(kUserBox);
  var data = box.values.toList();
  if (data.isNotEmpty) {
    return data.first;
  } else {
    return null;
  }
}

String? getToken() {
  var user = getUser();
  if (user != null) {
    return user.token;
  } else {
    return null;
  }
}

Future<Either<Failure, bool>> localLogout() async {
  try {
    var box = Hive.box<UserModel>(kUserBox);
    await box.clear();
    return right(true);
  } catch (e) {
    return left(Failure.defaultMessage());
  }
}

UserModel? saveLocation() {
  var box = Hive.box<UserModel>(kUserBox);
  var data = box.values.toList();
  if (data.isNotEmpty) {
    return data.first;
  } else {
    return null;
  }
}

Future storeInvoiceData(InvoiceDataModel model) async {
  final box = Hive.box<InvoiceDataModel>(kInvoiceDataBox);
  bool isUpdate = box.values.isNotEmpty;
  if (isUpdate) {
    InvoiceDataModel existModel = box.values.first;
    existModel.branch = model.branch ?? existModel.branch;
    existModel.store = model.store ?? existModel.store;
    existModel.pump = model.pump ?? existModel.pump;
    existModel.save();
  } else {
    await box.put(0, model);
  }
}

InvoiceDataModel? getInvoiceData() {
  final box = Hive.box<InvoiceDataModel>(kInvoiceDataBox);
  return box.values.isNotEmpty ? box.values.first : null;
}

bool checkBranchAndStore() {
  InvoiceDataModel? invoiceModel = getInvoiceData();
  bool branch = invoiceModel?.branch != null;
  bool store = invoiceModel?.store != null;
  return branch && store;
}

bool checkPump() {
  InvoiceDataModel? invoiceModel = getInvoiceData();
  return invoiceModel?.pump != null;
}

Future storeOfflineInvoice(InvoiceModel invoice) async {
  var box = Hive.box<InvoiceModel>(kOfflineInvoiceBox);
  await box.add(invoice);
}

List<InvoiceModel> getAllOfflineInvoices() {
  var box = Hive.box<InvoiceModel>(kOfflineInvoiceBox);
  return box.values.toList();
}

Future deleteOfflineInvoice(InvoiceDataModel invoice) async {
  await invoice.delete();
}

bool checkOfflineInvoice(InvoiceModel invoice) {
  return invoice.isInBox;
}

////// save invoice number //////////////
saveInvoiceNumber(int? invoiceNumer) {
  var box = Hive.box<int>(kInvoiceNumber);
  box.put(0, invoiceNumer ?? 0);
}

///// get the new invoice  number ///////////////////
String getInvoiceNumber() {
  var box = Hive.box<int>(kInvoiceNumber);
  int newInvoiceNumber = box.values.first + 1;
  saveInvoiceNumber(newInvoiceNumber);
  return box.values.first.toString();
}
