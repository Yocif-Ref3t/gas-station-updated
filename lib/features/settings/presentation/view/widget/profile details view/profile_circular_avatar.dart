import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../shared/widgets/svg_icon.dart';

class ProfileCircularAvatar extends StatelessWidget {
  const ProfileCircularAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: 105,
          height: 105,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.primaryColor),
            shape: BoxShape.circle,
          ),
          child: const SvgIconWidget(
            svg: "peson-gold",
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(5),
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: AppColors.primaryColor),
              shape: BoxShape.circle,
            ),
            child: const SvgIconWidget(svg: "camera-gold"),
          ),
        )
      ],
    );
  }
}
