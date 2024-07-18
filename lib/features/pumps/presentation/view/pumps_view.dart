import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';
import 'package:gas_station_app/features/pumps/presentation/manage/pumps%20cubit/pumps_cubit.dart';
import 'package:gas_station_app/features/pumps/presentation/view/widgets/pumps_view_body.dart';
import 'package:gas_station_app/shared/widgets/custom_appbar.dart';
import 'package:gas_station_app/shared/widgets/error_widget.dart';

class PumpsView extends StatelessWidget {
  const PumpsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PumpsCubit()..fetchAllPumps(),
      child: const Scaffold(
        appBar: CustomAppbar(
          title: "المضخات",
        ),
        body:
           
            Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
          child: PumpsViewBody(),
        ),
      ),
   
    );
  }
}
