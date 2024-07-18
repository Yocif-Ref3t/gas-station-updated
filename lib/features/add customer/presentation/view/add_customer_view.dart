import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/features/add%20customer/presentation/manage/add%20customer%20cubit/add_customer_cubit.dart';
import 'package:gas_station_app/features/add%20customer/presentation/view/widget/add%20customer%20view/add_customer_view_body.dart';
import 'package:gas_station_app/shared/widgets/custom_appbar.dart';

class AddCustomerView extends StatelessWidget {
  const AddCustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCustomerCubit(),
      child: const SafeArea(
        child: Scaffold(
          appBar: CustomAppbar(
            title: "إضافة عميل",
            isShowData: true,
          ),
          body: AddCustomerViewBody(),
        ),
      ),
    );
  }
}
