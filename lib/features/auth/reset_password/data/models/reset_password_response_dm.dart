import 'package:wasel_app/features/auth/reset_password/domain/entities/reset_password_response_entity.dart';

class ResetPasswordResponseDm extends ResetPasswordResponseEntity {
  ResetPasswordResponseDm({
    super.token,
    super.status,
    super.message,
});

  ResetPasswordResponseDm.fromJson(Map<String, dynamic> json){
    token = json['token'];
    status = json['status'];
    message = json['message'];
  }
}