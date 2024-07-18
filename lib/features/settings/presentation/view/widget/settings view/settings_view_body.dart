import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gas_station_app/core/app_utils/extension.dart';
import 'package:gas_station_app/core/router/app_router.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';
import 'package:gas_station_app/core/theme/fonts.dart';
import 'package:go_router/go_router.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "elcaptin_main_logo".png(),
            height: 67,
          ),
          const SizedBox(height: 107),
          Text(
            "الإعدادات",
            style: AppFonts.font24SB.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 39),
          const Divider(),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kChangePasswordViewPath,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.key_sharp,
                  color: AppColors.primaryColor,
                  size: 25,
                ),
                Text(
                  "تغيير كلمة المرور",
                  style: AppFonts.font24SB.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                const Icon(
                  Icons.arrow_right,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
        ],
      ),
    );
  }
}
