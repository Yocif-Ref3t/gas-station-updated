import 'package:gas_station_app/shared/models/invoice_model.dart';

class AllInvoicesModel {
  List<InvoiceModel>? allInvoicesList = <InvoiceModel>[];

  AllInvoicesModel({this.allInvoicesList});

  AllInvoicesModel.fromJson(List json) {
    if (json.isNotEmpty) {
      for (var element in json) {
        allInvoicesList?.add(InvoiceModel.fromJson(element));
      }
    }
  }
}
