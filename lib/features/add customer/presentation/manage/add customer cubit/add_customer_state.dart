part of 'add_customer_cubit.dart';

@immutable
sealed class AddCustomerState {}

final class AddCustomerInitial extends AddCustomerState {}

final class AddCustomerLoading extends AddCustomerState {}

final class AddCustomerSuccess extends AddCustomerState {
  final Customer customerModel;
  AddCustomerSuccess({required this.customerModel});
}

final class AddCustomerFailure extends AddCustomerState {
  final String errorMessage;
  AddCustomerFailure({required this.errorMessage});
}
