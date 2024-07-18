import 'package:flutter/material.dart';
import 'package:gas_station_app/features/add%20customer/presentation/view/add_customer_view.dart';
import 'package:gas_station_app/features/auth/presentation/view/login_view.dart';
import 'package:gas_station_app/features/branches/presentation/branches_view.dart';
import 'package:gas_station_app/features/create_invoice/presentation/view/create_invoice_details_view.dart';
import 'package:gas_station_app/features/invoices/data/online_invoices/model/invoice_page_details.dart';
import 'package:gas_station_app/features/invoices/presentation/view/invoices_view.dart';
import 'package:gas_station_app/features/invoices/presentation/view/modify_invoice_view.dart';
import 'package:gas_station_app/features/layout/presentation/layout.dart';
import 'package:gas_station_app/features/pumps/presentation/view/pumps_view.dart';
import 'package:gas_station_app/features/settings/presentation/view/change_password__view.dart';
import 'package:gas_station_app/features/settings/presentation/view/profile_view.dart';
import 'package:gas_station_app/features/settings/presentation/view/settings_view.dart';
import 'package:gas_station_app/features/store/presentation/view/store_view.dart';
import 'package:go_router/go_router.dart';
import '../../features/create_invoice/presentation/view/create_invoices_view.dart';
import '../../features/settings/presentation/view/profile_details_view.dart';
import '../../features/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  //Global Key
  static GlobalKey<NavigatorState> rootKey =
      GlobalKey<NavigatorState>(debugLabel: "rootkey");
  static GlobalKey<NavigatorState> mobileKey =
      GlobalKey<NavigatorState>(debugLabel: "mobileKey");
  static const kLoginViewPath = "/LoginViewPath";
  static const kHomeViewPath = "/HomeViewPath";
  static const kPumpsViewPath = "/PumpsViewPath";
  static const kBranchesViewPath = "/BranchesViewPath";
  static const kStoreViewPath = "/StoreViewPath";
  static const kInvoicesViewPath = "/InvoicesViewPath";
  static const kCreateInvoicesViewPath = "/CreateInvoicesViewPath";
  static const kCreateInvoiceDetailsViewPath = "/CreateInvoiceDetailsViewPath";
  static const kModifyInvoiceViewPath = "/kModifyInvoiceViewPath";
  static const kAddCustomerViewPath = "/AddCustomerViewPath";
  static const kSettingsViewPath = "/SettingsViewPath";
  static const kChangePasswordViewPath = "/ChangePasswordViewPath";
  static const kProfileViewPath = "/ProfileViewPath";
  static const kProfileDetailsViewPath = "/ProfileDetailsViewPath";
  static final router = GoRouter(
    navigatorKey: rootKey,
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginViewPath,
        builder: (context, state) => const EmailLoginView(),
      ),
      ShellRoute(
          navigatorKey: mobileKey,
          builder: (context, state, child) => LayoutScreen(
                child: child,
              ),
          routes: [
            GoRoute(
                parentNavigatorKey: mobileKey,
                path: kBranchesViewPath,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: BranchesView())),
            GoRoute(
                parentNavigatorKey: mobileKey,
                path: kStoreViewPath,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: StoreView())),
            GoRoute(
                parentNavigatorKey: mobileKey,
                path: kPumpsViewPath,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: PumpsView())),
            GoRoute(
                parentNavigatorKey: mobileKey,
                path: kInvoicesViewPath,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: InvoicesView())),
            GoRoute(
                parentNavigatorKey: mobileKey,
                path: kSettingsViewPath,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SettingsView())),
          ]),
      GoRoute(
          path: kCreateInvoicesViewPath,
          pageBuilder: (context, state) => const NoTransitionPage(child: CreateInvoiceView())),
      GoRoute(
        path: kCreateInvoiceDetailsViewPath,
        pageBuilder: (context, state) => const NoTransitionPage(child: CreateInvoiceDetailsView()),
      ),
      GoRoute(
        path: kModifyInvoiceViewPath,
        builder: (context, state) => ModifyInvoiceView(
          invoicePageDetails: state.extra as InvoicePageDetails,
        ),
      ),
      GoRoute(
        path: kAddCustomerViewPath,
        builder: (context, state) => const AddCustomerView(),
      ),
      GoRoute(
        path: kChangePasswordViewPath,
        builder: (context, state) => const ChangePasswordView(),
      ),
      GoRoute(
        path: kProfileViewPath,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kProfileDetailsViewPath,
        builder: (context, state) => const ProfileDetailsView(),
      ),
    ],
  );
}
