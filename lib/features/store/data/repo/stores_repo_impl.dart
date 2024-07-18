import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gas_station_app/core/data_service/api.dart';
import 'package:gas_station_app/core/data_service/failure.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';
import 'package:gas_station_app/features/store/data/end_point/end_point.dart';
import 'package:gas_station_app/features/store/data/model/store_model.dart';
import 'package:gas_station_app/features/store/data/repo/stores_repo.dart';

class StoresRepoImpl extends StoresEndPoints implements StoresRepo {
  @override
  Future<Either<Failure, AllStoresModel>> getAllStores() async {
    try {
      final response = await ApiService()
          .getData(url: StoresEndPoints.get(getInvoiceData()?.branch?.id));
      if (response.statusCode == 200) {
        return right(AllStoresModel.fromJson(response.data));
      } else {
        return left(Failure.defaultMessage());
      }
    } on DioException catch (ex) {
      return left(Failure.serverError(ex));
    } catch (ex) {
      return left(Failure(errorMessage: ex.toString()));
    }
  }
}
