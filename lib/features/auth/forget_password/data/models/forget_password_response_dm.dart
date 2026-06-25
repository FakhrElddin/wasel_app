import 'package:wasel_app/features/auth/forget_password/domain/entities/forget_password_response_entity.dart';

class ForgetPasswordResponseDm extends ForgetPasswordResponseEntity {
  ForgetPasswordResponseDm({
    super.status,
    super.message,
  });

  ForgetPasswordResponseDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }
}
