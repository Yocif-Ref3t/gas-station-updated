import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/app_utils/extension.dart';
import 'package:gas_station_app/core/router/app_router.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';
import 'package:gas_station_app/core/theme/fonts.dart';
import 'package:gas_station_app/features/settings/presentation/manage/logout%20cubit/logout_cubit.dart';
import 'package:gas_station_app/shared/widgets/default_circle_loading_dialog.dart';
import 'package:gas_station_app/shared/widgets/profile_avatar.dart';
import 'package:go_router/go_router.dart';

import 'profile_icon.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutLoading) {
          isLoading = true;
          DefaultCircleLoading.cicleLoading(context);
        } else if (state is LogoutSuccess) {
          isLoading = false;
          Navigator.of(context).pop();
          GoRouter.of(context).go(AppRouter.kLoginViewPath);
        } else if (state is LogoutFailure) {
          isLoading = false;
        }
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.only(top: 50, right: 24, left: 24),
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          color: AppColors.appbarColor,
        ),
        child: Column(
          children: [
            Image.asset("elcaptin logo".png(), height: 50),
            const SizedBox(height: 50),
            const ProfileAvatar(
              width: 100,
              height: 100,
              iconSize: 85,
            ),
            const SizedBox(height: 24),
            const Text(
              "Shaban",
              style: AppFonts.cairo20B,
            ),
            const SizedBox(height: 4),
            const Text(
              "shaban@elcapten.com",
              style: AppFonts.fonts15B,
            ),
            const SizedBox(height: 71),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<LogoutCubit>(context).logout();
                  },
                  child: const ProfileButton(
                    title: "تسجيل الخروج",
                    icon: Icons.exit_to_app_sharp,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.kProfileDetailsViewPath,
                    );
                  },
                  child: const ProfileButton(
                    title: "الملف الشخصي",
                    icon: Icons.person,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
