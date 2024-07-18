import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SearchLoading extends StatelessWidget {
  const SearchLoading(
      {super.key, required this.isLoading, required this.child});
  final bool isLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 70,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          )
        : child;
  }
}
