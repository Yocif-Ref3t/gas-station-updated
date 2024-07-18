import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/features/invoices/presentation/manager/cubit/all_invoice_cubit.dart';
import 'package:gas_station_app/features/layout/presentation/manager/sync%20invoice%20cubit/sync_invoice_cubit.dart';
import 'package:gas_station_app/features/layout/presentation/widget/bottom_bar_widget.dart';
import 'package:gas_station_app/shared/widgets/custom_snack_bar.dart';

import 'manager/cubit.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key, required this.child});
  final Widget child;

  @override
  State<LayoutScreen> createState() => LayoutScreenState();
}

class LayoutScreenState extends State<LayoutScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LayoutCubit(),
        ),
        BlocProvider(
          create: (context) => SyncInvoiceCubit()..networkChecker(),
        ),
      ],
      child: SafeArea(
        bottom: false,
        child: BlocListener<SyncInvoiceCubit, SyncInvoiceState>(
          listener: (context, state) {
            if (state is SyncInvoiceLoading) {
              ShowCustomSnackBar(context).warning(
                message: "جاري مزامنة الفواتير المعلقه.....",
              );
            } else if (state is SyncInvoiceSuccess) {
              BlocProvider.of<AllInvoicesCubit>(context)
                  .pagingController
                  .refresh();
              ShowCustomSnackBar(context).done(message: state.message);
            } else if (state is SyncInvoiceFailure) {
              ShowCustomSnackBar(context).failure(message: state.errorMessage);
            }
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            extendBody: true,
            body: widget.child,
            bottomNavigationBar: const BottomBarWidget(),
          ),
        ),
      ),
    );
  }
}
