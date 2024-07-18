part of 'sync_invoice_cubit.dart';

@immutable
sealed class SyncInvoiceState {}

final class SyncInvoiceInitial extends SyncInvoiceState {}

final class SyncInvoiceLoading extends SyncInvoiceState {}

final class SyncInvoiceSuccess extends SyncInvoiceState {
  final String message;
  SyncInvoiceSuccess({required this.message});
}

final class SyncInvoiceFailure extends SyncInvoiceState {
  final String errorMessage;
  SyncInvoiceFailure({required this.errorMessage});
}
