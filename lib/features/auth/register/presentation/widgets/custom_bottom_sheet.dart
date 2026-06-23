import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wasel_app/core/components/custom_text_button.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/features/auth/register/presentation/manager/register_cubit.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key, required this.viewModel});

  final RegisterCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppStrings.enter6DigitCodeString, style: AppStyles.bold24Text),
          const SizedBox(height: 8),
          Text(
            AppStrings.enter6DigitCodeBodyString,
            style: AppStyles.regular16Text,
          ),
          const SizedBox(height: 50),
          Center(
            child: MaterialPinField(
              length: 6,
              obscureText: false,
              autoFocus: true,
              keyboardType: TextInputType.number,
              pinController: viewModel.pinController,
              onCompleted: (v) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              theme: MaterialPinTheme(
                shape: MaterialPinShape.outlined,
                cellSize: Size(56, 64),
                borderRadius: BorderRadius.circular(12),
                borderColor: AppColors.greyColor,
                borderWidth: 3,
                focusedBorderColor: AppColors.primaryColor,
                focusedFillColor: AppColors.transparentColor,
                fillColor: AppColors.transparentColor,
                completeBorderColor: AppColors.primaryColor,
                filledFillColor: AppColors.transparentColor,
                filledBorderColor: AppColors.primaryColor,
                cursorColor: AppColors.blackColor,
              ),
            ),
          ),
          const SizedBox(height: 32),
          CustomTextButton(
            text: AppStrings.confirmCodeString,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}