import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/core/components/custom_text_button.dart';
import 'package:wasel_app/core/di/di.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/core/utils/dialog_utils.dart';
import 'package:wasel_app/features/auth/login/presentation/widgets/logo_section.dart';
import 'package:wasel_app/features/auth/verify_code/presentation/manager/verify_code_cubit.dart';
import 'package:wasel_app/features/auth/verify_code/presentation/manager/verify_code_states.dart';
import 'package:wasel_app/features/auth/verify_code/presentation/widgets/custom_pin_code_widget.dart';
import 'package:wasel_app/features/auth/verify_code/presentation/widgets/verify_code_hint_section.dart';

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
        return Form(
          key: viewModel.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LogoSection(),
                    const SizedBox(height: 50),
                    VerifyCodeHintSection(),
                    const SizedBox(height: 50),
                    CustomPinCodeWidget(
                      codeController: viewModel.codeController,
                      autoValidateMode: viewModel.autoValidateMode,
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
          ),
        );
      },
    );
  }
}
