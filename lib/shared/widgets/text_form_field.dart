import 'package:flutter/material.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';

// ignore: must_be_immutable
class DefaultTextFormField extends StatefulWidget {
  DefaultTextFormField(
      {super.key,
      this.title,
      this.titleColor,
      this.titleSize,
      this.textController,
      this.cursorColor,
      this.initialValue,
      this.keybordType,
      this.obscureText = false,
      this.onChanged,
      this.onFieldSubmitted,
      this.onSaved,
      this.showCursor,
      this.textStyle,
      this.validator,
      this.label,
      this.labelText,
      this.labelStyle,
      this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.isFilledColor = true,
      this.fillColor,
      this.borderRadius,
      this.borderSideColor,
      this.borderSideWidth,
      this.contentPadding,
      this.hintColor,
      this.textColor,
      this.textSize,
      this.boxShadow,
      this.isPassword = false,
      this.readOnly,
      this.aroundPadding = EdgeInsets.zero,
      this.textAlign = TextAlign.start,
      this.onEditingComplete,
      this.onTap});
  //title
  final String? title;
  final Color? titleColor;
  final double? titleSize;
  // textForm
  final TextEditingController? textController;
  final Color? cursorColor;
  final bool? showCursor;
  final String? initialValue;
  final TextInputType? keybordType;
  bool obscureText;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final TextStyle? textStyle;
  final String? Function(String?)? validator;
  // dicoration
  final Widget? label;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isFilledColor;
  final Color? fillColor;
  final double? borderRadius;
  final Color? borderSideColor;
  final double? borderSideWidth;
  final EdgeInsetsGeometry? contentPadding;
  final double? textSize;
  final Color? textColor;
  final Color? hintColor;
  final List<BoxShadow>? boxShadow;
  final bool isPassword;
  EdgeInsetsGeometry? aroundPadding;
  void Function()? onEditingComplete;
  bool? readOnly;
  TextAlign textAlign;
  void Function()? onTap;
  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (widget.title != null)
          Text(
            widget.title ?? "",
            style: TextStyle(
                color: widget.titleColor,
                fontSize: widget.titleSize,
                fontWeight: FontWeight.w500),
          ),
        if (widget.title != null)
          const SizedBox(
            height: 10,
          ),
        Container(
          // to fix label error
          padding: widget.aroundPadding,
          // clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
            boxShadow: widget.boxShadow,
          ),
          child: TextFormField(
            onTap: widget.onTap,
            onEditingComplete: widget.onEditingComplete,
            readOnly: widget.readOnly ?? false,
            controller: widget.textController,
            cursorColor: widget.cursorColor ?? AppColors.primaryColor,
            showCursor: widget.showCursor,
            initialValue: widget.initialValue,
            keyboardType: widget.keybordType,
            obscureText: widget.obscureText,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            onSaved: widget.onSaved,
            style: widget.textStyle,
            // to controll of align of text in text form field
            textAlign: widget.textAlign,
            validator: widget.validator,
            decoration: InputDecoration(
              contentPadding: widget.contentPadding,
              label: widget.label,
              labelText: widget.labelText,
              labelStyle: const TextStyle(
                  fontSize: 16.0, color: AppColors.primaryColor),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                  color: widget.hintColor ?? Colors.grey[400], fontSize: 17.0),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.isPassword
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          widget.obscureText = !widget.obscureText;
                        });
                      },
                      child: Icon(
                        widget.obscureText == false
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                        color: AppColors.primaryColor,
                      ),
                    )
                  : widget.suffixIcon,
              filled: widget.isFilledColor ?? true,
              fillColor: widget.fillColor ?? AppColors.backgroundColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius ?? 20.0)),
                borderSide: BorderSide(
                    width: widget.borderSideWidth ?? 0.0,
                    color: widget.borderSideColor ??
                        widget.fillColor ??
                        Colors.black87),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius ?? 20.0)),
                borderSide: BorderSide(
                  width: widget.borderSideWidth ?? 1.0,
                  color: widget.borderSideColor ??
                      widget.fillColor ??
                      AppColors.primaryColor,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius ?? 20.0)),
                borderSide: BorderSide(
                    width: widget.borderSideWidth ?? 1.0,
                    color: AppColors.errorColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius ?? 20.0)),
                borderSide: BorderSide(
                    width: widget.borderSideWidth ?? 1.0,
                    color: AppColors.errorColor),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
