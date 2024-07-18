import 'package:flutter/material.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';
import 'profile_circular_avatar.dart';
import 'profile_details_item.dart';

class ProfileDetailsViewBody extends StatelessWidget {
  const ProfileDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/elcaptin_main_logo.png",
              height: 67,
            ),
            const SizedBox(height: 60),
            const ProfileCircularAvatar(),
            const SizedBox(height: 21),
            ProfileDetailsItem(
              title: "الكود",
              subTitle: getUser()!.id.toString(),
              icon: "id-card",
            ),
            const SizedBox(height: 20),
            ProfileDetailsItem(
              title: "الاسم",
              subTitle: getUser()!.username ?? "",
              icon: "peson",
            ),
            const SizedBox(height: 20),
            ProfileDetailsItem(
              title: "البريد الالكتروني",
              subTitle: getUser()!.email ?? "",
              icon: "mail",
            ),
          ],
        ),
      ),
    );
  }
}
