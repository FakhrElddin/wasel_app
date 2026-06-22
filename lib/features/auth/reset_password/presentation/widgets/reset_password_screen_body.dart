import 'package:flutter/material.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/core/components/custom_text_button.dart';
import 'package:wasel_app/core/components/custom_text_form_field.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_images.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/core/utils/app_validators.dart';

class ResetPasswordScreenBody extends StatefulWidget {
  const ResetPasswordScreenBody({super.key});

  @override
  State<ResetPasswordScreenBody> createState() =>
      _ResetPasswordScreenBodyState();
}

class _ResetPasswordScreenBodyState extends State<ResetPasswordScreenBody> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
                      AppStrings.resetPasswordString,
                      style: AppStyles.bold24Text
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
                  controller: newPasswordController,
                  textInputAction: TextInputAction.done,
                  labelText: AppStrings.newPasswordString,
                  hintText: AppStrings.newPasswordHintString,
                  validator: AppValidators.validatePassword,
                  isPassword: true,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.visibility_off,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  controller: confirmNewPasswordController,
                  textInputAction: TextInputAction.done,
                  labelText: AppStrings.confirmPasswordString,
                  hintText: AppStrings.confirmPasswordHintString,
                  validator: (value) {
                    AppValidators.validateConfirmPassword(
                      value,
                      confirmNewPasswordController.text,
                    );
                  },
                  isPassword: true,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.visibility_off,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  onFieldSubmitted: (value) {},
                ),
                const SizedBox(height: 24),
                CustomTextButton(
                  text: AppStrings.resetPasswordString,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                    } else {}
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
  }
}
