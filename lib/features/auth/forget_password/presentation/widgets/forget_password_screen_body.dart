import 'package:flutter/material.dart';
import 'package:wasel_app/core/components/custom_text_button.dart';
import 'package:wasel_app/core/components/custom_text_form_field.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_images.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/core/utils/app_validators.dart';

class ForgetPasswordScreenBody extends StatefulWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  State<ForgetPasswordScreenBody> createState() =>
      _ForgetPasswordScreenBodyState();
}

class _ForgetPasswordScreenBodyState extends State<ForgetPasswordScreenBody> {
  static TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: false,
      child: Scaffold(
        body: Padding(
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
                          AppStrings.forgetPasswordString,
                          style: AppStyles.bold24Text,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppStrings.forgetPasswordBodyString,
                      style: AppStyles.regular16Text,
                    ),
                    const SizedBox(height: 50),
                    CustomTextFormField(
                      controller: emailController,
                      textInputAction: TextInputAction.done,
                      labelText: AppStrings.emailString,
                      hintText: AppStrings.emailHintString,
                      textInputType: TextInputType.emailAddress,
                      validator: AppValidators.validateEmail,
                      onFieldSubmitted: (value) {},
                    ),
                    const SizedBox(height: 24),
                    CustomTextButton(
                      text: AppStrings.sendCodeString,
                      onPressed: () {
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
        ),
      ),
    );
  }
}
