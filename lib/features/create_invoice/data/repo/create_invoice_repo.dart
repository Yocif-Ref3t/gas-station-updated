import 'package:dartz/dartz.dart';
import 'package:gas_station_app/core/data_service/failure.dart';
import 'package:gas_station_app/features/create_invoice/data/model/customer.model.dart';
import 'package:gas_station_app/features/create_invoice/data/model/items_model.dart';
import 'package:gas_station_app/features/invoices/presentation/view/widgets/on_off_invoice/widgets/invoice_menu_item.dart';
import 'package:gas_station_app/shared/models/invoice_model.dart';

abstract class CreateInvoiceRepo {
  Future<Either<Failure, InvoiceModel>> createNewInvoice(
      {required InvoiceModel invoice});
  Future<Either<Failure, bool>> updateInvoice(
      {required InvoiceModel invoice});
  Future<Either<Failure, CustomerModel>> getCustomers();
  Future<Either<Failure, InvoiceItemModel>> getItems();
}
