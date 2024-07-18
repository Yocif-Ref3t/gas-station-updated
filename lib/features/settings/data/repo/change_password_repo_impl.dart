import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gas_station_app/core/data_service/api.dart';
import 'package:gas_station_app/core/data_service/failure.dart';
import 'package:gas_station_app/features/settings/data/repo/change_password_repo.dart';

class ChangePasswordRepoImpl implements ChangePasswordRepo {
  @override
  Future<Either<Failure, String>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirmation,
  }) async {
    try {
      Response response = await ApiService().postData(
        url: "/erp/gas-station/changePassword",
        body: {
          "password": newPassword,
          "passwordConfirmation": passwordConfirmation,
          "currentPassword": currentPassword,
          "lang": "ar",
        },
      );
      if (response.statusCode == 200) {
        var data = response.data;
        if (data['status'] == 200) {
          return right(response.data["messages"]);
        } else {
          return left(Failure(errorMessage: response.data["messages"]));
        }
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
