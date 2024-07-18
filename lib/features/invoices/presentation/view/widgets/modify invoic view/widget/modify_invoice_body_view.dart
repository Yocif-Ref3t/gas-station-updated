import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/app_utils/validation.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';
import 'package:gas_station_app/core/theme/fonts.dart';
import 'package:gas_station_app/features/create_invoice/data/model/customer.model.dart';
import 'package:gas_station_app/features/create_invoice/data/model/items_model.dart';
import 'package:gas_station_app/features/create_invoice/presentation/manager/create_cubit.dart';
import 'package:gas_station_app/features/create_invoice/presentation/manager/create_states.dart';
import 'package:gas_station_app/features/create_invoice/presentation/view/create%20invoice%20view/create_invoice_data.dart';
import 'package:gas_station_app/features/create_invoice/presentation/view/create_invoice_details_view.dart';
import 'package:gas_station_app/features/invoices/data/online_invoices/model/invoice_page_details.dart';
import 'package:gas_station_app/features/invoices/presentation/manager/cubit/all_invoice_cubit.dart';
import 'package:gas_station_app/features/invoices/presentation/manager/cubit/all_invoice_states.dart';
import 'package:gas_station_app/features/invoices/presentation/view/widgets/modify%20invoic%20view/widget/modify_invoice_button.dart';
import 'package:gas_station_app/features/invoices/printing/print_invoice.dart';
import 'package:gas_station_app/shared/models/invoice_model.dart';
import 'package:gas_station_app/shared/widgets/autocomplate.dart';
import 'package:gas_station_app/shared/widgets/custom_appbar.dart';
import 'package:gas_station_app/shared/widgets/custom_drop_down.dart';
import 'package:gas_station_app/shared/widgets/custom_snack_bar.dart';
import 'package:gas_station_app/shared/widgets/default_circle_loading_dialog.dart';
import 'package:gas_station_app/shared/widgets/defult_button.dart';
import 'package:gas_station_app/shared/widgets/loading_and_error.dart';
import 'package:gas_station_app/shared/widgets/shimmer_loading/create_invoice_loading.dart';
import 'package:gas_station_app/shared/widgets/text_form_field.dart';
import 'package:go_router/go_router.dart';

class ModifyInvoiceBodyView extends StatefulWidget {
  const ModifyInvoiceBodyView({super.key, required this.invoicePageDetails});
  final InvoicePageDetails invoicePageDetails;

  @override
  State<ModifyInvoiceBodyView> createState() => _ModifyInvoiceBodyViewState();
}

