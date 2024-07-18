import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gas_station_app/core/app_utils/extension.dart';

class SvgIconWidget extends StatelessWidget {
  const SvgIconWidget({super.key, required this.svg, this.color, this.size});
  final String svg;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: SvgPicture.asset(
        svg.svg(),
        fit: BoxFit.cover,
        color: color,
        width: size,
      ),
    );
  }
}
