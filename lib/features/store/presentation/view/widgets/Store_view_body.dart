import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/app_utils/extension.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';
import 'package:gas_station_app/core/router/app_router.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';
import 'package:gas_station_app/features/layout/presentation/manager/cubit.dart';
import 'package:gas_station_app/features/store/presentation/manager/cubit/store_cubit.dart';
import 'package:gas_station_app/features/store/presentation/manager/cubit/store_state.dart';
import 'package:gas_station_app/shared/models/invoice_data_model.dart';
import 'package:gas_station_app/shared/widgets/category_item.dart';
import 'package:gas_station_app/shared/widgets/custom_snack_bar.dart';
import 'package:gas_station_app/shared/widgets/error_widget.dart';
import 'package:gas_station_app/shared/widgets/loading_and_error.dart';
import 'package:gas_station_app/shared/widgets/search_field.dart';
import 'package:gas_station_app/shared/widgets/shimmer_loading/branche_and_store_shimmer.dart';
import 'package:go_router/go_router.dart';

class StoreViewBody extends StatefulWidget {
  const StoreViewBody({super.key});

  @override
  State<StoreViewBody> createState() => _StoreViewBodyState();
}

class _StoreViewBodyState extends State<StoreViewBody> {
  TextEditingController searchController = TextEditingController();
  late LayoutCubit layoutCubit;

  @override
  void initState() {
    layoutCubit = BlocProvider.of<LayoutCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit, StoresState>(
      listener: (context, state) {
        if (state is ErrorStores) {
          ShowCustomSnackBar(context).failure(message: state.msgError);
        }
      },
      builder: (context, state) {
        final cubit = StoreCubit.get(context);
        return RefreshIndicator(
          color: AppColors.primaryColor,
          onRefresh: () async {
            searchController.text = "";
            await cubit.getAllStoress();
          },
          child: LoadingAndError(
            isError: state is ErrorStores || cubit.storesList.isEmpty,
            isLoading: state is LoadingStores,
            loadingWidget: const BranchAndStoreShimmer(),
            child: state is ErrorSearchStores
                ? const GetErrorWidget(
                    name: "لا يوجد مستودع بهذا الاسم",
                  )
                : Column(
                    children: [
                      SearchField(
                        searchController: searchController,
                        onTap: () {
                          if (searchController.text.isNotEmpty) {
                            cubit.searchOfStore(
                                searchText: searchController.text);
                          } else {}
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 70.0),
                          child: ListView.builder(
                            itemCount: cubit.storesList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  await storeInvoiceData(InvoiceDataModel(
                                    store: cubit.storesList[index],
                                  ));
                                  ShowCustomSnackBar(context).done(
                                    message: "تم اختيار الفرع والمستودع بنجاح",
                                  );
                                  layoutCubit.changeClickTab(1);
                                  GoRouter.of(context).push(
                                    AppRouter.kPumpsViewPath,
                                  );
                                },
                                child: CategoryItem(
                                  img: "warehouse".jpg(),
                                  title: cubit.storesList[index].name ?? "",
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}
