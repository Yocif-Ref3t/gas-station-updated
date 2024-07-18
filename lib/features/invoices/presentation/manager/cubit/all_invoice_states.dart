abstract class AllInvoiceState {}

class InitialAllInvoiceState extends AllInvoiceState {}

class LoadingAllInvoiceState extends AllInvoiceState {}

class ErrorAllInvoiceState extends AllInvoiceState {
  final String errorMsg;
  ErrorAllInvoiceState({required this.errorMsg});
}

class SuccessAllInvoiceState extends AllInvoiceState {}

class LoadingDeleteInvoiceState extends AllInvoiceState {}

class ErrorDeleteInvoiceState extends AllInvoiceState {
  final String errorMsg;
  ErrorDeleteInvoiceState({required this.errorMsg});
}

class SuccessDeleteInvoiceState extends AllInvoiceState {}

class DeleteInvoiceFromPaginagtionState extends AllInvoiceState {}
class UpdateInvoiceFromPaginagtionState extends AllInvoiceState {}
