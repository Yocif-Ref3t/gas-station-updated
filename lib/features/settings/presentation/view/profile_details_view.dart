import 'package:flutter/material.dart';
import 'package:gas_station_app/features/settings/presentation/view/widget/profile%20details%20view/profile_details_view_body.dart';

class ProfileDetailsView extends StatelessWidget {
  const ProfileDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ProfileDetailsViewBody(),
      ),
    );
  }
}
