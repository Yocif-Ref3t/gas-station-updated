import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/features/invoices/presentation/manager/cubit/all_invoice_cubit.dart';
import 'package:gas_station_app/features/invoices/presentation/manager/cubit/all_invoice_states.dart';
import 'package:gas_station_app/features/invoices/presentation/view/widgets/on_off_invoice/widgets/invoice_item.dart';
import 'package:gas_station_app/shared/models/invoice_model.dart';
import 'package:gas_station_app/shared/widgets/error_widget.dart';
import 'package:gas_station_app/shared/widgets/shimmer_loading/all_invoices_shimmer.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class OnlineAllInvoices extends StatefulWidget {
  const OnlineAllInvoices({super.key});

  @override
  State<OnlineAllInvoices> createState() => _OnlineAllInvoicesState();
}

class _OnlineAllInvoicesState extends State<OnlineAllInvoices> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllInvoicesCubit, AllInvoiceState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = AllInvoicesCubit.get(context);
        return PagedListView.separated(
          pagingController: cubit.pagingController,
          separatorBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(),
            );
          },
          builderDelegate: PagedChildBuilderDelegate<InvoiceModel>(
              noItemsFoundIndicatorBuilder: (context) {
                return const GetErrorWidget(
                  name: "لا يوجد بيانات",
                );
              },
              firstPageErrorIndicatorBuilder: (context) {
                return const GetErrorWidget(
                  name: "لا يوجد بيانات",
                );
              },
              firstPageProgressIndicatorBuilder: (context) {
                return const SizedBox(
                    height: double.maxFinite, child: AllInvoicesShimmer());
              },
              newPageProgressIndicatorBuilder: (context) {
                return const SizedBox(
                    height: double.maxFinite, child: AllInvoicesShimmer());
              },
              itemBuilder: (context, item, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InvoiceItem(
                    index: index,
                   invoice: item,
                  ))),
        );
      },
    );
  }
}

