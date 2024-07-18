import 'package:dartz/dartz.dart';
import 'package:gas_station_app/core/data_service/failure.dart';

import '../../../../shared/models/invoice_model.dart';

abstract class SyncInvoiceRepo {
  Future<Either<Failure, String>> syncOfflineInvoice({
    required List<InvoiceModel> invoices,
  });
}
