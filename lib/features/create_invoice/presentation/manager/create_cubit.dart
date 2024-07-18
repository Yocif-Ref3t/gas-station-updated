import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/data_service/failure.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';
import 'package:gas_station_app/features/create_invoice/data/model/customer.model.dart';
import 'package:gas_station_app/features/create_invoice/data/model/items_model.dart';
import 'package:gas_station_app/features/create_invoice/data/repo/create_invoice_repo_impl.dart';
import 'package:gas_station_app/features/create_invoice/presentation/manager/create_states.dart';
import 'package:gas_station_app/features/invoices/presentation/manager/cubit/all_invoice_states.dart';
import 'package:gas_station_app/shared/models/invoice_model.dart';

class CreateInvoiceCubit extends Cubit<CreateInvoiceState> {
  CreateInvoiceCubit() : super(InitialCreateInvoiceState());

  static CreateInvoiceCubit get(context) => BlocProvider.of(context);

  List<Customer> allCustomer = <Customer>[];
  List<InvoiceItem> allIInvoicetems = <InvoiceItem>[];
  InvoiceModel invoiceModel = InvoiceModel();
  // to item select in details page
  InvoiceItem? invoiceItem = InvoiceItem();

  createNewInvoice() async {
    getValueOfAnotherData();
    // invoiceModel.invoiceNo = invoiceNum.toString();


    emit(LoadingCreateInvoiceState());
    final result =
        await CreateInvoiceRepoImpl().createNewInvoice(invoice: invoiceModel);
    result.fold((failur) {
      emit(ErrorCreateInvoiceState());
    }, (createModel) {
      emit(SuccessCreateInvoiceState(invoiceModel: createModel));
    });
  }

  Future getAllCustomer() async {
    final result = await CreateInvoiceRepoImpl().getCustomers();
    result.fold((failur) {
      throw failur;
    }, (customerModel) {
      allCustomer = <Customer>[];
      allCustomer = customerModel.customerList ?? [];
    });
  }

  Future getAllItems() async {
    final result = await CreateInvoiceRepoImpl().getItems();
    result.fold((failur) {
      throw failur;
    }, (itemModel) {
      allIInvoicetems = <InvoiceItem>[];
      allIInvoicetems = itemModel.itemList ?? [];
    });
  }

  getAllData() async {
    emit(LoadingGetDataState());
    await Future.wait([getAllCustomer(), getAllItems()]).then((value) {
      emit(SuccessGetDataState());
    }).catchError((failur) {
      Failure f = failur as Failure;
      emit(ErrorGetDataState(errorMsg: f.errorMessage));
    });
  }

  List<Customer> searchInCustomer(String? customer) {
    if (customer != null) {
      return allCustomer
          .where((element) => element.name!.contains(customer))
          .toList();
    } else {
      return allCustomer;
    }
  }

  List<InvoiceItem> searchInInvoiceItem(String? item) {
    if (item != null) {
      return allIInvoicetems
          .where((element) => element.name!.contains(item))
          .toList();
    } else {
      return allIInvoicetems;
    }
  }

  changeItemInInvoiceModel({int? number, InvoiceItem? item}) {
    if (number != null) {
      final index =
          allIInvoicetems.indexWhere((element) => element.itmNo == number);
      if (index != -1) {
        invoiceItem = allIInvoicetems[index];
      }
    } else if (item != null) {
      invoiceItem = item;
    }
    invoiceModel.product?.itmNo = invoiceItem?.itmNo;
    invoiceModel.product?.itemName = invoiceItem?.name;
    invoiceModel.product?.unitNo = invoiceItem?.unitNo;
    emit(ChangeInvoiceItemState());
  }

  countTotalNet() {
    num qty = invoiceModel.product?.qty ?? 0.0;
    num itemSale = invoiceModel.product?.itmSal ?? 0.0;
    num tips = invoiceModel.tips ?? 0.0;
    invoiceModel.net = (qty * itemSale) + tips;
    emit(CountAllNetInvoiceState());
  }

  clearInvoiceData() {
    invoiceModel = InvoiceModel();
    invoiceItem = InvoiceItem();
    emit(ClearInvoiceDataState());
  }

  getValueOfAnotherData() {
    print("daaaaaaaaaaaaaaaaaaaaaata item ");
    print(invoiceItem?.toJson().toString());
    num itemCost = invoiceItem?.itmCost ?? 0.0;
    num totalQty = invoiceModel.product?.qty ?? 0.0;
    num itemSale = invoiceModel.product?.itmSal ?? 0.0;
    num net = invoiceModel.net ?? 0.0;
    num taxvExtraHdr = invoiceItem?.vatPercent ?? 0.0;

    invoiceModel.delivery = 0.0;
    invoiceModel.product?.vatPercent = invoiceItem?.vatPercent ?? 0.0;
    invoiceModel.product?.taxvExtraHdr = (taxvExtraHdr * net) / 100;
    invoiceModel.product?.totSal = itemSale * totalQty;
    invoiceModel.product?.totalCost = itemCost * totalQty;
    invoiceModel.product?.itmCost = itemCost;
  }

  updateInvoice() async {
    getValueOfAnotherData();

    emit(LoadingUpdateInvoiceState());
    final result = await CreateInvoiceRepoImpl()
        .updateInvoice(invoice: invoiceModel, docNo: invoiceModel.docNo);
    result.fold((failur) {
      emit(ErrorUpdateInvoiceState(errorMsg: failur.errorMessage));
    }, (correct) {
      emit(SuccessUpdateInvoiceState());
    });
  }
}
