import 'package:flutter/material.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';
import 'package:gas_station_app/shared/widgets/defult_button.dart';

class OnOffButton extends StatefulWidget {
  const OnOffButton(
      {super.key,
      required this.text,
      required this.isOnButton,
      required this.iconButton,
      required this.onPressed});
  final String text;
  final bool isOnButton;
  final IconData iconButton;
  final void Function()? onPressed;

  @override
  State<OnOffButton> createState() => _OnOffButtonState();
}

class _OnOffButtonState extends State<OnOffButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 120,
        height: 40,
        decoration: BoxDecoration(
          color: widget.isOnButton
              ? AppColors.backgroundColor
              : AppColors.primaryColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
          border: const Border(
            top: BorderSide(color: AppColors.primaryColor),
            right: BorderSide(color: AppColors.primaryColor),
            left: BorderSide(color: AppColors.primaryColor),
          ),
        ),
        child: DefaultButton(
          onPressed: widget.onPressed,
          text: widget.text,
          icon: widget.iconButton,
          iconSize: 14.0,
          iconColor: widget.isOnButton ? AppColors.primaryColor : Colors.white,
          textStyle: TextStyle(
              color: widget.isOnButton ? AppColors.primaryColor : Colors.white,
              fontSize: 13.0),
          backgroundColor: Colors.transparent,
        ));
  }
}

