import 'package:flutter/material.dart';
import 'package:wasel_app/core/components/custom_text_form_field.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_validators.dart';
import 'package:wasel_app/features/auth/login/presentation/manager/login_cubit.dart';

class TextFieldsSection extends StatelessWidget {
  const TextFieldsSection({super.key, required this.viewModel});

  final LoginCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          textInputAction: TextInputAction.next,
          labelText: AppStrings.emailString,
          hintText: AppStrings.emailHintString,
          controller: viewModel.emailController,
          textInputType: TextInputType.emailAddress,
          validator: AppValidators.validateEmail,
        ),
        SizedBox(height: 24),
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
              viewModel.changeVisibility(isPassword: !viewModel.isPassword);
            },
            icon: Icon(
              viewModel.isPassword ? Icons.visibility_off : Icons.visibility,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}