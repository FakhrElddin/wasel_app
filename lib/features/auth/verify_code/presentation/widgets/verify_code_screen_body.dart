import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/core/components/custom_text_button.dart';
import 'package:wasel_app/core/di/di.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_images.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/core/utils/dialog_utils.dart';
import 'package:wasel_app/features/auth/verify_code/presentation/manager/verify_code_cubit.dart';
import 'package:wasel_app/features/auth/verify_code/presentation/manager/verify_code_states.dart';

class VerifyCodeScreenBody extends StatefulWidget {
  const VerifyCodeScreenBody({super.key});

  @override
  State<VerifyCodeScreenBody> createState() => _VerifyCodeScreenBodyState();
}

class _VerifyCodeScreenBodyState extends State<VerifyCodeScreenBody> {
  VerifyCodeCubit viewModel = getIt<VerifyCodeCubit>();

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return BlocConsumer<VerifyCodeCubit, VerifyCodeStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is VerifyCodeErrorState) {
          DialogUtils.showAwSomeDialog(
            context: context,
            title: AppStrings.errorStringCapital,
            description: state.failure.errorMessage,
            dialogType: DialogType.error,
            btnOkOnPress: () {},
          );
        } else if (state is VerifyCodeSuccessState) {
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.resetPasswordScreenRoute,
            arguments: {
              AppStrings.emailString.toLowerCase() : email,
              AppStrings.codeString : viewModel.codeController.text,
            },
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: SingleChildScrollView(
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
                    pinController: viewModel.codeController,
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
                  state is VerifyCodeLoadingState
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : CustomTextButton(
                          text: AppStrings.confirmCodeString,
                          onPressed: () {
                            viewModel.verifyCode(email: email);
                          },
                        ),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.forgetPasswordScreenRoute,
                      );
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
        );
      },
    );
  }
}
