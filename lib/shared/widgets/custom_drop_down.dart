import 'package:flutter/material.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';

class CustomDropDown extends StatelessWidget {
  final String hint;
  final Function(int?) onChanged;
  final int? value;
  final List<DropdownMenuItem<int>>? items;
  final String? Function(int?)? validator;
  const CustomDropDown(
      {super.key,
      required this.hint,
      required this.onChanged,
      required this.value,
      required this.items,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: DropdownButtonFormField<int>(
          borderRadius: BorderRadius.circular(15),
          isExpanded: true,
          value: value,
          elevation: 16,
          validator: validator,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide(color: Colors.black38),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide(color: Colors.black38),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide(color: AppColors.errorColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide(color: Colors.black38),
            ),
          ),
          hint: Text(hint),
          iconEnabledColor: Colors.black,
          iconDisabledColor: Colors.black,
          focusColor: Theme.of(context).colorScheme.background,
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
