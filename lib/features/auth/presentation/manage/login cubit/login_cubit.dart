import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/features/auth/data/repo/auth_repo_impl.dart';
import 'package:gas_station_app/shared/models/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    var result = await AuthRepoImpl().login(email: email, password: password);
    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.errorMessage)),
      (user) => emit(LoginSuccess(user: user)),
    );
  }
}
