import 'package:flutter/material.dart';
import 'package:gas_station_app/features/settings/presentation/view/widget/settings%20view/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SettingsViewBody(),
      ),
    );
  }
}
