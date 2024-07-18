import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';
import 'package:gas_station_app/features/invoices/presentation/manager/cubit/all_invoice_cubit.dart';
import 'package:gas_station_app/features/invoices/presentation/manager/cubit/all_invoice_states.dart';
import 'package:gas_station_app/features/invoices/presentation/view/widgets/filter_bottom_sheet.dart';
import 'package:gas_station_app/features/invoices/presentation/view/widgets/on_off_invoice/on_off_invoice.dart';
import 'package:gas_station_app/shared/widgets/defult_button.dart';
import 'package:gas_station_app/core/router/app_router.dart';
import 'package:gas_station_app/shared/widgets/error_widget.dart';
import 'package:gas_station_app/shared/widgets/loading_and_error.dart';
import 'package:go_router/go_router.dart';

class InvoicesBodyView extends StatefulWidget {
  const InvoicesBodyView({super.key});

  @override
  State<InvoicesBodyView> createState() => _InvoicesBodyViewState();
}

class _InvoicesBodyViewState extends State<InvoicesBodyView> {
  @override
  void initState() {
    AllInvoicesCubit.get(context).addPageLisnter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllInvoicesCubit, AllInvoiceState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = AllInvoicesCubit.get(context);
        return getInvoiceData()?.branch == null ||
                getInvoiceData()?.store == null ||
                getInvoiceData()?.pump == null
            ? const GetErrorWidget(
                name: 'يجب اختيار الفرع والمستودع والمضخة اولا')
            : RefreshIndicator(
                color: AppColors.primaryColor,
                onRefresh: () async {
                  cubit.pagingController.refresh();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 1,
                            child: DefaultButton(
                              icon: Icons.filter_list,
                              onPressed: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: AppRouter.rootKey.currentContext!,
                                    builder: (BuildContext sheetContext) {
                                      return const FilterBottomSheet();
                                    });
                              },
                              text: "تصنيف حسب",
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            flex: 1,
                            child: DefaultButton(
                              icon: Icons.receipt_long_rounded,
                              onPressed: () {
                                GoRouter.of(context)
                                    .push(
                                  AppRouter.kCreateInvoicesViewPath,
                                )
                                    .then((value) {
                                  if (value == "refresh") {
                                    cubit.pagingController.refresh();
                                  }
                                });
                              },
                              text: "انشاء فاتورة جديدة",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Expanded(child: OnOffInvoice())
                    ],
                  ),
                ),
              );
      },
    );
  }
}
