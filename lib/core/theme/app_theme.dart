import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';

class ThemeManager {
  static ThemeData appTheme() {
    return ThemeData(
      fontFamily: "Cairo",
      scaffoldBackgroundColor: AppColors.backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.primaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
     
    );
  }
}
