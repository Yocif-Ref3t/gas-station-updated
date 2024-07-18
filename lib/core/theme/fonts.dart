import 'package:flutter/material.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';

abstract class AppFonts {
  static const font24SB = TextStyle(
    fontSize: 24,
    color: Colors.white,
  );
  static const cairo20B = TextStyle(
    fontFamily: "Cairo",
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const cairo20BPrimary = TextStyle(
    fontFamily: "Cairo",
    fontSize: 20,
    color: AppColors.primaryColor,
  );
  static const cairo16BPrimary = TextStyle(
    fontFamily: "Cairo",
    fontSize: 16,
    color: AppColors.primaryColor,
  );
  static const fonts15B = TextStyle(
    fontSize: 15,
    color: Colors.white,
  );
  static const fonts15BGray = TextStyle(
      fontSize: 15, color: Colors.white54, overflow: TextOverflow.ellipsis);
}
