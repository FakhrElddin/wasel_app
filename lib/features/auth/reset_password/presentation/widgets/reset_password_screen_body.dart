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
import 'package:wasel_app/features/auth/reset_password/presentation/manager/reset_password_cubit.dart';
import 'package:wasel_app/features/auth/reset_password/presentation/manager/reset_password_states.dart';

class ResetPasswordScreenBody extends StatefulWidget {
  const ResetPasswordScreenBody({super.key});

  @override
  State<ResetPasswordScreenBody> createState() =>
      _ResetPasswordScreenBodyState();
}

class _ResetPasswordScreenBodyState extends State<ResetPasswordScreenBody> {
  ResetPasswordCubit viewModel = getIt<ResetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is ResetPasswordErrorState) {
          DialogUtils.showAwSomeDialog(
            context: context,
            title: AppStrings.errorStringCapital,
            description: state.failure.errorMessage,
            dialogType: DialogType.error,
            btnOkOnPress: () {},
          );
        } else if (state is ResetPasswordSuccessState) {
          DialogUtils.showAwSomeDialog(
            context: context,
            title: AppStrings.successStringCapital,
            description: AppStrings.passwordChangedSuccessfullyString,
            dialogType: DialogType.success,
            dismissOnBackKeyPress: false,
            dismissOnTouchOutside: false,
            btnOkOnPress: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.loginScreenRoute,
                (route) => false,
              );
            },
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: viewModel.formKey,
                autovalidateMode: viewModel.autoValidateMode,
                child: Column(
                  children: [
                    Image.asset(AppImages.logoImage, width: 180, height: 180),
                    Text(
                      AppStrings.waselStringCapital,
                      style: AppStyles.bold38Text,
                    ),
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        Text(
                          AppStrings.resetPasswordString,
                          style: AppStyles.bold24Text,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppStrings.resetPasswordBodyString,
                      style: AppStyles.regular16Text,
                    ),
                    const SizedBox(height: 50),
                    CustomTextFormField(
                      controller: viewModel.newPasswordController,
                      textInputAction: TextInputAction.done,
                      labelText: AppStrings.newPasswordString,
                      hintText: AppStrings.newPasswordHintString,
                      validator: AppValidators.validatePassword,
                      isPassword: viewModel.firstIsPassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          viewModel.changeVisibility(
                            isFirstField: true,
                            isPassword: !viewModel.firstIsPassword,
                          );
                        },
                        icon: Icon(
                          viewModel.firstIsPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      controller: viewModel.confirmNewPasswordController,
                      textInputAction: TextInputAction.done,
                      labelText: AppStrings.confirmPasswordString,
                      hintText: AppStrings.confirmPasswordHintString,
                      validator: (value) {
                        return AppValidators.validateConfirmPassword(
                          value,
                          viewModel.newPasswordController.text,
                        );
                      },
                      isPassword: viewModel.secondIsPassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          viewModel.changeVisibility(
                            isFirstField: false,
                            isPassword: !viewModel.secondIsPassword,
                          );
                        },
                        icon: Icon(
                          viewModel.secondIsPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    state is ResetPasswordLoadingState
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : CustomTextButton(
                            text: AppStrings.resetPasswordString,
                            onPressed: () {
                              viewModel.resetPassword(
                                email:
                                    args[AppStrings.emailString.toLowerCase()],
                                resetCode: args[AppStrings.codeString],
                              );
                            },
                          ),
                    const SizedBox(height: 24),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.loginScreenRoute,
                          (route) => false,
                        );
                      },
                      child: Text(
                        AppStrings.backToLoginString,
                        style: AppStyles.regular16Text.copyWith(
                          color: AppColors.greyColor,
                        ),
                      ),
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
