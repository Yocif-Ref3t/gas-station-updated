import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/features/settings/presentation/manage/logout%20cubit/logout_cubit.dart';
import 'package:gas_station_app/features/settings/presentation/view/widget/profile%20view/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(),
      child: const SafeArea(
        child: Scaffold(
          body: ProfileViewBody(),
        ),
      ),
    );
  }
}
