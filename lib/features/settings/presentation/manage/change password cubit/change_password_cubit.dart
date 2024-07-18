import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/features/settings/data/repo/change_password_repo_impl.dart';
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  Future changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirmation,
  }) async {
    emit(ChangePasswordLoading());
    var result = await ChangePasswordRepoImpl().changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      passwordConfirmation: passwordConfirmation,
    );
    result.fold(
      (failure) =>
          emit(ChangePasswordFailure(errorMessage: failure.errorMessage)),
      (message) => emit(ChangePasswordSuccess(message: message)),
    );
  }
}
