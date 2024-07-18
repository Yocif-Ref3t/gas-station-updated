import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas_station_app/core/theme/app_colors.dart';
import 'package:gas_station_app/core/theme/fonts.dart';
import 'package:gas_station_app/features/auth/presentation/manage/login%20cubit/login_cubit.dart';
import 'package:gas_station_app/shared/widgets/defult_button.dart';
import 'package:gas_station_app/shared/widgets/text_form_field.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/app_utils/validation.dart';
import '../../../../../../core/router/app_router.dart';
import '../../../../../../shared/widgets/custom_snack_bar.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is LoginFailure) {
          isLoading = false;
          setState(() {});
          ShowCustomSnackBar(context).failure(message: state.errorMessage);
        } else if (state is LoginSuccess) {
          isLoading = false;
          setState(() {});
          GoRouter.of(context).go(AppRouter.kBranchesViewPath);
        }
      },
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Center(
                child: Image.asset(
                  "assets/images/elcaptin_main_logo.png",
                  height: 70,
                ),
              ),
              const Spacer(flex: 1),
              DefaultTextFormField(
                validator: DefaultValidation.defaultEmailValidation,
                hintText: "ادخل البريد الالكتروني",
                borderRadius: 10,
                textController: email,
              ),
              const SizedBox(height: 16),
              DefaultTextFormField(
                validator: DefaultValidation.defaultPasswordValidation,
                hintText: "ادخل كلمة المرور",
                borderRadius: 10,
                textController: password,
              ),
              const SizedBox(height: 16),
              Visibility(
                visible: isLoading,
                replacement: DefaultButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<LoginCubit>(context).login(
                        email: email.text,
                        password: password.text,
                      );
                    }
                  },
                  radius: 10,
                  width: double.maxFinite,
                  height: 55,
                  text: "دخول",
                  textStyle: AppFonts.font24SB,
                ),
                child: const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                )),
              ),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
