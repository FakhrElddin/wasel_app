import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wasel_app/features/auth/verify_code/domain/use_cases/verify_code_use_case.dart';
import 'package:wasel_app/features/auth/verify_code/presentation/manager/verify_code_states.dart';

@injectable
class VerifyCodeCubit extends Cubit<VerifyCodeStates> {
  VerifyCodeCubit({required this.verifyCodeUseCase}) : super(VerifyCodeInitialState());
  VerifyCodeUseCase verifyCodeUseCase;

  PinInputController codeController = PinInputController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode? autoValidateMode = AutovalidateMode.disabled;

  void verifyCode({required String email}) async {
    if (formKey.currentState!.validate()) {
      emit(VerifyCodeLoadingState());
      var either = await verifyCodeUseCase.invoke(
        email: email,
        code: codeController.text,
      );
      either.fold(
            (failure) => emit(VerifyCodeErrorState(failure: failure)),
            (response) => emit(VerifyCodeSuccessState(response: response)),
      );
    } else {
      changeAutoValidateMode();
    }
  }

  void changeAutoValidateMode() {
    autoValidateMode = AutovalidateMode.always;
    emit(ChangeAutoValidateModeState());
  }

}
