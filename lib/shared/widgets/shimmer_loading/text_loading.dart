import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TextLoading extends StatelessWidget {
  final Widget text;
  final bool? isLoading;
  const TextLoading({super.key, required this.text, this.isLoading = true});

  @override
  Widget build(BuildContext context) {
    return isLoading!
        ? Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey.shade700,
            child: text,
          )
        : text;
  }
}
