import 'package:flutter/material.dart';
import 'package:gas_station_app/core/theme/fonts.dart';

class GridItem extends StatelessWidget {
  final String title;
  final String image;
  final Function() onPressed;
  const GridItem(
      {super.key,
      required this.title,
      required this.image,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.8,
            image: AssetImage(image),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: AppFonts.cairo20B,
        ),
      ),
    );
  }
}
