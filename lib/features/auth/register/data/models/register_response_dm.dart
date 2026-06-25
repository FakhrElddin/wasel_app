import 'package:wasel_app/features/auth/register/domain/entities/register_response_entity.dart';

class RegisterResponseDm extends RegisterResponseEntity {
  RegisterResponseDm({super.status, super.message, super.email, super.errors});

  RegisterResponseDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    email = json['email'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((element) {
        errors!.add(ErrorsDm.fromJson(element));
      });
    } else {
      errors = null;
    }
  }
}

class ErrorsDm extends ErrorsEntity {
  ErrorsDm({super.type, super.value, super.msg, super.path, super.location});

  ErrorsDm.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    msg = json['msg'];
    path = json['path'];
    location = json['location'];
  }
}
