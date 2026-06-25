import 'package:wasel_app/features/auth/verify_code/domain/entities/verify_code_response_entity.dart';

class VerifyCodeResponseDm extends VerifyCodeResponseEntity {

  VerifyCodeResponseDm({
    super.status,
    super.message,
  });

  VerifyCodeResponseDm.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
  }

}