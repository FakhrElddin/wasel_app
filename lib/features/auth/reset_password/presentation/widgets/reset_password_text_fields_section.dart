import 'package:flutter/material.dart';
import 'package:wasel_app/core/components/custom_text_form_field.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_validators.dart';
import 'package:wasel_app/features/auth/reset_password/presentation/manager/reset_password_cubit.dart';

class ResetPasswordTextFieldsSection extends StatelessWidget {
  const ResetPasswordTextFieldsSection({super.key, required this.viewModel});

  final ResetPasswordCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        )
      ],
    );
  }
}
