import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/features/auth/forget_password/domain/use_cases/forget_password_use_case.dart';
import 'package:wasel_app/features/auth/forget_password/presentation/manager/forget_password_states.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit({required this.forgetPasswordUseCase})
    : super(ForgetPasswordInitialState());
  ForgetPasswordUseCase forgetPasswordUseCase;

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();

  void forgetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(ForgetPasswordLoadingState());
      var either = await forgetPasswordUseCase.invoke(
        email: emailController.text,
      );
      either.fold(
        (failure) => emit(ForgetPasswordErrorState(failure: failure)),
        (response) => emit(ForgetPasswordSuccessState(response: response)),
      );
    } else {
      changeAutoValidateMode();
    }
  }


  void changeAutoValidateMode() {
    autoValidateMode = AutovalidateMode.always;
    emit(ChangeAutoValidateModeState());
  }

  void clearFields() {
    emailController.clear();
    emit(ForgetPasswordInitialState());
  }
}
