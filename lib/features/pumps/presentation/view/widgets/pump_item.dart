import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/app_utils/extension.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';
import 'package:gas_station_app/core/router/app_router.dart';
import 'package:gas_station_app/core/theme/fonts.dart';
import 'package:gas_station_app/features/layout/presentation/manager/cubit.dart';
import 'package:gas_station_app/features/pumps/data/models/pump_model.dart';
import 'package:gas_station_app/shared/models/invoice_data_model.dart';
import 'package:go_router/go_router.dart';
import 'floating_menu_button.dart';

class PumpItem extends StatelessWidget {
  final PumpModel pump;
  const PumpItem({super.key, required this.pump});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await storeInvoiceData(InvoiceDataModel(pump: pump));
        print(
            "//#########################################################################///");
        print(getInvoiceData()?.branch?.name);
        print(getInvoiceData()?.store?.name);
        print(getInvoiceData()?.pump?.pumpName);
        GoRouter.of(context).push(AppRouter.kInvoicesViewPath);
        BlocProvider.of<LayoutCubit>(context).changeClickTab(2);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            Container(
              height: 100,
              padding: const EdgeInsets.all(8),
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  opacity: 0.5,
                  image: AssetImage("gas1".jpg()),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      FloatingMenuButton(
                        pump: pump,
                      ),
                    ],
                  ),
                  Text(
                    pump.pumpName,
                    style: AppFonts.cairo20B,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
