import 'package:flutter/material.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';

class DefaultCircleLoading {
  static cicleLoading(BuildContext context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: Container(
              height: 150,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          );
        });
  }
}
