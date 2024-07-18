import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';
import 'package:gas_station_app/core/data_service/network.dart';
import 'package:gas_station_app/features/layout/data/repo/sync_invoice_repo_impl.dart';
import 'package:gas_station_app/shared/models/invoice_model.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'sync_invoice_state.dart';

class SyncInvoiceCubit extends Cubit<SyncInvoiceState> {
  SyncInvoiceCubit() : super(SyncInvoiceInitial());

  void networkChecker() {
    log("/// ########################################### ///");
    Network.checker().listen((event) {
      if (event == InternetStatus.connected) {
        syncOfflineInvoice();
      } else {
        log("Disconnected from cubit");
      }
    });
  }

  Future syncOfflineInvoice() async {
    List<InvoiceModel> invoices = getAllOfflineInvoices();
    log("////########### invoices  #########////");
    print(invoices);
    if (invoices.isEmpty) {
      return emit(SyncInvoiceSuccess(
        message: "جميع الفواتير متزامنة",
      ));
    }
    emit(SyncInvoiceLoading());
    var result = await SyncInvoiceRepoImpl().syncOfflineInvoice(
      invoices: invoices,
    );
    result.fold(
      (failure) => emit(SyncInvoiceFailure(errorMessage: failure.errorMessage)),
      (message) => emit(SyncInvoiceSuccess(message: message)),
    );
    print(getAllOfflineInvoices());
  }
}
