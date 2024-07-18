import 'package:flutter/material.dart';
import 'package:gas_station_app/shared/widgets/text_form_field.dart';

// ignore: must_be_immutable
class SearchField extends StatefulWidget {
  SearchField({super.key, required this.searchController, required this.onTap});
  TextEditingController? searchController;
  void Function()? onTap;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextFormField(
      hintText: "البحث",
      textController: widget.searchController,
      onEditingComplete: widget.onTap,
      aroundPadding: const EdgeInsets.all(10.0),
      suffixIcon: InkWell(
          onTap: widget.onTap,
          child: Icon(Icons.search, size: 35.0, color: Colors.grey[400])),
    );
  }
}
