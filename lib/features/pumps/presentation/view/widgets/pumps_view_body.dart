import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/features/pumps/presentation/manage/pumps%20cubit/pumps_cubit.dart';
import 'package:gas_station_app/features/pumps/presentation/view/widgets/pump_item.dart';
import 'package:gas_station_app/shared/widgets/custom_snack_bar.dart';

import '../../../../../shared/widgets/error_widget.dart';
import '../../../../../shared/widgets/shimmer_loading/grid_loading.dart';

class PumpsViewBody extends StatelessWidget {
  const PumpsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PumpsCubit, PumpsState>(
      builder: (context, state) {
        if (state is PumpsFailure) {
          WidgetsBinding.instance.addPostFrameCallback((timings) {
            ShowCustomSnackBar(context).failure(message: state.errorMessage);
          });
          return const GetErrorWidget(name: "لا يوجد مضخات");
        } else if (state is PumpsSuccess) {
          return GridView.builder(
            itemCount: state.pumps.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) => PumpItem(
              pump: state.pumps[index],
            ),
          );
        } else {
          return const GridViewLoading();
        }
      },
    );
  }
}
