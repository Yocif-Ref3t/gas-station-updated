import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CircleLoading extends StatelessWidget {
  const CircleLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
