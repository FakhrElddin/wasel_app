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
import 'package:wasel_app/features/auth/reset_password/presentation/manager/reset_password_cubit.dart';
import 'package:wasel_app/features/auth/reset_password/presentation/manager/reset_password_states.dart';
import 'package:wasel_app/features/auth/reset_password/presentation/widgets/reset_password_hint_section.dart';
import 'package:wasel_app/features/auth/reset_password/presentation/widgets/reset_password_text_fields_section.dart';

class ResetPasswordScreenBody extends StatefulWidget {
  const ResetPasswordScreenBody({super.key});

  @override
  State<ResetPasswordScreenBody> createState() =>
      _ResetPasswordScreenBodyState();
}

class _ResetPasswordScreenBodyState extends State<ResetPasswordScreenBody> {
  ResetPasswordCubit viewModel = getIt<ResetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is ResetPasswordErrorState) {
          DialogUtils.showAwSomeDialog(
            context: context,
            title: AppStrings.errorStringCapital,
            description: state.failure.errorMessage,
            dialogType: DialogType.error,
            btnOkOnPress: () {},
          );
        } else if (state is ResetPasswordSuccessState) {
          DialogUtils.showAwSomeDialog(
            context: context,
            title: AppStrings.successStringCapital,
            description: AppStrings.passwordChangedSuccessfullyString,
            dialogType: DialogType.success,
            dismissOnBackKeyPress: false,
            dismissOnTouchOutside: false,
            btnOkOnPress: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.loginScreenRoute,
                (route) => false,
              );
            },
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: viewModel.formKey,
                autovalidateMode: viewModel.autoValidateMode,
                child: Column(
                  children: [
                    LogoSection(),
                    const SizedBox(height: 50),
                    ResetPasswordHintSection(),
                    const SizedBox(height: 50),
                    ResetPasswordTextFieldsSection(viewModel: viewModel),
                    const SizedBox(height: 24),
                    state is ResetPasswordLoadingState
                        ? Center(child: CircularProgressIndicator())
                        : CustomTextButton(
                            text: AppStrings.resetPasswordString,
                            onPressed: () {
                              viewModel.resetPassword(
                                email:
                                    args[AppStrings.emailString.toLowerCase()],
                                resetCode: args[AppStrings.codeString],
                              );
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
      },
    );
  }
}
