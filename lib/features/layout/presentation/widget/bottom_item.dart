import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';
import 'package:gas_station_app/features/layout/presentation/manager/cubit.dart';
import 'package:gas_station_app/features/layout/presentation/manager/states.dart';
import 'package:go_router/go_router.dart';

class BottomItem extends StatefulWidget {
  const BottomItem(
      {super.key,
      required this.path,
      required this.index,
      required this.text,
      required this.icon});
  final String path;
  final int index;
  final String text;
  final IconData icon;

  @override
  State<BottomItem> createState() => _BottomItemState();
}

class _BottomItemState extends State<BottomItem> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        final cubit = LayoutCubit.get(context);
        return InkWell(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: () {
            GoRouter.of(context).push(widget.path);
            cubit.changeClickTab(widget.index);
          },
          child: Column(
            children: [
              Icon(
                widget.icon,
                color: cubit.clickTab == widget.index
                    ? AppColors.secoundryColor
                    : Colors.grey,
                size: 25.0,
              ),
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 16.0,
                  color: cubit.clickTab == widget.index
                      ? AppColors.secoundryColor
                      : Colors.grey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
