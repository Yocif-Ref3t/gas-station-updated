import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';
import 'package:gas_station_app/features/create_invoice/data/model/items_model.dart';
import 'package:gas_station_app/features/create_invoice/presentation/manager/create_cubit.dart';
import 'package:gas_station_app/features/create_invoice/presentation/manager/create_states.dart';
import 'package:gas_station_app/features/create_invoice/presentation/view/create%20invoice%20view/create_invoice_data.dart';
import 'package:gas_station_app/shared/widgets/autocomplate.dart';
import 'package:gas_station_app/shared/widgets/custom_drop_down.dart';
import 'package:gas_station_app/shared/widgets/custom_snack_bar.dart';
import 'package:gas_station_app/shared/widgets/default_circle_loading_dialog.dart';
import 'package:gas_station_app/shared/widgets/defult_button.dart';
import '../../../../../core/app_utils/validation.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../../shared/widgets/text_form_field.dart';
import '../../../../invoices/printing/print_invoice.dart';

class CreateInvoiceDetailsViewBody extends StatefulWidget {
  const CreateInvoiceDetailsViewBody({super.key});

  @override
  State<CreateInvoiceDetailsViewBody> createState() =>
      _CreateInvoiceDetailsViewBodyState();
}

class _CreateInvoiceDetailsViewBodyState
    extends State<CreateInvoiceDetailsViewBody> with CreateInvoiceData {
  late final CreateInvoiceCubit cubit;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    cubit = BlocProvider.of(context);

    itemName.text = cubit.invoiceItem?.nameAr ?? "";
    itemNum.text = cubit.invoiceItem?.itmNo == null
        ? ""
        : cubit.invoiceItem?.itmNo.toString() ?? "";
    totalNet.text =
        cubit.invoiceModel.net == null ? "" : cubit.invoiceModel.net.toString();
    unitValue = cubit.invoiceItem?.unitNmAr;
    super.initState();
  }

  TextEditingController itemName = TextEditingController();
  TextEditingController itemNum = TextEditingController();
  TextEditingController totalNet = TextEditingController();
  String? unitValue;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateInvoiceCubit, CreateInvoiceState>(
      listener: (context, state) {
        if (state is LoadingCreateInvoiceState) {
          DefaultCircleLoading.cicleLoading(context);
        } else if (state is SuccessCreateInvoiceState) {
          Navigator.pop(context);
          ShowCustomSnackBar(context).done(message: "تم رفع الفاتورة بنجاح");
          Future.delayed(const Duration(milliseconds: 500), () {
            InvoicePdf.print(invoice: state.invoiceModel);
          });
          Navigator.pop(context);
          Navigator.pop(context, "refresh");
        } else if (state is ErrorCreateInvoiceState) {
          Navigator.pop(context);
          ShowCustomSnackBar(context).failure(
              message: "حدث خطا في انشاء الفاتورة الرجاء المحاولة في وقت اخر");
          Future.delayed(const Duration(milliseconds: 500), () {
            InvoicePdf.print(invoice: cubit.invoiceModel);
          });
          Navigator.pop(context);
          Navigator.pop(context, "refresh");
        }
      },
      child: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
             
                const SizedBox(
                  height: 20,
                ),
                DefaultTextFormField(
                  validator: DefaultValidation.defaultValidation,
                  keybordType: TextInputType.number,
                  aroundPadding: EdgeInsets.zero,
                  textController: itemNum,
                  labelStyle: AppFonts.cairo20B.copyWith(color: Colors.black54),
                  label: const Text("رقم الصنف" ),
                  onChanged: (s) {
                    cubit.changeItemInInvoiceModel(number: int.tryParse(s));
                    itemName.text = cubit.invoiceItem?.name ?? "";
                    setState(() {
                      unitValue = cubit.invoiceItem?.unitNmAr ?? "";
                    });
                  },
                ),
                const SizedBox(height: 16),
                CustomAutoCompleteTextField<InvoiceItem>(
                  lable: "اختر الصنف",
                  controller: itemName,
                  showRequiredStar: false,
                  onChanged: (s) {
                    cubit.changeItemInInvoiceModel(item: s);
                    itemNum.text = cubit.invoiceItem?.itmNo?.toString() ?? "";
                    setState(() {
                      unitValue = cubit.invoiceItem?.unitNmAr ?? "";
                    });
                  },
                  itemAsString: (p0) => p0.name ?? "",
                  function: (s) async => cubit.searchInInvoiceItem(s),
                  validator: DefaultValidation.defaultValidation,
                ),
                const SizedBox(height: 16),
                CustomDropDown(
                  hint: unitValue ?? "اختر الوحده",
                  onChanged: (value) {},
                  value: null,
                  items: getUnitItems(unitName: cubit.invoiceItem?.unitNmAr),
                  validator: cubit.invoiceItem?.itmNo == null
                      ? DefaultValidation.defaultDropDownValidation
                      : null,
                ),
                const SizedBox(height: 16),
                DefaultTextFormField(
                  keybordType: TextInputType.number,
                  initialValue: cubit.invoiceModel.product?.qty == null
                      ? ""
                      : cubit.invoiceModel.product?.qty.toString(),
                  onChanged: (s) {
                    cubit.invoiceModel.product?.qty = num.tryParse(s);
                    cubit.countTotalNet();
                    totalNet.text = cubit.invoiceModel.net.toString();
                  },
                  labelStyle: AppFonts.cairo20B.copyWith(color: Colors.black54),
                  label: const Text("الكميه"),
                  validator: DefaultValidation.defaultValidation,
                ),
                const SizedBox(height: 16),
                DefaultTextFormField(
                  keybordType: TextInputType.number,
                  initialValue: cubit.invoiceModel.product?.itmSal == null
                      ? ""
                      : cubit.invoiceModel.product?.itmSal.toString(),
                  onChanged: (s) {
                    cubit.invoiceModel.product?.itmSal = num.tryParse(s);
                    cubit.countTotalNet();
                    totalNet.text = cubit.invoiceModel.net.toString();
                  },
                  labelStyle: AppFonts.cairo20B.copyWith(color: Colors.black54),
                  label: const Text("السعر"),
                  validator: DefaultValidation.defaultValidation,
                ),
                const SizedBox(height: 16),
                DefaultTextFormField(
                  initialValue: cubit.invoiceModel.tips == null
                      ? ""
                      : cubit.invoiceModel.tips.toString(),
                  onChanged: (s) {
                    cubit.invoiceModel.tips = num.tryParse(s);
                    cubit.countTotalNet();
                    totalNet.text = cubit.invoiceModel.net.toString();
                  },
                  keybordType: TextInputType.number,
                  labelStyle: AppFonts.cairo20B.copyWith(color: Colors.black54),
                  label: const Text("اكراميات"),
                  validator: DefaultValidation.defaultValidation,
                ),
                const SizedBox(height: 16),
                DefaultTextFormField(
                  readOnly: true,
                  textController: totalNet,
                  labelStyle: AppFonts.cairo20B.copyWith(color: Colors.black54),
                  label: const Text("الإجمالي"),
                ),
                const SizedBox(height: 50),
                DefaultButton(
                  width: double.maxFinite,
                  onPressed: () {
                    if (unitValue != "اختر الوحده") {
                      if (formkey.currentState!.validate()) {
                        cubit.invoiceModel.invoiceNo = getInvoiceNumber();
                        print(cubit.invoiceModel.toJson().toString());
                        cubit.createNewInvoice();
                      }
                    }
                  },
                  text: "حفظ و طباعة",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
