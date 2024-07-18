import 'package:flutter/material.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';

// icon + text
class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.icon,
      this.iconColor,
      this.iconSize,
      this.height,
      this.backgroundColor,
      this.textColor,
      this.radius,
      this.textStyle,
      this.width,
      this.borderSide});
  final void Function()? onPressed;
  final String text;
  final IconData? icon;
  final Color? iconColor;
  final BorderSide? borderSide;
  final Color? textColor;
  final double? iconSize;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final double? radius;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.0,
      width: width ?? 150.0,
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0.0),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  side: borderSide ?? BorderSide.none,
                  borderRadius:
                      BorderRadius.all(Radius.circular(radius ?? 20.0)))),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
              backgroundColor: MaterialStateProperty.all(
                  backgroundColor ?? AppColors.primaryColor)),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: icon == null
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceEvenly,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: iconColor ?? Colors.white,
                  size: iconSize,
                ),
              Text(text,
                  style:
                      textStyle ?? TextStyle(color: textColor ?? Colors.white)),
            ],
          )),
    );
  }
}

class DefaultOutlineButton extends StatelessWidget {
  const DefaultOutlineButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.icon,
      this.iconColor,
      this.iconSize,
      this.height,
      this.textColor,
      this.radius,
      this.borderColor});
  final void Function()? onPressed;
  final String text;
  final IconData? icon;
  final Color? iconColor;
  final Color? textColor;
  final Color? borderColor;
  final double? iconSize;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.0,
      child: OutlinedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: borderColor ?? AppColors.primaryColor)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 20.0)),
          )),
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            if (icon != null)
              Icon(
                icon,
                color: iconColor,
                size: iconSize,
              ),
            if (icon != null)
              const SizedBox(
                width: 10,
              ),
            Text(text, style: TextStyle(color: textColor))
          ],
        ),
      ),
    );
  }
}
