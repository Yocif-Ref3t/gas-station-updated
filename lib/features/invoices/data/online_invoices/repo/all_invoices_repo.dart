import 'package:dartz/dartz.dart';
import 'package:gas_station_app/core/data_service/failure.dart';
import 'package:gas_station_app/features/invoices/data/online_invoices/model/all_invoices_model.dart';

abstract class AllInvoicesRepo {
  Future<AllInvoicesModel?> getAllInvoices({int pageNumber = 1});

  Future<Either<Failure, bool>> deleteInvoices({required int docNo});
}
