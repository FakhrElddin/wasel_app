import 'package:flutter/material.dart';
import 'package:wasel_app/core/components/custom_text_button.dart';
import 'package:wasel_app/core/components/custom_text_form_field.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_images.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/core/utils/app_validators.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: false,
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
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
                    controller: nameController,
                    textInputAction: TextInputAction.next,
                    labelText: 'Name',
                    hintText: 'Enter Your Name',
                    textInputType: TextInputType.name,
                    validator: AppValidators.validateUsername,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                    textInputType: TextInputType.emailAddress,
                    validator: AppValidators.validateEmail,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    labelText: 'Password',
                    hintText: 'Enter Password',
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
                    controller: confirmPasswordController,
                    textInputAction: TextInputAction.done,
                    labelText: 'Confirm Password',
                    hintText: 'Enter Same Password',
                    validator: (value) {
                      AppValidators.validateConfirmPassword(
                        value,
                        passwordController.text,
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
                    onFieldSubmitted: (value) {
                      if (nameController.text.trim().isEmpty ||
                          emailController.text.trim().isEmpty ||
                          passwordController.text.trim().isEmpty ||
                          confirmPasswordController.text.trim().isEmpty) {
                      } else {
                        if (formKey.currentState!.validate()) {}
                      }
                    },
                  ),
                  const SizedBox(height: 32),
                  CustomTextButton(
                    text: 'Register',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                      } else {}
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Have account?',
                        style: AppStyles.regular18Text.copyWith(
                          color: AppColors.blackColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login Now',
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
      ),
    );
  }
}
