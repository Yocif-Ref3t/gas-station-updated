import 'package:flutter/material.dart';

import '../../../../../../core/theme/fonts.dart';

class ProfileButton extends StatelessWidget {
  final String title;
  final IconData icon;
  const ProfileButton({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width * 0.5) - 48,
      child: Column(
        children: [
          const Divider(thickness: 1, color: Color(0xffBA8D2D)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: AppFonts.fonts15B),
              const SizedBox(width: 16),
              Icon(icon, color: Colors.white),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(thickness: 1, color: Color(0xffBA8D2D)),
        ],
      ),
    );
  }
}
