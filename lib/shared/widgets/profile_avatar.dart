import 'package:flutter/material.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';

class ProfileAvatar extends StatelessWidget {
  final double width;
  final double height;
  final double iconSize;
  const ProfileAvatar(
      {super.key,
      required this.width,
      required this.height,
      required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.person_outline,
        color: AppColors.secoundryColor,
        size: iconSize,
      ),
    );
  }
}
