import 'package:flutter/material.dart';
import 'package:gas_station_app/core/theme/fonts.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.img, required this.title});
  final String img;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(8),
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.7,
            image: AssetImage(img),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Text(
          title,
          style: AppFonts.cairo20B,
        ),
      ),
    );
  }
}
