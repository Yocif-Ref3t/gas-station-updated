import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';
import 'package:gas_station_app/features/invoices/presentation/manager/cubit/all_invoice_cubit.dart';
import 'package:gas_station_app/features/invoices/presentation/view/widgets/invoices_body_view.dart';
import 'package:gas_station_app/shared/widgets/custom_appbar.dart';
import 'package:gas_station_app/shared/widgets/error_widget.dart';

class InvoicesView extends StatelessWidget {
  const InvoicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return
        //  checkOfInvoiceData() != "success"
        //     ? GetErrorWidget(
        //         name: checkOfInvoiceData(),
        //       )
        //     :
        const Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppbar(
        isShowData: true,
        title: "الفواتير",
      ),
      body: InvoicesBodyView(),
    );
  }
}
