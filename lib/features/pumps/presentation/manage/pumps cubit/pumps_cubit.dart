import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';
import 'package:gas_station_app/features/pumps/data/models/pump_model.dart';

import 'package:gas_station_app/features/pumps/data/repo/pumps_repo_impl.dart';
part 'pumps_state.dart';

class PumpsCubit extends Cubit<PumpsState> {
  PumpsCubit() : super(PumpsInitial());

  Future<void> fetchAllPumps() async {
    final String? branchNO = getInvoiceData()?.branch?.id.toString();
    final String? storeId = getInvoiceData()?.store?.id.toString();
    if (storeId == null || branchNO == null) {
      return emit(PumpsFailure(
        errorMessage: "يجب اختيار الفرع والمستودع اولا",
      ));
    }
    emit(PumpsLoading());
    var result = await PumpsRepoImpl().getAllPumps(
      branchNo: branchNO,
      storeId: storeId,
    );
    result.fold(
      (failure) => emit(PumpsFailure(errorMessage: failure.errorMessage)),
      (pumps) => emit(PumpsSuccess(pumps: pumps)),
    );
  }
}
