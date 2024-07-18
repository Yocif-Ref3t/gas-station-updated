import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/app_utils/extension.dart';
import 'package:gas_station_app/features/settings/presentation/manage/change%20password%20cubit/change_password_cubit.dart';
import 'package:gas_station_app/shared/widgets/custom_snack_bar.dart';
import 'package:gas_station_app/shared/widgets/defult_button.dart';
import 'package:gas_station_app/shared/widgets/text_form_field.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/fonts.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  TextEditingController password = TextEditingController();
  TextEditingController currentPassword = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordLoading) {
          isLoading = true;
        } else if (state is ChangePasswordSuccess) {
          isLoading = false;
          ShowCustomSnackBar(context).done(message: state.message);
          GoRouter.of(context).pop();
        } else if (state is ChangePasswordFailure) {
          isLoading = false;
          ShowCustomSnackBar(context).failure(message: state.errorMessage);
        }
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "elcaptin_main_logo".png(),
                height: 67,
              ),
              const SizedBox(height: 107),
              Text(
                "تغيير كلمة المرور",
                style: AppFonts.font24SB.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 39),
              DefaultTextFormField(
                textController: currentPassword,
                labelStyle: AppFonts.cairo20B.copyWith(color: Colors.black54),
                label: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("كلمة المرور القديمه"),
                ),
              ),
              const SizedBox(height: 16),
              DefaultTextFormField(
                textController: password,
                labelStyle: AppFonts.cairo20B.copyWith(color: Colors.black54),
                label: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("كلمة المرور الجديده"),
                ),
              ),
              const SizedBox(height: 16),
              DefaultTextFormField(
                textController: passwordConfirmation,
                labelStyle: AppFonts.cairo20B.copyWith(color: Colors.black54),
                label: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("تأكيد كلمة المرور "),
                ),
              ),
              const SizedBox(height: 82),
              Visibility(
                visible: isLoading,
                replacement: DefaultButton(
                  width: double.maxFinite,
                  onPressed: () {
                    BlocProvider.of<ChangePasswordCubit>(context)
                        .changePassword(
                      currentPassword: currentPassword.text,
                      newPassword: password.text,
                      passwordConfirmation: passwordConfirmation.text,
                    );
                  },
                  text: "حفظ",
                ),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
