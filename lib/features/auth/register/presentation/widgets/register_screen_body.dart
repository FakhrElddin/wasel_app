import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/components/custom_text_button.dart';
import 'package:wasel_app/core/components/custom_text_form_field.dart';
import 'package:wasel_app/core/di/di.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_images.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/core/utils/app_validators.dart';
import 'package:wasel_app/core/utils/bottom_sheet_utils.dart';
import 'package:wasel_app/core/utils/dialog_utils.dart';
import 'package:wasel_app/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:wasel_app/features/auth/register/presentation/manager/register_states.dart';

import 'verify_otp_bottom_sheet.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  var viewModel = getIt<RegisterCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterErrorState) {
          DialogUtils.showAwSomeDialog(
            context: context,
            title: AppStrings.errorStringCapital,
            description: state.failure.errorMessage,
            dialogType: DialogType.error,
            btnOkOnPress: () {},
          );
        } else if (state is RegisterSuccessState) {
          BottomSheetUtils.showBottomSheet(
            context: context,
            widget: VerifyOtpBottomSheet(viewModel: viewModel),
          );
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
                      controller: viewModel.nameController,
                      textInputAction: TextInputAction.next,
                      labelText: AppStrings.nameString,
                      hintText: AppStrings.nameHintString,
                      textInputType: TextInputType.name,
                      validator: AppValidators.validateUsername,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      controller: viewModel.emailController,
                      textInputAction: TextInputAction.next,
                      labelText: AppStrings.emailString,
                      hintText: AppStrings.emailHintString,
                      textInputType: TextInputType.emailAddress,
                      validator: AppValidators.validateEmail,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      controller: viewModel.passwordController,
                      textInputAction: TextInputAction.done,
                      labelText: AppStrings.passwordString,
                      hintText: AppStrings.passwordHintString,
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
                      controller: viewModel.confirmPasswordController,
                      textInputAction: TextInputAction.done,
                      labelText: AppStrings.confirmPasswordString,
                      hintText: AppStrings.confirmPasswordHintString,
                      validator: (value) {
                        return AppValidators.validateConfirmPassword(
                          value,
                          viewModel.passwordController.text,
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
                    const SizedBox(height: 32),
                    state is RegisterLoadingState
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : CustomTextButton(
                            text: AppStrings.registerString,
                            onPressed: () {
                              viewModel.register();
                            },
                          ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.haveAccountString,
                          style: AppStyles.regular18Text.copyWith(
                            color: AppColors.blackColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            AppStrings.loginNowString,
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
