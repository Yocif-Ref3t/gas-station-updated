import 'package:dartz/dartz.dart';
import 'package:gas_station_app/core/data_service/failure.dart';
import 'package:gas_station_app/features/branches/data/model/branches_model.dart';
import 'package:gas_station_app/features/store/data/model/store_model.dart';

abstract class StoresRepo  {

  Future <Either<Failure, AllStoresModel>> getAllStores () ;

}