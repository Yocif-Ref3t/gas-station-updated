import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/app_utils/extension.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';
import 'package:gas_station_app/core/router/app_router.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';
import 'package:gas_station_app/features/branches/presentation/manager/cubit/branches_cubit.dart';
import 'package:gas_station_app/features/branches/presentation/manager/cubit/branches_state.dart';
import 'package:gas_station_app/shared/models/invoice_data_model.dart';
import 'package:gas_station_app/shared/widgets/category_item.dart';
import 'package:gas_station_app/shared/widgets/custom_snack_bar.dart';
import 'package:gas_station_app/shared/widgets/error_widget.dart';
import 'package:gas_station_app/shared/widgets/loading_and_error.dart';
import 'package:gas_station_app/shared/widgets/search_field.dart';
import 'package:gas_station_app/shared/widgets/shimmer_loading/branche_and_store_shimmer.dart';
import 'package:go_router/go_router.dart';

class BranchesViewBody extends StatefulWidget {
  const BranchesViewBody({super.key});

  @override
  State<BranchesViewBody> createState() => _BranchesViewBodyState();
}

class _BranchesViewBodyState extends State<BranchesViewBody> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BranchesCubit, BranchesState>(
      listener: (context, state) {
        if (state is ErrorBranches) {
          ShowCustomSnackBar(context).failure(message: state.msgError);
        }
      },
      builder: (context, state) {
        final cubit = BranchesCubit.get(context);
        return RefreshIndicator(
          color: AppColors.primaryColor,
          onRefresh: () async {
            searchController.text = "";
            await cubit.getALLBranches();
          },
          child: LoadingAndError(
            isError: state is ErrorBranches || cubit.branchesList.isEmpty,
            isLoading: state is LoadingBranches,
            loadingWidget: const BranchAndStoreShimmer(),
            child: state is ErrorSearchBranches
                ? const GetErrorWidget(
                    name: "لا يوجد فرع بهذا الاسم",
                  )
                : Column(
                    children: [
                      SearchField(
                          searchController: searchController,
                          onTap: () {
                            if (searchController.text.isNotEmpty) {
                              cubit.searchOfBranch(
                                  searchText: searchController.text);
                            } else {}
                          }),
                      Expanded(
                        child: ListView.builder(
                          itemCount: cubit.branchesList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {
                                await storeInvoiceData(InvoiceDataModel(
                                  branch: cubit.branchesList[index],
                                ));
                                GoRouter.of(context).push(
                                  AppRouter.kStoreViewPath,
                                );
                              },
                              child: CategoryItem(
                                img: "main_branch".jpg(),
                                title: cubit.branchesList[index].name ?? "",
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
