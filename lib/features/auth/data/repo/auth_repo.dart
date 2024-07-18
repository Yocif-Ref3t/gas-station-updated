import 'package:dartz/dartz.dart';
import 'package:gas_station_app/core/data_service/failure.dart';
import 'package:gas_station_app/shared/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  });
  //#####################################################//
}
