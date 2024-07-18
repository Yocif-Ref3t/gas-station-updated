import 'package:dartz/dartz.dart';
import 'package:gas_station_app/core/data_service/failure.dart';

abstract class ChangePasswordRepo {
  Future<Either<Failure, String>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirmation,
  });
}
