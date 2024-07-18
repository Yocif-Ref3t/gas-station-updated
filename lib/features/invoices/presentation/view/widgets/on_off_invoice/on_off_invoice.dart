import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';
import 'package:gas_station_app/features/invoices/presentation/view/widgets/on_off_invoice/online_all_invoices.dart';
import 'package:gas_station_app/features/invoices/presentation/view/widgets/on_off_invoice/widgets/invoice_item.dart';
import 'package:gas_station_app/features/invoices/presentation/view/widgets/on_off_invoice/widgets/on_off_Button.dart';

class OnOffInvoice extends StatefulWidget {
  const OnOffInvoice({super.key});

  @override
  State<OnOffInvoice> createState() => _OnOffInvoiceState();
}

class _OnOffInvoiceState extends State<OnOffInvoice> {
  //  online ==> 2
  //  offline ==> 1
  // at Begin connect
  int onClick = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 10.0,
            ),
            OnOffButton(
              onPressed: () {
                setState(() {
                  onClick = 1;
                });
              },
              iconButton: Icons.signal_wifi_connected_no_internet_4_rounded,
              text: "غير متصل",
              isOnButton: onClick == 1 ? true : false,
            ),
            OnOffButton(
              onPressed: () {
                setState(() {
                  onClick = 2;
                });
              },
              iconButton: Icons.wifi,
              text: "متصل",
              isOnButton: onClick == 2 ? true : false,
            ),
          ],
        ),
        Expanded(
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: AppColors.primaryColor)),
              child: const OnlineAllInvoices()),
        ),
        const SizedBox(
          height: 80.0,
        )
      ],
    );
  }
}
