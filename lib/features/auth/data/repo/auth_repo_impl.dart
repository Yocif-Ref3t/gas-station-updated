import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gas_station_app/core/constans/boxs.dart';
import 'package:gas_station_app/core/data_service/api.dart';
import 'package:gas_station_app/core/data_service/failure.dart';
import 'package:gas_station_app/features/auth/data/end%20points/auth_end_points.dart';
import 'package:gas_station_app/shared/models/user_model.dart';
import 'package:hive/hive.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthEndPoints implements AuthRepo {
  @override
  Future<Either<Failure, UserModel>> login(
      {required String email, required String password}) async {
    try {
      var response = await ApiService().postData(
        url: loginEndPoint,
        body: {
          'email': email,
          'password': password,
          'device': "mobile",
        },
      );
      if (response.statusCode == 200) {
        var data = response.data;
        if (data['status'] == "200") {
          var box = Hive.box<UserModel>(kUserBox);
          await box.add(UserModel.fromJson(data));
          return right(UserModel.fromJson(data));
        } else {
          return left(Failure(errorMessage: data['data']));
        }
      } else if (response.statusCode == 403) {
        return left(Failure.defaultMessage());
      } else {
        ///// save invoice i database
        return left(Failure.defaultMessage());
      }
    } on DioException catch (ex) {
      ///// save invoice in database
      return left(Failure.serverError(ex));
    } catch (ex) {
      ///// save invoice in database
      return left(Failure(errorMessage: ex.toString()));
    }
  }
}
