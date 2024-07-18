import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/fonts.dart';
import '../../../../../../shared/widgets/svg_icon.dart';

class ProfileDetailsItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String icon;
  const ProfileDetailsItem(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      width: double.maxFinite,
      height: 71,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: AppFonts.cairo20B.copyWith(
                  color: AppColors.primaryColor.withOpacity(0.7),
                ),
              ),
              Text(
                subTitle,
                style: AppFonts.cairo20B.copyWith(
                  color: AppColors.primaryColor.withOpacity(0.7),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          SvgIconWidget(
            svg: icon,
            size: 30,
            color: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
