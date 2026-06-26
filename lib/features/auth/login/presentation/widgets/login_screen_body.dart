import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/core/components/custom_text_button.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/core/utils/dialog_utils.dart';
import 'package:wasel_app/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:wasel_app/features/auth/login/presentation/manager/login_states.dart';
import 'package:wasel_app/features/auth/login/presentation/widgets/logo_section.dart';
import 'package:wasel_app/features/auth/login/presentation/widgets/register_section.dart';
import 'package:wasel_app/features/auth/login/presentation/widgets/login_text_fields_section.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          DialogUtils.showAwSomeDialog(
            context: context,
            title: AppStrings.errorStringCapital,
            description: state.failure.errorMessage,
            dialogType: DialogType.error,
            btnOkOnPress: () {},
          );
        } else if (state is LoginSuccessState) {
          // navigate to home
        }
      },
      builder: (context, state) {
        LoginCubit viewModel = BlocProvider.of<LoginCubit>(context);
        return Form(
          key: viewModel.formKey,
          autovalidateMode: viewModel.autoValidateMode,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const LogoSection(),
                    const SizedBox(height: 50),
                    LoginTextFieldsSection(viewModel: viewModel),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.forgetPasswordScreenRoute,
                        );
                        viewModel.clearFields();
                      },
                      child: Text(
                        AppStrings.forgetPasswordButtonString,
                        style: AppStyles.regular16Text.copyWith(
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    state is LoginLoadingState
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : CustomTextButton(
                            text: AppStrings.loginString,
                            onPressed: () {
                              viewModel.login();
                            },
                          ),
                    const SizedBox(height: 24),
                    const RegisterSection(),
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
