import 'package:flutter/material.dart';
import 'package:wasel_app/core/components/custom_text_button.dart';
import 'package:wasel_app/core/components/custom_text_form_field.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_images.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/core/utils/app_validators.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                    textInputAction: TextInputAction.next,
                    labelText: 'Email',
                    hintText: 'user@gmail.com',
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    validator: AppValidators.validateEmail,
                    onFieldSubmitted: (value) {},
                  ),
                  const SizedBox(height: 24),
                  CustomTextFormField(
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    labelText: 'Password',
                    hintText: 'Enter Your Password',
                    controller: passwordController,
                    validator: AppValidators.validate,
                    isPassword: true,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.visibility_off,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      if (emailController.text.trim().isEmpty ||
                          passwordController.text.trim().isEmpty) {
                      } else {}
                    },
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forget password?',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 8),
                  CustomTextButton(
                    text: 'Log In',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 18),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'sign up',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.primaryColor,
                          ),
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
