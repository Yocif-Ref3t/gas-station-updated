import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/features/invoices/data/online_invoices/model/invoice_page_details.dart';
import 'package:gas_station_app/features/invoices/presentation/manager/cubit/all_invoice_cubit.dart';
import 'package:gas_station_app/features/invoices/presentation/view/widgets/modify%20invoic%20view/widget/modify_invoice_body_view.dart';

class ModifyInvoiceView extends StatelessWidget {
  const ModifyInvoiceView({super.key, required this.invoicePageDetails });
  final InvoicePageDetails invoicePageDetails;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AllInvoicesCubit(),

      child: ModifyInvoiceBodyView(
        invoicePageDetails: invoicePageDetails,
      ),
    );
  }
}
