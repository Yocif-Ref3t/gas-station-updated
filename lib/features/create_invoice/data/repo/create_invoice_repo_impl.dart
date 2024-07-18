import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gas_station_app/core/data_service/api.dart';
import 'package:gas_station_app/core/data_service/failure.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';
import 'package:gas_station_app/features/create_invoice/data/end_point/create_invoice_end_point.dart';
import 'package:gas_station_app/features/create_invoice/data/model/customer.model.dart';
import 'package:gas_station_app/features/create_invoice/data/model/items_model.dart';
import 'package:gas_station_app/features/create_invoice/data/repo/create_invoice_repo.dart';
import 'package:gas_station_app/shared/models/invoice_model.dart';

class CreateInvoiceRepoImpl extends CreateInvoiceRepo
    implements CreateInvoiceEndPoint {
  @override
  Future<Either<Failure, InvoiceModel>> createNewInvoice(
      {required InvoiceModel invoice}) async {
    try {
      final response = await ApiService()
          .postData(url: CreateInvoiceEndPoint.createInvoice, body: {
        "invoices": [invoice.toJson()],
      });
      if (response.statusCode == 200) {
        return right(InvoiceModel.fromJson(response.data[0]));
      } else {
        if (!checkOfflineInvoice(invoice)) {
          storeOfflineInvoice(invoice);
        }
        return left(Failure.defaultMessage());
      }
    } on DioException catch (e) {
      if (!checkOfflineInvoice(invoice)) {
        storeOfflineInvoice(invoice);
      }
      return left(Failure.serverError(e));
    } on Exception catch (e) {
      if (!checkOfflineInvoice(invoice)) {
        storeOfflineInvoice(invoice);
      }
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CustomerModel>> getCustomers() async {
    try {
      final response =
          await ApiService().getData(url: CreateInvoiceEndPoint.getCustomer);
      if (response.statusCode == 200) {
        return right(CustomerModel.fromJson(response.data));
      } else {
        return left(Failure.defaultMessage());
      }
    } on DioException catch (e) {
      return left(Failure.serverError(e));
    } on Exception catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, InvoiceItemModel>> getItems() async {
    try {
      final response =
          await ApiService().getData(url: CreateInvoiceEndPoint.getItems);
      if (response.statusCode == 200) {
        return right(InvoiceItemModel.fromJson(response.data));
      } else {
        return left(Failure.defaultMessage());
      }
    } on DioException catch (e) {
      return left(Failure.serverError(e));
    } on Exception catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updateInvoice(
      {required InvoiceModel invoice, int? docNo}) async {
    try {
      final response = await ApiService()
          .updateData(url: CreateInvoiceEndPoint.updateInvoice(docNo), body: {
        "invoices": [invoice.toJson()]
      });
      if (response.data == "success") {
        return right(true);
      } else {
        return left(
            Failure(errorMessage: "لم يتم التعديل بنجاح حاول مره اخري"));
      }
    } on DioException catch (e) {
      return left(Failure(errorMessage: "لم يتم التعديل بنجاح حاول مره اخري"));
    } on Exception catch (e) {
      return left(Failure(errorMessage: "لم يتم التعديل بنجاح حاول مره اخري"));
    }
  }
}
