import 'package:dartz/dartz.dart';
import 'package:gas_station_app/features/pumps/data/models/pump_model.dart';

import '../../../../core/data_service/failure.dart';

abstract class PumpsRepo {
  Future<Either<Failure, List<PumpModel>>> getAllPumps({
    required String branchNo,
    required String storeId,
  });
}
