import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';
import 'package:gas_station_app/features/create_invoice/data/end_point/create_invoice_end_point.dart';
import 'package:gas_station_app/features/create_invoice/presentation/manager/create_cubit.dart';
import 'package:gas_station_app/features/create_invoice/presentation/view/create%20invoice%20view/create_invoice_data.dart';
import 'package:gas_station_app/features/invoices/data/online_invoices/repo/all_invoices_repo_impl.dart';
import 'package:gas_station_app/features/invoices/presentation/manager/cubit/all_invoice_states.dart';
import 'package:gas_station_app/shared/models/invoice_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AllInvoicesCubit extends Cubit<AllInvoiceState> {
  AllInvoicesCubit() : super(InitialAllInvoiceState());

  static AllInvoicesCubit get(context) => BlocProvider.of(context);

  int lastPage = 50;
  int pageSize = 20;
  int currentPage = 1;

  int? invoiceNo;

  final PagingController<int, InvoiceModel> pagingController =
      PagingController(firstPageKey: 1);

  getAllInvoices({required int pageNumber}) async {
    final result =
        await AllInvoicesRepoImpl().getAllInvoices(pageNumber: pageNumber);
    if (result != null) {
      if (pageNumber == 1) {
        saveInvoiceNumber(
            int.tryParse(result.allInvoicesList!.first.invoiceNo.toString()));
      }
      return result.allInvoicesList ?? [];
    } else {}

    // emit(LoadingAllInvoiceState());
    // result.fold((failur) {
    //   // emit(ErrorAllInvoiceState(errorMsg: failur.errorMessage));
    //   return [];
    // }, (allInvoicemodel) {
    //   return allInvoicemodel.allInvoicesList ?? [];
    // if (allInvoicemodel.allInvoicesList != []) {
    //   allInvoicesList = allInvoicemodel.allInvoicesList ?? <InvoiceModel>[];
    // }
    // emit(SuccessAllInvoiceState());
    // });
  }

  addPageLisnter() {
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      final allInvoicesList = await getAllInvoices(pageNumber: pageKey);
      final isLastPage = allInvoicesList.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(allInvoicesList);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(allInvoicesList, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  Future<void> close() {
    pagingController.dispose();
    return super.close();
  }

  deleteInvoice(BuildContext context, {required int docNo}) async {
    emit(LoadingDeleteInvoiceState());
    final result = await AllInvoicesRepoImpl().deleteInvoices(docNo: docNo);
    result.fold((failur) {
      emit(ErrorDeleteInvoiceState(errorMsg: failur.errorMessage));
    }, (correct) {
      emit(SuccessDeleteInvoiceState());
    });
  }

  deleteInvoiceFromPaginagtion(BuildContext context, int index) async {
    AllInvoicesCubit.get(context)
        .pagingController
        .value
        .itemList
        ?.removeAt(index);
    emit(DeleteInvoiceFromPaginagtionState());
  }

  int? getInvoiceIndex(BuildContext context) {
    InvoiceModel? model =
        AllInvoicesCubit.get(context).pagingController.value.itemList?.first;
    print(model?.toJson().toString());
    if (model != null) {
      int number = int.parse(model.invoiceNo.toString());
      invoiceNo = number + 1;
      print(invoiceNo);
      return invoiceNo;
    } else {
      return null;
    }
  }

  saveLastInvoiceNumberInDB(BuildContext context) {
    InvoiceModel? model =
        AllInvoicesCubit.get(context).pagingController.value.itemList?.first;

    saveInvoiceNumber(int.tryParse(model!.invoiceNo!)!);
  }
}
