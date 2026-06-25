import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_validators.dart';

class CustomPinCodeWidget extends StatelessWidget {
  const CustomPinCodeWidget({
    super.key,
    required this.autoValidateMode,
    required this.codeController,
  });

  final AutovalidateMode? autoValidateMode;
  final PinInputController codeController;

  @override
  Widget build(BuildContext context) {
    return MaterialPinFormField(
      length: 6,
      obscureText: false,
      keyboardType: TextInputType.number,
      pinController: codeController,
      onCompleted: (v) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      validator: (code) {
        return AppValidators.validatePinCode(code, 6);
      },
      autovalidateMode: autoValidateMode,
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
    );
  }
}
