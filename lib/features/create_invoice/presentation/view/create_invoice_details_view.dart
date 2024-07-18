import 'package:flutter/material.dart';
import 'package:gas_station_app/shared/widgets/custom_appbar.dart';

import 'create invoice details view/create_invoice_details_view_body.dart';

class CreateInvoiceDetailsView extends StatelessWidget {
  const CreateInvoiceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: CustomAppbar(
          title: "إنشاء فاتوره",
          isShowData: true,
        ),
        body: CreateInvoiceDetailsViewBody(),
      ),
    );
  }
}
