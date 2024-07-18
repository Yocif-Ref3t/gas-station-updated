import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());
    var result = await localLogout();
    result.fold(
      (failure) => emit(LogoutFailure(errorMessage: failure.errorMessage)),
      (success) => emit(LogoutSuccess()),
    );
  }
}
