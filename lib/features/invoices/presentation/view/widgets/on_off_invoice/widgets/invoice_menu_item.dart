import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/router/app_router.dart';
import 'package:gas_station_app/features/invoices/data/online_invoices/model/invoice_page_details.dart';
import 'package:gas_station_app/features/invoices/presentation/manager/cubit/all_invoice_cubit.dart';
import 'package:gas_station_app/features/invoices/presentation/manager/cubit/all_invoice_states.dart';
import 'package:gas_station_app/features/invoices/printing/print_invoice.dart';
import 'package:gas_station_app/shared/models/invoice_model.dart';
import 'package:gas_station_app/shared/widgets/custom_snack_bar.dart';
import 'package:gas_station_app/shared/widgets/default_circle_loading_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:popover/popover.dart';

class InvoiceMenuButton extends StatelessWidget {
  const InvoiceMenuButton(
      {super.key, required this.invoice, required this.index});
  final InvoiceModel invoice;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: const Icon(Icons.menu, color: Colors.black),
        onTap: () => showPopover(
              context: context,
              direction: PopoverDirection.right,
              bodyBuilder: (context) => InvoiceMenuItems(
                index: index,
                invoice: invoice,
              ),
            ).then((value) {
              if (value == "delete") {
                AllInvoicesCubit.get(context)
                    .deleteInvoiceFromPaginagtion(context, index);
              }
            }));
  }
}

class InvoiceMenuItems extends StatelessWidget {
  const InvoiceMenuItems(
      {super.key, required this.invoice, required this.index});
  final InvoiceModel invoice;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllInvoicesCubit, AllInvoiceState>(
        listener: (context, state) {
      if (state is LoadingDeleteInvoiceState) {
        DefaultCircleLoading.cicleLoading(context);
      }

      if (state is SuccessDeleteInvoiceState) {
        // end loading
        Navigator.pop(context);
        ShowCustomSnackBar(context).done(message: "تم الحذف بنجاح");
        // end pop design then delete from pagination
        Navigator.pop(context, "delete");
      }
      if (state is ErrorDeleteInvoiceState) {
        // end loading
        Navigator.pop(context);
        ShowCustomSnackBar(context).failure(message: state.errorMsg);
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10.0),
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.menu),
                SizedBox(width: 10),
                Text("الفواتير"),
              ],
            ),
            const Divider(),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    GoRouter.of(context)
                        .push(AppRouter.kModifyInvoiceViewPath,
                            extra: InvoicePageDetails(
                                isShow: false, invoiceModel: invoice))
                        .then((value) {
                      if (value == "delete") {
                        AllInvoicesCubit.get(context)
                            .deleteInvoiceFromPaginagtion(context, index);
                        // end pop design
                        Navigator.pop(context);
                      }
                      if (value == "update") {
                        AllInvoicesCubit.get(context)
                            .pagingController
                            .refresh();
                        Navigator.pop(context);
                      }
                    });
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("تعديل"),
                      SizedBox(width: 10),
                      Icon(Icons.edit),
                    ],
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    AllInvoicesCubit.get(context)
                        .deleteInvoice(context, docNo: invoice.docNo ?? 0);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("حذف"),
                      SizedBox(width: 10),
                      Icon(Icons.delete),
                    ],
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    GoRouter.of(context)
                        .push(AppRouter.kModifyInvoiceViewPath,
                            extra: InvoicePageDetails(
                                isShow: true, invoiceModel: invoice))
                        .then((value) {
                      if (value == "delete") {
                        AllInvoicesCubit.get(context)
                            .deleteInvoiceFromPaginagtion(context, index);
                        // end pop design
                        Navigator.pop(context);
                      }
                      if (value == "update") {
                        AllInvoicesCubit.get(context)
                            .pagingController
                            .refresh();
                        Navigator.pop(context);
                      }
                    });
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("عرض"),
                      SizedBox(width: 10),
                      Icon(Icons.search),
                    ],
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    InvoicePdf.print(invoice: invoice);
                    Navigator.pop(context);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("طباعة"),
                      SizedBox(width: 10),
                      Icon(Icons.print),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
