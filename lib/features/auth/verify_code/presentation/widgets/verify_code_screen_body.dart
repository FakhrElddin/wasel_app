import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/core/components/custom_text_button.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_images.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';

class VerifyCodeScreenBody extends StatefulWidget {
  const VerifyCodeScreenBody({super.key});

  @override
  State<VerifyCodeScreenBody> createState() => _VerifyCodeScreenBodyState();
}

class _VerifyCodeScreenBodyState extends State<VerifyCodeScreenBody> {
  PinInputController codeController = PinInputController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
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
                      AppStrings.enter6DigitCodeString,
                      style: AppStyles.bold24Text,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  AppStrings.enter6DigitCodeBodyString,
                  style: AppStyles.regular16Text,
                ),
                const SizedBox(height: 50),
                MaterialPinField(
                  length: 6,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  pinController: codeController,
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
                const SizedBox(height: 32),
                CustomTextButton(
                  text: AppStrings.confirmCodeString,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.resetPasswordScreenRoute,
                    );
                    if (formKey.currentState!.validate()) {
                    } else {}
                  },
                ),
                const SizedBox(height: 24),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    AppStrings.enterAnotherEmailString,
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
  }
}
