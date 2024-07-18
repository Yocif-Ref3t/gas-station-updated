import 'package:gas_station_app/shared/models/invoice_model.dart';

abstract class CreateInvoiceState {}

class InitialCreateInvoiceState extends CreateInvoiceState {}

class LoadingCreateInvoiceState extends CreateInvoiceState {}

class SuccessCreateInvoiceState extends CreateInvoiceState {
  final InvoiceModel invoiceModel;
  SuccessCreateInvoiceState({required this.invoiceModel});
}

class ErrorCreateInvoiceState extends CreateInvoiceState {}

class LoadingGetDataState extends CreateInvoiceState {}

class SuccessGetDataState extends CreateInvoiceState {}

class ErrorGetDataState extends CreateInvoiceState {
  final String errorMsg;

  ErrorGetDataState({required this.errorMsg});
}

class ChangeInvoiceItemState extends CreateInvoiceState {}

class CountAllNetInvoiceState extends CreateInvoiceState {}

class ClearInvoiceDataState extends CreateInvoiceState {}

class LoadingUpdateInvoiceState extends CreateInvoiceState {}

class SuccessUpdateInvoiceState extends CreateInvoiceState {}

class ErrorUpdateInvoiceState extends CreateInvoiceState {
  final String errorMsg;

  ErrorUpdateInvoiceState({required this.errorMsg});
}
