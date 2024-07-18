import 'package:flutter/material.dart';
import 'package:gas_station_app/core/theme/fonts.dart';
import 'package:gas_station_app/shared/widgets/defult_button.dart';
import 'package:gas_station_app/shared/widgets/text_form_field.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({
    super.key,
  });
  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: MediaQuery.of(context).size.height / 1.4,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        color: Color(0xff0A3B74),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.filter_list,
                    size: 25.0,
                    color: Colors.white,
                  ),
                  Text(
                    "تصنيف حسب",
                    style: AppFonts.cairo20B,
                  )
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              DefaultTextFormField(
                isFilledColor: false,
                borderSideColor: Colors.white,
                hintColor: Colors.white,
                hintText: "بحث بالاسم",
                cursorColor: Colors.white,
                textStyle: AppFonts.fonts15B,
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DefaultTextFormField(
                isFilledColor: false,
                borderSideColor: Colors.white,
                hintColor: Colors.white,
                hintText: "بحث برقم الفاتورة",
                cursorColor: Colors.white,
                textStyle: AppFonts.fonts15B,
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: DefaultButton(
                      icon: Icons.calendar_month,
                      iconColor: Colors.white,
                      iconSize: 25.0,
                      onPressed: () {},
                      borderSide:
                          const BorderSide(color: Colors.white, width: 0.5),
                      text: "الي تاريخ",
                      textStyle: AppFonts.cairo20B,
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: DefaultButton(
                      icon: Icons.calendar_month,
                      iconColor: Colors.white,
                      iconSize: 25.0,
                      onPressed: () {},
                      borderSide:
                          const BorderSide(color: Colors.white, width: 0.5),
                      text: "من تاريخ",
                      textStyle: AppFonts.cairo20B,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: DefaultButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: "رجوع",
                    textStyle: AppFonts.cairo20BPrimary,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  flex: 1,
                  child: DefaultButton(
                    onPressed: () {},
                    text: "بحث",
                    textStyle: AppFonts.cairo20BPrimary,
                    backgroundColor: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
