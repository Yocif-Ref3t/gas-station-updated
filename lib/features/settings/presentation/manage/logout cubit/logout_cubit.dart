import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future logout() async {
    emit(LogoutLoading());
    await localLogout();
    emit(LogoutSuccess());
  }
}
