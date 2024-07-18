import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/features/auth/presentation/manage/login%20cubit/login_cubit.dart';
import 'package:gas_station_app/features/auth/presentation/view/widget/login%20view/login_view_body.dart';

class EmailLoginView extends StatelessWidget {
  const EmailLoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const Scaffold(
        resizeToAvoidBottomInset: true,
        body: LoginViewBody(),
      ),
    );
  }
}
