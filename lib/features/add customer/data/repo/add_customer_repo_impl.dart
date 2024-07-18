import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gas_station_app/core/data_service/api.dart';
import 'package:gas_station_app/core/data_service/failure.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';
import 'package:gas_station_app/features/add%20customer/data/repo/add_customer_repo.dart';
import 'package:gas_station_app/features/create_invoice/data/model/customer.model.dart';

class AddCustomerRepoImpl implements AddCustomerRepo {
  @override
  Future<Either<Failure, Customer>> addCustomer({
    required String? name,
    required String? email,
    required String? phone,
    required String? branchNo,
  }) async {
    try {
      log(branchNo ?? "null");
      Response response = await ApiService().postData(
        isFormData: true,
        url: "/erp/gas-station/${getUser()!.cmpNo}/new-customer",
        body: {
          "customer_data[0][Email]": email,
          "customer_data[0][UserName]": name,
          "customer_data[0][PhoneNo]": phone,
          "customer_data[0][Brn_No]": branchNo,
        },
        headers: {
          'Content-Type': 'application/form-data',
          'Accept': '*/*',
          'Authorization': 'Bearer ${getToken()}',
        },
      );
      if (response.statusCode == 200) {
        var data = response.data;
        if (data['status']) {
          final Customer customerModel;
          customerModel = Customer(
            customerId: data['data']['ID_No'],
            name: name,
          );
          return right(customerModel);
        } else {
          return left(Failure(errorMessage: data['message']));
        }
      } else {
        return left(Failure.defaultMessage());
      }
    } on DioException catch (ex) {
      return left(Failure.serverError(ex));
    } catch (ex) {
      return left(Failure.defaultMessage());
    }
  }
}
