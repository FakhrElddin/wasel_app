import 'package:flutter/material.dart';
import 'package:wasel_app/core/components/custom_text_form_field.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_validators.dart';
import 'package:wasel_app/features/auth/register/presentation/manager/register_cubit.dart';

class RegisterTextFieldsSection extends StatelessWidget {
  const RegisterTextFieldsSection({super.key, required this.viewModel});

  final RegisterCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        )
      ],
    );
  }
}
