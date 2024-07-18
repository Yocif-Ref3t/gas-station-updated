import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gas_station_app/core/data_service/api.dart';
import 'package:gas_station_app/core/data_service/failure.dart';
import 'package:gas_station_app/features/pumps/data/models/pump_model.dart';
import 'package:gas_station_app/features/pumps/data/repo/pumps_repo.dart';

import '../../../../core/helper/functions.dart';

class PumpsRepoImpl implements PumpsRepo {
  @override
  Future<Either<Failure, List<PumpModel>>> getAllPumps({
    required String branchNo,
    required String storeId,
  }) async {
    try {
      List<PumpModel> pumps = [];
      var response = await ApiService().getData(
        url: "/erp/gas-station/pubms?branch=$branchNo&store=$storeId",
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        for (int i = 0; i < data.length; i++) {
          pumps.add(PumpModel.fromJson(data[i], types: getPumpTypes(data[i])));
        }
        return right(pumps);
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
