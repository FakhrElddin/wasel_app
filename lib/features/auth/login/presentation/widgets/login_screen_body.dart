import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/core/components/custom_text_button.dart';
import 'package:wasel_app/core/components/custom_text_form_field.dart';
import 'package:wasel_app/core/di/di.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_images.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/core/utils/app_validators.dart';
import 'package:wasel_app/core/utils/dialog_utils.dart';
import 'package:wasel_app/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:wasel_app/features/auth/login/presentation/manager/login_states.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  LoginCubit viewModel = getIt<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginErrorState) {
          DialogUtils.showAwSomeDialog(
            context: context,
            title: AppStrings.errorStringCapital,
            description: state.failure.errorMessage,
            dialogType: DialogType.error,
            btnOkOnPress: (){},
          );
        } else if (state is LoginSuccessState){
          // navigate to home
        }
      },
      builder: (context, state) {
        return Form(
          key: viewModel.formKey,
          autovalidateMode: viewModel.autoValidateMode,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Image.asset(AppImages.logoImage, width: 180, height: 180),
                    Text(
                      AppStrings.waselStringCapital,
                      style: AppStyles.bold38Text,
                    ),
                    const SizedBox(height: 50),
                    CustomTextFormField(
                      textInputAction: TextInputAction.next,
                      labelText: AppStrings.emailString,
                      hintText: AppStrings.emailHintString,
                      controller: viewModel.emailController,
                      textInputType: TextInputType.emailAddress,
                      validator: AppValidators.validateEmail,
                    ),
                    const SizedBox(height: 24),
                    CustomTextFormField(
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      labelText: AppStrings.passwordString,
                      hintText: AppStrings.passwordHintString,
                      controller: viewModel.passwordController,
                      validator: AppValidators.validate,
                      isPassword: viewModel.isPassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          viewModel.changeVisibility(
                            isPassword: !viewModel.isPassword,
                          );
                        },
                        icon: Icon(
                          viewModel.isPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.forgetPasswordScreenRoute,
                        );
                        viewModel.clearFields();
                      },
                      child: Text(
                        AppStrings.forgetPasswordButtonString,
                        style: AppStyles.regular16Text.copyWith(
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    state is LoginLoadingState ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                        : CustomTextButton(
                      text: AppStrings.loginString,
                      onPressed: () {
                        viewModel.login();
                      },
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.dontHaveAnAccountString,
                          style: AppStyles.regular18Text.copyWith(
                            color: AppColors.blackColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.registerScreenRoute,
                            );
                          },
                          child: Text(
                            AppStrings.signupString,
                            style: AppStyles.regular18Text,
                          ),
                        ),
                      ],
                    ),
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
