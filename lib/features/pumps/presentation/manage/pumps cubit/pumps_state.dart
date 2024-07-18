part of 'pumps_cubit.dart';

@immutable
sealed class PumpsState {}

final class PumpsInitial extends PumpsState {}

final class PumpsLoading extends PumpsState {}

final class PumpsSuccess extends PumpsState {
  final List<PumpModel> pumps;

  PumpsSuccess({required this.pumps});
}

final class PumpsFailure extends PumpsState {
  final String errorMessage;
  PumpsFailure({required this.errorMessage});
}
