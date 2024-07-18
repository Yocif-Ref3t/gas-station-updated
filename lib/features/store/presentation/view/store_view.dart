import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';
import 'package:gas_station_app/features/store/presentation/manager/cubit/store_cubit.dart';
import 'package:gas_station_app/features/store/presentation/view/widgets/Store_view_body.dart';
import 'package:gas_station_app/shared/widgets/custom_appbar.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => StoreCubit()..getAllStoress(),
      child: const Scaffold(
        appBar: CustomAppbar(
          title: "المستودعات",
        ),
        body: Padding(
          padding:   EdgeInsets.only( left: 8.0, right: 8.0, top: 8.0),
          child: StoreViewBody(),
        ),
      ),
    );
  }
}
