class RegisterResponseEntity {
  RegisterResponseEntity({this.status, this.message, this.email, this.errors});

  String? status;
  String? message;
  String? email;
  List<ErrorsEntity>? errors;
}

class ErrorsEntity {
  ErrorsEntity({this.type, this.value, this.msg, this.path, this.location});

  String? type;
  String? value;
  String? msg;
  String? path;
  String? location;
}
