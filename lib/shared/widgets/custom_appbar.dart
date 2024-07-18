import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';
import 'package:gas_station_app/core/router/app_router.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';
import 'package:gas_station_app/core/theme/fonts.dart';
import 'package:gas_station_app/shared/widgets/profile_avatar.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool isShowData;
  final bool? backIcon;
  const CustomAppbar({
    super.key,
    this.title,
    this.isShowData = false,
    this.backIcon = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, right: 16, left: 16, bottom: 10),
      height: 120,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kProfileViewPath);
            },
            child: !backIcon!
                ? const ProfileAvatar(
                    width: 35,
                    height: 35,
                    iconSize: 24,
                  )
                : GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.secoundryColor,
                    ),
                  ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                Image.asset(
                  "assets/images/elcaptin logo.png",
                  height: 30,
                ),
                if (!isShowData) const Spacer(),
                if (title != null)
                  Text(
                    title!,
                    style: AppFonts.cairo20B,
                  ),
                if (!isShowData)
                  const SizedBox(
                    height: 10.0,
                  ),
                if (isShowData)
                  Text(
                    "${getInvoiceData()?.branch?.name ?? "لم يتم تحديد الفرع"} / ${getInvoiceData()?.store?.name ?? "لم يتم تحديد المستودع"}",
                    style: AppFonts.fonts15BGray,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(120);
}
