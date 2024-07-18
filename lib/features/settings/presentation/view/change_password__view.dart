import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/features/settings/presentation/manage/change%20password%20cubit/change_password_cubit.dart';
import 'package:gas_station_app/features/settings/presentation/view/widget/change%20Password%20view/change_password_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: const SafeArea(
        child: Scaffold(
          body: ChangePasswordViewBody(),
        ),
      ),
    );
  }
}
