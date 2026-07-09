import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/components/custom_text_button.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/bottom_sheet_utils.dart';
import 'package:wasel_app/core/utils/dialog_utils.dart';
import 'package:wasel_app/features/auth/login/presentation/widgets/logo_section.dart';
import 'package:wasel_app/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:wasel_app/features/auth/register/presentation/manager/register_states.dart';
import 'package:wasel_app/features/auth/register/presentation/widgets/login_section.dart';
import 'package:wasel_app/features/auth/register/presentation/widgets/register_text_fields_section.dart';
import 'package:wasel_app/features/auth/register/presentation/widgets/verify_otp_bottom_sheet.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterErrorState) {
          DialogUtils.showAwSomeDialog(
            context: context,
            title: AppStrings.errorStringCapital,
            description: state.failure.errorMessage,
            dialogType: DialogType.error,
            btnOkOnPress: () {},
          );
        } else if (state is RegisterSuccessState) {
          BottomSheetUtils.showBottomSheet(
            context: context,
            widget: VerifyOtpBottomSheet(
              viewModel: BlocProvider.of<RegisterCubit>(context),
            ),
          );
        }
      },
      builder: (context, state) {
        RegisterCubit viewModel = BlocProvider.of<RegisterCubit>(context);
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
                    LogoSection(),
                    const SizedBox(height: 50),
                    RegisterTextFieldsSection(viewModel: viewModel),
                    const SizedBox(height: 32),
                    state is RegisterLoadingState
                        ? Center(child: CircularProgressIndicator())
                        : CustomTextButton(
                            text: AppStrings.registerString,
                            onPressed: () {
                              viewModel.register();
                            },
                          ),
                    const SizedBox(height: 24),
                    LoginSection(),
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
