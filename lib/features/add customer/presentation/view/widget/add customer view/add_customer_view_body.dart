import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/features/add%20customer/presentation/manage/add%20customer%20cubit/add_customer_cubit.dart';
import 'package:gas_station_app/features/create_invoice/presentation/manager/create_cubit.dart';
import 'package:gas_station_app/shared/widgets/custom_snack_bar.dart';
import 'package:gas_station_app/shared/widgets/default_circle_loading_dialog.dart';
import 'package:gas_station_app/shared/widgets/defult_button.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/theme/fonts.dart';
import '../../../../../../shared/widgets/text_form_field.dart';

class AddCustomerViewBody extends StatefulWidget {
  const AddCustomerViewBody({super.key});

  @override
  State<AddCustomerViewBody> createState() => _AddCustomerViewBodyState();
}

class _AddCustomerViewBodyState extends State<AddCustomerViewBody> {
  TextEditingController clientName = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController email = TextEditingController();
  bool isLoading = false;
  late CreateInvoiceCubit invoiceCubit;
  @override
  void initState() {
    invoiceCubit = BlocProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCustomerCubit, AddCustomerState>(
      listener: (context, state) {
        if (state is AddCustomerLoading) {
          isLoading = true;
          DefaultCircleLoading.cicleLoading(context);
        } else if (state is AddCustomerSuccess) {
          isLoading = false;
          Navigator.pop(context);
          invoiceCubit.allCustomer.add(state.customerModel);
          ShowCustomSnackBar(context).done(message: "تم اضافة العميل بنجاح");
        } else if (state is AddCustomerFailure) {
          isLoading = false;
          Navigator.pop(context);
          ShowCustomSnackBar(context).failure(message: state.errorMessage);
        }
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DefaultTextFormField(
                textController: clientName,
                labelStyle: AppFonts.cairo20B.copyWith(color: Colors.black54),
                label: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("اسم العميل"),
                ),
              ),
              const SizedBox(height: 16),
              DefaultTextFormField(
                textController: phoneNo,
                labelStyle: AppFonts.cairo20B.copyWith(color: Colors.black54),
                label: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("رقم الهاتف"),
                ),
              ),
              const SizedBox(height: 16),
              DefaultTextFormField(
                textController: email,
                labelStyle: AppFonts.cairo20B.copyWith(color: Colors.black54),
                label: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("البريد الإلكتروني"),
                ),
              ),
              // const SizedBox(height: 16),
              // DefaultTextFormField(
              //   labelStyle: AppFonts.cairo20B.copyWith(color: Colors.black54),
              //   label: const Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 20),
              //     child: Text("العنوان"),
              //   ),
              // ),
              // const SizedBox(height: 16),
              // DefaultTextFormField(
              //   labelStyle: AppFonts.cairo20B.copyWith(color: Colors.black54),
              //   label: const Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 20),
              //     child: Text("مرجع"),
              //   ),
              // ),
              // const SizedBox(height: 16),
              // DefaultTextFormField(
              //   labelStyle: AppFonts.cairo20B.copyWith(color: Colors.black54),
              //   label: const Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 20),
              //     child: Text("الرقم الضريبي"),
              //   ),
              // ),
              // const SizedBox(height: 16),
              // DefaultTextFormField(
              //   labelStyle: AppFonts.cairo20B.copyWith(color: Colors.black54),
              //   label: const Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 20),
              //     child: Text("الدوله"),
              //   ),
              // ),
              // const SizedBox(height: 16),
              // DefaultTextFormField(
              //   labelStyle: AppFonts.cairo20B.copyWith(color: Colors.black54),
              //   label: const Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 20),
              //     child: Text("المدينه"),
              //   ),
              // ),
              // const SizedBox(height: 16),
              // DefaultTextFormField(
              //   labelStyle: AppFonts.cairo20B.copyWith(color: Colors.black54),
              //   label: const Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 20),
              //     child: Text("المنطقه"),
              //   ),
              // ),
              const SizedBox(height: 16),
              // const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    text: "رجوع",
                  ),
                  DefaultButton(
                    onPressed: () {
                      BlocProvider.of<AddCustomerCubit>(context).addCustomer(
                        name: clientName.text,
                        email: email.text,
                        phone: phoneNo.text,
                      );
                    },
                    text: "إضافه",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
