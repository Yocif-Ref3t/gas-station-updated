import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/router/app_router.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';
import 'package:gas_station_app/core/theme/app_theme.dart';
import 'package:gas_station_app/features/create_invoice/presentation/manager/create_cubit.dart';
import 'package:gas_station_app/features/invoices/presentation/manager/cubit/all_invoice_cubit.dart';
import 'package:gas_station_app/features/pumps/data/models/pump_model.dart';
import 'package:gas_station_app/features/pumps/data/models/pump_type.dart';
import 'package:gas_station_app/shared/models/branch_model.dart';
import 'package:gas_station_app/shared/models/invoice_data_model.dart';
import 'package:gas_station_app/shared/models/invoice_model.dart';
import 'package:gas_station_app/shared/models/store_model.dart';
import 'package:gas_station_app/shared/models/user_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/constans/boxs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(BranchModelAdapter());
  Hive.registerAdapter(StoreModelAdapter());
  Hive.registerAdapter(InvoiceDataModelAdapter());
  Hive.registerAdapter(PumpModelAdapter());
  Hive.registerAdapter(PumpTypeAdapter());
  Hive.registerAdapter(InvoiceModelAdapter());
  Hive.registerAdapter(CompanyAdapter());
  Hive.registerAdapter(SalesmanAdapter());
  Hive.registerAdapter(ProductAdapter());
  await Hive.openBox<UserModel>(kUserBox);
  await Hive.openBox<BranchModel>(kBranchBox);
  await Hive.openBox<StoreModel>(kStoreBox);
  await Hive.openBox<InvoiceDataModel>(kInvoiceDataBox);
  await Hive.openBox<InvoiceModel>(kOfflineInvoiceBox);
  await Hive.openBox<int>(kInvoiceNumber);
  // localLogout();
  runApp(const GasStationApp());
}

class GasStationApp extends StatelessWidget {
  const GasStationApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AllInvoicesCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => CreateInvoiceCubit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.appTheme(),
      ),
    );
  }
}

// bloc observer
class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent -- ${bloc.runtimeType} -- $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType} -- $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition -- ${bloc.runtimeType} -- $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType} -- $error -- $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    print('onClose -- ${bloc.runtimeType}');
    super.onClose(bloc);
  }
}
