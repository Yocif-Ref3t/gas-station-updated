import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';
import 'package:gas_station_app/features/add%20customer/data/repo/add_customer_repo_impl.dart';
import 'package:gas_station_app/features/create_invoice/data/model/customer.model.dart';

part 'add_customer_state.dart';

class AddCustomerCubit extends Cubit<AddCustomerState> {
  AddCustomerCubit() : super(AddCustomerInitial());

  Future addCustomer({
    required String name,
    required String email,
    required String phone,
  }) async {
    emit(AddCustomerLoading());
    var result = await AddCustomerRepoImpl().addCustomer(
      name: name,
      email: email,
      phone: phone,
      branchNo: getInvoiceData()?.branch?.id.toString(),
    );
    result.fold(
      (failure) => emit(AddCustomerFailure(errorMessage: failure.errorMessage)),
      (customerModel) => emit(AddCustomerSuccess(customerModel: customerModel)),
    );
  }
}
