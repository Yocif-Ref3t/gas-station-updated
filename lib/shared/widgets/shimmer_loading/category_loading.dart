import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryLoading extends StatelessWidget {
  const CategoryLoading(
      {super.key, required this.isLoading, required this.child});
  final bool isLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
              );
            },
          )
        : child;
  }
}
