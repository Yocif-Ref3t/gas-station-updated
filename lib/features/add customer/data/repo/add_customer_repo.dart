import 'package:dartz/dartz.dart';
import 'package:gas_station_app/features/create_invoice/data/model/customer.model.dart';

import '../../../../core/data_service/failure.dart';

abstract class AddCustomerRepo {
  Future<Either<Failure, Customer>> addCustomer({
    required String? name,
    required String? email,
    required String? phone,
    required String? branchNo,
  });
}
