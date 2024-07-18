import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gas_station_app/core/app_utils/extension.dart';

import '../../core/theme/app_colors.dart';

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget(
      {super.key, required this.imageUrl, this.width, this.height});
  final String imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      //progressIndicatoe or placeholder  CAN BUILD BOTH TOGATHER
      progressIndicatorBuilder: (context, imageUrl, progress) {
        return Center(
          child: CircularProgressIndicator(
            value: progress.progress,
            color: AppColors.primaryColor,
          ),
        );
      },
      // placeholder: (context, url) {
      //   return Container(
      //     color: Colors.yellow,
      //   );
      // },
      errorWidget: (context, imageUrl, object) {
        return Image.asset("logo".png());
      },
    );
  }
}
