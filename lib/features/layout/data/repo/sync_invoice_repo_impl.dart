import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gas_station_app/core/data_service/api.dart';
import 'package:gas_station_app/core/data_service/failure.dart';
import 'package:gas_station_app/features/layout/data/repo/sync_invoice_repo.dart';
import 'package:gas_station_app/shared/models/invoice_model.dart';

class SyncInvoiceRepoImpl implements SyncInvoiceRepo {
  @override
  Future<Either<Failure, String>> syncOfflineInvoice({
    required List<InvoiceModel> invoices,
  }) async {
    try {
      List<String> failedInvoices = [];
      for (int i = 0; i < invoices.length; i++) {
        Response response = await ApiService().postData(
          url: "/erp/gas-station/create-invoice",
          body: {
            "invoices": [invoices[i].toJson()]
          },
        );
        if (response.statusCode == 200) {
          invoices[i].delete();
        } else {
          failedInvoices.add(invoices[i].invoiceNo!);
        }
      }
      if (failedInvoices.isEmpty) {
        return right("تم مزامنة جميع الفواتير المعلقه بنجاح");
      } else {
        String faildInvoicesNo = "";
        faildInvoicesNo += "[ ";
        for (int i = 0; i < failedInvoices.length; i++) {
          faildInvoicesNo += failedInvoices[i];
          if (i != failedInvoices.length - 1) faildInvoicesNo += " - ";
        }
        faildInvoicesNo += " ]";
        return left(Failure(
          errorMessage: "فشل في مزامنة الفواتير التاليه $faildInvoicesNo",
        ));
      }
    } on DioException catch (ex) {
      return left(Failure.serverError(ex));
    } catch (ex) {
      return left(Failure.defaultMessage());
    }
  }
}
