import 'package:flutter/material.dart';
import 'package:gas_station_app/core/router/app_router.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';
import 'package:gas_station_app/features/layout/presentation/widget/bottom_item.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15.0),
      width: double.infinity,
      height: 80,
      decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomItem(
            icon: Icons.local_grocery_store,
            index: 0,
            path: AppRouter.kBranchesViewPath,
            text: "المبيعات",
          ),
          BottomItem(
            icon: Icons.local_gas_station,
            index: 1,
            path: AppRouter.kPumpsViewPath,
            text: "المضخات",
          ),
          BottomItem(
            icon: Icons.receipt_long_rounded,
            index: 2,
            path: AppRouter.kInvoicesViewPath,
            text: "الفواتير",
          ),
          BottomItem(
            icon: Icons.settings,
            index: 3,
            path: AppRouter.kSettingsViewPath,
            text: "الاعدادات",
          )
        ],
      ),
    );
  }
}
