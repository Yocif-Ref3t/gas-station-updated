import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/app_utils/extension.dart';
import 'package:gas_station_app/core/app_utils/validation.dart';
import 'package:gas_station_app/core/router/app_router.dart';
import 'package:gas_station_app/core/theme/fonts.dart';
import 'package:gas_station_app/features/create_invoice/data/model/customer.model.dart';
import 'package:gas_station_app/features/create_invoice/presentation/manager/create_cubit.dart';
import 'package:gas_station_app/features/create_invoice/presentation/manager/create_states.dart';
import 'package:gas_station_app/features/create_invoice/presentation/view/create%20invoice%20view/create_invoice_data.dart';
import 'package:gas_station_app/shared/models/invoice_model.dart';
import 'package:gas_station_app/shared/widgets/autocomplate.dart';
import 'package:gas_station_app/shared/widgets/defult_button.dart';
import 'package:gas_station_app/shared/widgets/text_form_field.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/router/app_router.dart';
import '../../../../../shared/widgets/custom_drop_down.dart';
import '../../../../../shared/widgets/loading_and_error.dart';
import '../../../../../shared/widgets/shimmer_loading/create_invoice_loading.dart';

class CreateInvoiceViewBody extends StatefulWidget {
  const CreateInvoiceViewBody({super.key});

  @override
  State<CreateInvoiceViewBody> createState() => _CreateInvoiceViewBodyState();
}

class _CreateInvoiceViewBodyState extends State<CreateInvoiceViewBody>
    with CreateInvoiceData {
  DateTime now = DateTime.now();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String paymentWay = "إختر طريقة الدفع";
  String periodWorkNumber = "إختر وردية";
  late final CreateInvoiceCubit cubit;
  @override
  void initState() {
    cubit = CreateInvoiceCubit.get(context);
    cubit.clearInvoiceData();
    cubit.getAllData();
    cubit.invoiceModel.invDate = now.formateDate;
    cubit.invoiceModel.product = Product();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateInvoiceCubit, CreateInvoiceState>(
      listener: (context, state) {},
      builder: (context, state) {
        return LoadingAndError(
          isError: state is ErrorGetDataState,
          isLoading: state is LoadingGetDataState,
          loadingWidget: const CreateInvoiceLoadingShimmer(),
          errorText: "يبدو ان هناك خطأ ما برجاء اعادة المحاولة في وقت لاحق",
          child: Form(
             key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DefaultTextFormField(
                      labelStyle:
                          AppFonts.cairo20B.copyWith(color: Colors.black54),
                      label: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text("تاريخ الفاتوره"),
                      ),
                      initialValue: now.formateDate,
                      readOnly: true,
                    ),
                    const SizedBox(height: 10),
                    CustomAutoCompleteTextField<Customer>(
                        lable: "العميل",
                        showRequiredStar: false,
                        initialValue: cubit.invoiceModel.customerName,
                        onChanged: (s) {
                          cubit.invoiceModel.customerName = s.name;
                          cubit.invoiceModel.customerId = s.customerId;
                        },
                        itemAsString: (p0) => p0.name ?? "",
                        function: (s) async => cubit.searchInCustomer(s), 
                         validator: DefaultValidation.defaultValidation,
                        ),

                    const SizedBox(height: 10),
                    CustomDropDown(
                      onChanged: (value) {
                        cubit.invoiceModel.paymentType = value;
                        setState(() {
                          paymentWay = value == 1 ? "أجل" : "نقدي";
                        });
                      },
                      hint: paymentWay,
                      value: null,
                      items: payTypeItems,
                      validator: DefaultValidation.defaultDropDownValidation,
                    ),
                    const SizedBox(height: 16),
                    CustomDropDown(
                      onChanged: (value) {
                        cubit.invoiceModel.periodWorkNumber = value;
                        setState(() {
                          periodWorkNumber = value == 1201006
                              ? "الورديه  مسائي"
                              : "الورديه  صباحي";
                        });
                      },
                      hint: periodWorkNumber,
                      value: null,
                      items: shiftItems,
                       validator: DefaultValidation.defaultDropDownValidation,
                    ),
                    const SizedBox(height: 84),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultButton(
                          onPressed: () {
                            GoRouter.of(context).push(
                              AppRouter.kAddCustomerViewPath,
                            );
                          },
                          icon: Icons.person_add_alt,
                          text: "إضافة عميل ",
                        ),
                        DefaultButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print(cubit.invoiceModel.toJson().toString());
                              GoRouter.of(context).push(
                                AppRouter.kCreateInvoiceDetailsViewPath,
                              );
                            }
                          },
                          text: "التالي",
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
