import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/core/components/custom_text_button.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/dialog_utils.dart';
import 'package:wasel_app/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:wasel_app/features/auth/register/presentation/manager/register_states.dart';
import 'package:wasel_app/features/auth/register/presentation/widgets/verify_otp_bottom_sheet_hint_section.dart';
import 'package:wasel_app/features/auth/verify_code/presentation/widgets/custom_pin_code_widget.dart';

class VerifyOtpBottomSheet extends StatelessWidget {
  const VerifyOtpBottomSheet({super.key, required this.viewModel});

  final RegisterCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is VerifyOtpErrorState) {
          DialogUtils.showAwSomeDialog(
            context: context,
            title: AppStrings.errorStringCapital,
            description: state.failure.errorMessage,
            dialogType: DialogType.error,
            btnOkOnPress: () {},
          );
        } else if (state is VerifyOtpSuccessState) {
          DialogUtils.showAwSomeDialog(
            context: context,
            title: AppStrings.successStringCapital,
            description: AppStrings.accountCreatedSuccessfullyString,
            dialogType: DialogType.success,
            dismissOnTouchOutside: false,
            dismissOnBackKeyPress: false,
            btnOkOnPress: () {
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.loginScreenRoute,
              );
            },
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: viewModel.verifyOtpFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                VerifyOtpBottomSheetHintSection(),
                const SizedBox(height: 50),
                Center(
                  child: CustomPinCodeWidget(
                    autoValidateMode: viewModel.verifyOtpAutoValidateMode,
                    codeController: viewModel.pinController,
                  ),
                ),
                const SizedBox(height: 32),
                state is VerifyOtpLoadingState
                    ? Center(child: CircularProgressIndicator())
                    : CustomTextButton(
                        text: AppStrings.confirmCodeString,
                        onPressed: () {
                          viewModel.verifyOtp();
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
