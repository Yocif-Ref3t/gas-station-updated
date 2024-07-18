import 'package:flutter/material.dart';
import 'package:gas_station_app/core/router/app_router.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/data_service/local_data/local_data.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).push(checkLocalLogin()
          ? AppRouter.kBranchesViewPath
          : AppRouter.kLoginViewPath);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xff28295F),
          Color(0xff0A3B74),
        ],
      )),
      child: Center(
        child: Image.asset(
          "assets/images/elcaptin logo.png",
          height: 120,
        ),
      ),
    );
  }
}
