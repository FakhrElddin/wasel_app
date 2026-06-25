import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wasel_app/features/auth/register/domain/use_cases/register_use_case.dart';
import 'package:wasel_app/features/auth/register/domain/use_cases/verify_otp_use_case.dart';
import 'package:wasel_app/features/auth/register/presentation/manager/register_states.dart';

@injectable
class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit({required this.registerUseCase, required this.verifyOtpUseCase})
      : super(RegisterInitialState());

  RegisterUseCase registerUseCase;
  VerifyOtpUseCase verifyOtpUseCase;

  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<FormState> verifyOtpFormKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  AutovalidateMode verifyOtpAutoValidateMode = AutovalidateMode.disabled;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  PinInputController pinController = PinInputController();
  bool firstIsPassword = true;
  bool secondIsPassword = true;

  static RegisterCubit get(BuildContext context) =>
      BlocProvider.of<RegisterCubit>(context);

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.invoke(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      );
      either.fold(
            (failure) => emit(RegisterErrorState(failure: failure)),
            (response) =>
            emit(RegisterSuccessState(registerResponse: response)),
      );
    } else {
      changeAutoValidateMode(isPinCode: false);
    }
  }

  void verifyOtp() async {
      emit(VerifyOtpLoadingState());
      if (verifyOtpFormKey.currentState!.validate()) {
        var either = await verifyOtpUseCase.invoke(
          email: emailController.text,
          otp: pinController.text,
        );
        either.fold(
              (failure) => emit(VerifyOtpErrorState(failure: failure)),
              (response) =>
              emit(VerifyOtpSuccessState(response: response)),
        );
      } else {
        changeAutoValidateMode(isPinCode: true);
      }
  }

  void changeVisibility({
    required bool isFirstField,
    required bool isPassword,
  }) {
    if (isFirstField) {
      firstIsPassword = isPassword;
    }
    if (isFirstField == false) {
      secondIsPassword = isPassword;
    }
    emit(ChangeVisibilityState());
  }

  void changeAutoValidateMode({required bool isPinCode}) {
    if(isPinCode){
      verifyOtpAutoValidateMode = AutovalidateMode.always;
    } else {
      autoValidateMode = AutovalidateMode.always;
    }
    emit(ChangeAutoValidateModeState());
  }
}
