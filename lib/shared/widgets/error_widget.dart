import 'package:flutter/material.dart';
import 'package:gas_station_app/core/app_utils/extension.dart';
import 'package:gas_station_app/core/theme/fonts.dart';

class GetErrorWidget extends StatelessWidget {
  const GetErrorWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.5,
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: MediaQuery.of(context).size.height / 4.5,
            // ),
            Image(image: AssetImage("error".png())),
            const SizedBox(
              height: 10.0,
            ),
            Text("$name     ", style: AppFonts.cairo16BPrimary),
          ],
        ),
      ),
    );
  }
}
