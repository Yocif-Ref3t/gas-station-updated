import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gas_station_app/core/data_service/api.dart';
import 'package:gas_station_app/core/data_service/failure.dart';
import 'package:gas_station_app/features/branches/data/end_point/end_point.dart';
import 'package:gas_station_app/features/branches/data/model/branches_model.dart';
import 'package:gas_station_app/features/branches/data/repo/branche_repo.dart';

class BranchesRepoImpl extends BranchesEndPoints implements BranchesRepo {
  @override
  Future<Either<Failure, AllBranchesModel>> getAllBranches() async {
    try {
      final response = await ApiService().getData(url: BranchesEndPoints.get);
      if (response.statusCode == 200) {
        return right(AllBranchesModel.fromJson(response.data));
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
