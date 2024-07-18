import 'package:flutter/material.dart';

class OR extends StatelessWidget {
  const OR({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(thickness: 1)),
        SizedBox(width: 10),
        Text("أو"),
        SizedBox(width: 10),
        Expanded(child: Divider(thickness: 1)),
      ],
    );
  }
}
