part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginWarning extends LoginState {
  final String message;

  LoginWarning({required this.message});
}

final class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}

final class LoginSuccess extends LoginState {
  final UserModel user;

  LoginSuccess({required this.user});
}
