import 'package:gas_station_app/core/data_service/local_data/local_data.dart';

mixin CreateInvoiceEndPoint {
  static const String createInvoice = "/erp/gas-station/create-invoice";
  static const String getCustomer = "/erp/gas-station/customers";
  static String getItems =
      "/erp/gas-station/items/?branch=${getInvoiceData()?.branch}&store=${getInvoiceData()?.store}";
  static String updateInvoice(docNo) =>
      "/erp/gas-station/update-invoice/$docNo";
}
