import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/core/components/custom_text_button.dart';
import 'package:wasel_app/core/components/custom_text_form_field.dart';
import 'package:wasel_app/core/di/di.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_images.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/core/utils/app_validators.dart';
import 'package:wasel_app/core/utils/dialog_utils.dart';
import 'package:wasel_app/features/auth/forget_password/presentation/manager/forget_password_cubit.dart';
import 'package:wasel_app/features/auth/forget_password/presentation/manager/forget_password_states.dart';

class ForgetPasswordScreenBody extends StatefulWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  State<ForgetPasswordScreenBody> createState() =>
      _ForgetPasswordScreenBodyState();
}

class _ForgetPasswordScreenBodyState extends State<ForgetPasswordScreenBody> {
  ForgetPasswordCubit viewModel = getIt<ForgetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is ForgetPasswordErrorState) {
          DialogUtils.showAwSomeDialog(
            context: context,
            title: AppStrings.errorStringCapital,
            description: state.failure.errorMessage,
            dialogType: DialogType.error,
            btnOkOnPress: (){},
          );
        } else if (state is ForgetPasswordSuccessState) {
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.verifyCodeScreenRoute,
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: viewModel.formKey,
                autovalidateMode: viewModel.autoValidateMode,
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
                      controller: viewModel.emailController,
                      textInputAction: TextInputAction.done,
                      labelText: AppStrings.emailString,
                      hintText: AppStrings.emailHintString,
                      textInputType: TextInputType.emailAddress,
                      validator: AppValidators.validateEmail,
                    ),
                    const SizedBox(height: 24),
                    state is ForgetPasswordLoadingState ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                        : CustomTextButton(
                      text: AppStrings.sendCodeString,
                      onPressed: () {
                        viewModel.forgetPassword();
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
        );
      },
    );
  }
}
