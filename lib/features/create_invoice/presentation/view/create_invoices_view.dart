import 'package:flutter/material.dart';
import 'package:gas_station_app/shared/widgets/custom_appbar.dart';
import 'create invoice view/create_invoice_view_body.dart';

class CreateInvoiceView extends StatelessWidget {
  const CreateInvoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppbar(
          title: "إنشاء فاتوره",
          isShowData: true,
          backIcon: true,
        ),
        body: CreateInvoiceViewBody(),
      ),
    );
  }
}
