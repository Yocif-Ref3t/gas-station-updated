import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AllInvoicesShimmer extends StatelessWidget {
  const AllInvoicesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
             baseColor: Colors.grey.shade300,
             highlightColor: Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
