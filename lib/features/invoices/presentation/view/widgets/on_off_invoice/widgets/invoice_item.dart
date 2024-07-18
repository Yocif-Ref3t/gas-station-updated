import 'package:flutter/material.dart';
import 'package:gas_station_app/core/router/app_router.dart';
import 'package:gas_station_app/features/create_invoice/presentation/manager/create_cubit.dart';
import 'package:gas_station_app/features/invoices/data/online_invoices/model/invoice_page_details.dart';
import 'package:gas_station_app/features/invoices/presentation/manager/cubit/all_invoice_cubit.dart';
import 'package:gas_station_app/features/invoices/presentation/view/widgets/on_off_invoice/widgets/invoice_menu_item.dart';
import 'package:gas_station_app/shared/models/invoice_model.dart';
import 'package:go_router/go_router.dart';

class InvoiceItem extends StatefulWidget {
  const InvoiceItem({super.key, required this.invoice, required this.index});
  final InvoiceModel invoice;
  final int index;

  @override
  State<InvoiceItem> createState() => _InvoiceItemState();
}

class _InvoiceItemState extends State<InvoiceItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // when return from modify page and delete invoice from pagination
        GoRouter.of(context)
            .push(AppRouter.kModifyInvoiceViewPath,
                extra: InvoicePageDetails(
                    isShow: true, invoiceModel: widget.invoice))
            .then((value) {
          if (value == "delete") {
            AllInvoicesCubit.get(context)
                .deleteInvoiceFromPaginagtion(context, widget.index);
          }
          if (value == "update") {
            AllInvoicesCubit.get(context).pagingController.refresh();
          }
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "رقم الفاتورة  : ${widget.invoice.invoiceNo ?? "---"}",
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              ),
              Row(
                children: [
                  Text(
                    widget.invoice.customerName ?? "---",
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  const Text(
                    " : ",
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  const Text(
                    "الاسم",
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text("التار يخ"),
              Text(widget.invoice.invDate ?? "---"),
            ],
          ),
          InvoiceMenuButton(
            index: widget.index,
            invoice: widget.invoice,
          )
        ],
      ),
    );
  }
}
