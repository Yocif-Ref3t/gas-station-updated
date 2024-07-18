import 'package:flutter/material.dart';
import 'package:gas_station_app/shared/widgets/error_widget.dart';

class LoadingAndError extends StatelessWidget {
  const LoadingAndError(
      {super.key,
      required this.child,
      required this.isLoading,
      required this.isError,
      required this.loadingWidget,
      this.errorText});
  final bool isLoading;
  final Widget loadingWidget;
  final Widget child;
  final bool isError;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return loadingWidget;
    } else if (isError) {
      return GetErrorWidget(
        name: errorText ?? "لا توجد بيانات",
      );
    } else {
      return child;
    }
  }
}
