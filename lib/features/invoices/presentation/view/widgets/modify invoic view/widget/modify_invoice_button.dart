import 'package:flutter/material.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';

class ModifyInvoiceButton extends StatefulWidget {
  const ModifyInvoiceButton(
      {super.key, required this.icon, required this.text, required this.onTap});
  final IconData? icon;
  final String? text;
  final void Function()? onTap;

  @override
  State<ModifyInvoiceButton> createState() => _ModifyInvoiceButtonState();
}

class _ModifyInvoiceButtonState extends State<ModifyInvoiceButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        children: [
          Icon(
            widget.icon,
            color: AppColors.secoundryColor,
            size: 25.0,
          ),
          Text(
            widget.text ?? "",
            style: const TextStyle(
              fontSize: 16.0,
              color: AppColors.secoundryColor,
            ),
          ),
        ],
      ),
    );
  }
}