class _ModifyInvoiceBodyViewState extends State<ModifyInvoiceBodyView>
    with CreateInvoiceData {
  bool? isShowTextFeild;
  late final AllInvoicesCubit cubit;
  late final CreateInvoiceCubit createInvoiceCubit;

  @override
  void initState() {
    isShowTextFeild = widget.invoicePageDetails.isShow;
    cubit = AllInvoicesCubit.get(context);
    createInvoiceCubit = CreateInvoiceCubit.get(context);
    createInvoiceCubit.clearInvoiceData();
    createInvoiceCubit.getAllData();
    createInvoiceCubit.invoiceModel = widget.invoicePageDetails.invoiceModel;
    itemName.text = createInvoiceCubit.invoiceModel.product?.nameAr ?? "";
    itemNum.text =
        createInvoiceCubit.invoiceModel.product?.itmNo.toString() ?? "";
    totalNet.text = createInvoiceCubit.invoiceModel.net.toString();
    unitValue = createInvoiceCubit.invoiceModel.product?.unitNmAr;

    super.initState();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController itemName = TextEditingController();
  TextEditingController itemNum = TextEditingController();
  TextEditingController totalNet = TextEditingController();
  String? unitValue;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(
          title: "الفاتورة",
          isShowData: true,
        ),
        body: Column(
          children: [
            BlocListener<AllInvoicesCubit, AllInvoiceState>(
              listener: (context, state) {
                if (state is LoadingDeleteInvoiceState) {
                  DefaultCircleLoading.cicleLoading(context);
                }

                if (state is SuccessDeleteInvoiceState) {
                  // end loading
                  Navigator.pop(context);
                  ShowCustomSnackBar(context).done(message: "تم الحذف بنجاح");
                  // return to  all invoice page and delete from pagination
                  GoRouter.of(context).pop("delete");
                }
                if (state is ErrorDeleteInvoiceState) {
                  // end loading
                  Navigator.pop(context);
                  ShowCustomSnackBar(context).failure(message: state.errorMsg);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                height: 80,
                color: AppColors.primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ModifyInvoiceButton(
                      icon: Icons.print,
                      onTap: () async {
                        // showDialog(
                        //     context: context,
                        //     builder: (BuildContext context) {
                        //       return AlertDialog(
                        //           content: PrintPreview(
                        //               doc: InvoicePdf.generateInvoicePdf(
                        //                   invoice: widget
                        //                       .invoicePageDetails.invoiceModel)));
                        //     });

                        InvoicePdf.print(
                            invoice: widget.invoicePageDetails.invoiceModel);
                      },
                      text: "طباعة",
                    ),
                    ModifyInvoiceButton(
                      icon: Icons.search,
                      onTap: () {
                        setState(() {
                          isShowTextFeild = true;
                        });
                      },
                      text: "عرض",
                    ),
                    ModifyInvoiceButton(
                      icon: Icons.delete,
                      onTap: () {
                        cubit.deleteInvoice(context,
                            docNo:
                                widget.invoicePageDetails.invoiceModel.docNo ??
                                    0);
                      },
                      text: "حذف",
                    ),
                    ModifyInvoiceButton(
                      icon: Icons.edit,
                      onTap: () {
                        setState(() {
                          isShowTextFeild = false;
                        });
                      },
                      text: "تعديل",
                    ),
                  ],
                ),
              ),
            ),
            BlocConsumer<CreateInvoiceCubit, CreateInvoiceState>(
              listener: (context, state) {
                if (state is LoadingUpdateInvoiceState) {
                  DefaultCircleLoading.cicleLoading(context);
                }

                if (state is SuccessUpdateInvoiceState) {
                  // end loading
                  Navigator.pop(context);
                  ShowCustomSnackBar(context).done(message: "تم التعديل بنجاح");
                  // return to  all invoice page and delete from pagination
                  GoRouter.of(context).pop("update");
                }
                if (state is ErrorUpdateInvoiceState) {
                  // end loading
                  Navigator.pop(context);
                  ShowCustomSnackBar(context).failure(message: state.errorMsg);
                }
              },
              builder: (context, state) {
                return Expanded(
                  child: LoadingAndError(
                    isError: state is ErrorGetDataState,
                    isLoading: state is LoadingGetDataState,
                    loadingWidget: const CreateInvoiceLoadingShimmer(),
                    errorText:
                        "يبدو ان هناك خطأ ما برجاء اعادة المحاولة في وقت لاحق",
                    child: Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            //////////////////////////// رقم الفاتورة/////////////////////////////
                            DefaultTextFormField(
                              labelStyle: AppFonts.cairo20B
                                  .copyWith(color: Colors.black54),
                              label: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text("رقم الفاتورة"),
                              ),
                              initialValue:
                                  createInvoiceCubit.invoiceModel.invoiceNo,
                              readOnly: true,
                            ),
                            const SizedBox(height: 15),
                            //////////////////////////// تاريخ الفاتورة/////////////////////////////
                            DefaultTextFormField(
                              labelStyle: AppFonts.cairo20B
                                  .copyWith(color: Colors.black54),
                              label: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text("تاريخ الفاتوره"),
                              ),
                              initialValue:
                                  createInvoiceCubit.invoiceModel.invDate,
                              readOnly: true,
                            ),
                            const SizedBox(height: 16),
                            //////////////////////////// العميل /////////////////////////////
                            isShowTextFeild == true
                                ? DefaultTextFormField(
                                    labelStyle: AppFonts.cairo20B
                                        .copyWith(color: Colors.black54),
                                    label: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Text("العميل"),
                                    ),
                                    initialValue: createInvoiceCubit
                                        .invoiceModel.customerName,
                                    readOnly: true,
                                  )
                                : CustomAutoCompleteTextField<Customer>(
                                    lable: "العميل",
                                    showRequiredStar: false,
                                    initialValue: createInvoiceCubit
                                        .invoiceModel.customerName,
                                    onChanged: (s) {
                                      createInvoiceCubit
                                          .invoiceModel.customerName = s.name;
                                      createInvoiceCubit.invoiceModel
                                          .customerId = s.customerId;
                                    },
                                    itemAsString: (p0) => p0.name ?? "",
                                    function: (s) async =>
                                        createInvoiceCubit.searchInCustomer(s),
                                    validator:
                                        DefaultValidation.defaultValidation,
                                  ),
                            const SizedBox(height: 16),
                            //////////////////////////// رقم الصنف /////////////////////////////
                            DefaultTextFormField(
                              readOnly: isShowTextFeild,
                              validator: DefaultValidation.defaultValidation,
                              keybordType: TextInputType.number,
                              aroundPadding: EdgeInsets.zero,
                              textController: itemNum,
                              labelStyle: AppFonts.cairo20B
                                  .copyWith(color: Colors.black54),
                              label: const Text("رقم الصنف"),
                              onChanged: (s) {
                                createInvoiceCubit.changeItemInInvoiceModel(
                                    number: int.tryParse(s));
                                itemName.text =
                                    createInvoiceCubit.invoiceItem?.name ?? "";
                                setState(() {
                                  unitValue = createInvoiceCubit
                                          .invoiceItem?.unitNmAr ??
                                      "";
                                });
                              },
                            ),
                            const SizedBox(height: 16),
                            //////////////////////////// اختر الصنف /////////////////////////////
                            isShowTextFeild == true
                                ? DefaultTextFormField(
                                    labelStyle: AppFonts.cairo20B
                                        .copyWith(color: Colors.black54),
                                    label: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Text("اختر الصنف"),
                                    ),
                                    initialValue: createInvoiceCubit
                                        .invoiceModel.product?.itemName,
                                    readOnly: true,
                                  )
                                : CustomAutoCompleteTextField<InvoiceItem>(
                                    lable: "اختر الصنف",
                                    controller: itemName,
                                    showRequiredStar: false,
                                    onChanged: (s) {
                                      createInvoiceCubit
                                          .changeItemInInvoiceModel(item: s);
                                      itemNum.text = createInvoiceCubit
                                              .invoiceItem?.itmNo
                                              ?.toString() ??
                                          "";
                                      setState(() {
                                        unitValue = createInvoiceCubit
                                                .invoiceItem?.unitNmAr ??
                                            "";
                                      });
                                    },
                                    itemAsString: (p0) => p0.name ?? "",
                                    function: (s) async => createInvoiceCubit
                                        .searchInInvoiceItem(s),
                                    validator:
                                        DefaultValidation.defaultValidation,
                                  ),
                            const SizedBox(height: 16),
                            //////////////////////////// اختر الوحدة /////////////////////////////

                            isShowTextFeild == true
                                ? DefaultTextFormField(
                                    labelStyle: AppFonts.cairo20B
                                        .copyWith(color: Colors.black54),
                                    label: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Text("الوحدة"),
                                    ),
                                    initialValue: unitValue ?? "  ",
                                    readOnly: true,
                                  )
                                : CustomDropDown(
                                    hint: unitValue ?? "",
                                    onChanged: (value) {},
                                    value: null,
                                    items: getUnitItems(
                                        unitName: createInvoiceCubit
                                            .invoiceItem?.unitNmAr),
                                    // validator:
                                    //     createInvoiceCubit.invoiceModel.product?.unitName ==
                                    //             null
                                    //         ? DefaultValidation
                                    //             .defaultDropDownValidation
                                    //         : null,
                                  ),
                            const SizedBox(height: 16),
                            //////////////////////////// نوع الدفع  /////////////////////////////
                            isShowTextFeild == true
                                ? DefaultTextFormField(
                                    labelStyle: AppFonts.cairo20B
                                        .copyWith(color: Colors.black54),
                                    label: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Text("نوع الدفع"),
                                    ),
                                    initialValue: createInvoiceCubit
                                                .invoiceModel.paymentType ==
                                            1
                                        ? "أجل"
                                        : "نقدي",
                                    readOnly: true,
                                  )
                                : CustomDropDown(
                                    onChanged: (value) {
                                      createInvoiceCubit
                                          .invoiceModel.paymentType = value;
                                    },
                                    hint: createInvoiceCubit
                                                .invoiceModel.paymentType ==
                                            1
                                        ? "أجل"
                                        : "نقدي",
                                    value: null,
                                    items: payTypeItems,
                                  ),
                            const SizedBox(height: 16),
                            ////////////////////////////الوردية /////////////////////////////
                            isShowTextFeild == true
                                ? DefaultTextFormField(
                                    labelStyle: AppFonts.cairo20B
                                        .copyWith(color: Colors.black54),
                                    label: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Text("الوردية"),
                                    ),
                                    initialValue: createInvoiceCubit
                                        .invoiceModel.periodName,
                                    readOnly: true,
                                  )
                                : CustomDropDown(
                                    onChanged: (value) {
                                      createInvoiceCubit.invoiceModel
                                          .periodWorkNumber = value;
                                    },
                                    hint: createInvoiceCubit
                                            .invoiceModel.periodName ??
                                        "",
                                    value: null,
                                    items: shiftItems,
                                  ),
                            const SizedBox(height: 16),
                            //////////////////////////// الكمية /////////////////////////////
                            DefaultTextFormField(
                              readOnly: isShowTextFeild,
                              keybordType: TextInputType.number,
                              initialValue: createInvoiceCubit
                                  .invoiceModel.product?.qty
                                  .toString(),
                              onChanged: (s) {
                                createInvoiceCubit.invoiceModel.product?.qty =
                                    num.tryParse(s);
                                createInvoiceCubit.countTotalNet();
                                totalNet.text = createInvoiceCubit
                                    .invoiceModel.net
                                    .toString();
                              },
                              labelStyle: AppFonts.cairo20B
                                  .copyWith(color: Colors.black54),
                              label: const Text("الكميه"),
                              validator: DefaultValidation.defaultValidation,
                            ),
                            const SizedBox(height: 16),
                            //////////////////////////// السعر /////////////////////////////
                            DefaultTextFormField(
                              readOnly: isShowTextFeild,
                              keybordType: TextInputType.number,
                              initialValue: createInvoiceCubit
                                  .invoiceModel.product?.itmSal
                                  .toString(),
                              onChanged: (s) {
                                createInvoiceCubit.invoiceModel.product
                                    ?.itmSal = num.tryParse(s);
                                createInvoiceCubit.countTotalNet();
                                totalNet.text = createInvoiceCubit
                                    .invoiceModel.net
                                    .toString();
                              },
                              labelStyle: AppFonts.cairo20B
                                  .copyWith(color: Colors.black54),
                              label: const Text("السعر"),
                              validator: DefaultValidation.defaultValidation,
                            ),
                            const SizedBox(height: 16),
                            //////////////////////////// اكراميات /////////////////////////////
                            DefaultTextFormField(
                              readOnly: isShowTextFeild,
                              initialValue: createInvoiceCubit.invoiceModel.tips
                                  .toString(),
                              onChanged: (s) {
                                createInvoiceCubit.invoiceModel.tips =
                                    num.tryParse(s);
                                createInvoiceCubit.countTotalNet();
                                totalNet.text = createInvoiceCubit
                                    .invoiceModel.net
                                    .toString();
                              },
                              keybordType: TextInputType.number,
                              labelStyle: AppFonts.cairo20B
                                  .copyWith(color: Colors.black54),
                              label: const Text("اكراميات"),
                              validator: DefaultValidation.defaultValidation,
                            ),
                            const SizedBox(height: 16),
                            //////////////////////////// الاجمالي /////////////////////////////
                            DefaultTextFormField(
                              readOnly: true,
                              textController: totalNet,
                              labelStyle: AppFonts.cairo20B
                                  .copyWith(color: Colors.black54),
                              label: const Text("الإجمالي"),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            if (isShowTextFeild == false)
                              DefaultButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      createInvoiceCubit.updateInvoice();
                                    }
                                  },
                                  text: "حفظ"),
                            if (isShowTextFeild == false)
                              const SizedBox(
                                height: 16.0,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
