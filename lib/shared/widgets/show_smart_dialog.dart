import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';

// SmartDialog.showLoading(msg: "loading" , clickMaskDismiss: true ,);

class ShowSmartDialog {
  static bool isShowen = false;

  static show({bool fullScreen = false}) {
    if (isShowen == false) {
      SmartDialog.show(
          clickMaskDismiss: false,
          animationType: SmartAnimationType.scale,
          animationTime: const Duration(milliseconds: 100),
          keepSingle: true,
          builder: (context) => fullScreen
              ? loadingWidget()
              : Dialog(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: SizedBox(height: 200, child: loadingWidget()),
                ));

      isShowen = true;
    }
  }

  static Center loadingWidget() => const Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      );

  static dismis() {
    if (isShowen) {
      SmartDialog.dismiss();
      isShowen = false;
    } else {}
  }
}
