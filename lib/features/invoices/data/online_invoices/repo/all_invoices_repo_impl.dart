import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gas_station_app/core/data_service/api.dart';
import 'package:gas_station_app/core/data_service/failure.dart';
import 'package:gas_station_app/features/invoices/data/online_invoices/end_point/online_invoice.dart';
import 'package:gas_station_app/features/invoices/data/online_invoices/model/all_invoices_model.dart';
import 'package:gas_station_app/features/invoices/data/online_invoices/repo/all_invoices_repo.dart';

class AllInvoicesRepoImpl extends AllInvoicesRepo
    implements AllInvoiceEndPoints {
      
  @override
  Future<AllInvoicesModel?> getAllInvoices({int pageNumber = 1}) async {
    final response =
        await ApiService().getData(url: AllInvoiceEndPoints.get, body: {
      "pageSize": 20,
      "page": pageNumber,
    });

    if (response.statusCode == 200) {
      return AllInvoicesModel.fromJson(response.data);
    } else {
      return null;
    }
  }

  @override
  Future<Either<Failure, bool>> deleteInvoices({required int docNo}) async {
    try {
      final response = await ApiService().deleteData(
        url: AllInvoiceEndPoints.delete(docNo),
      );
      if (response.data == "success") {
        return right(true);
      } else {
        return left(Failure(errorMessage: "لم يتم الحذف بنجاح حاول مره اخري"));
      }
    } on DioException catch (e) {
      return left(Failure(errorMessage: "لم يتم الحذف بنجاح حاول مره اخري"));
    } on Exception catch (e) {
      return left(Failure(errorMessage: "لم يتم الحذف بنجاح حاول مره اخري"));
    }
  }

  // @override
  // Future<Either<Failure, String>> getprintInvoices(int? docNo) async {
  //   try {
  //     final response = await ApiService().getData(
  //       url: AllInvoiceEndPoints.print(docNo),
  //     );
  //     if (response.statusCode == 200) {
  //       // final document = parse(response.data);
  //       return right(response.data);
  //     } else {
  //       return left(Failure.defaultMessage());
  //     }
  //   } on DioException catch (ex) {
  //     return left(Failure.serverError(ex));
  //   } catch (ex) {
  //     return left(Failure(errorMessage: ex.toString()));
  //   }
  // }

}
