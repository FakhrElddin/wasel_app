import 'package:wasel_app/features/auth/login/domain/entities/login_response_entity.dart';

class LoginResponseDm extends LoginResponseEntity{
  LoginResponseDm({
      super.data,
      super.token,
      super.status,
      super.message,
  });

  LoginResponseDm.fromJson(dynamic json) {
    data = json['data'] != null ? LoginDataDm.fromJson(json['data']) : null;
    token = json['token'];
    status = json['status'];
    message = json['message'];
  }

}

class LoginDataDm extends LoginDataEntity{
  LoginDataDm({
      super.id,
      super.name,
      super.slug,
      super.email,
      super.role,
      super.active,
      super.ratingsAverage,
      super.ratingsQuantity,
      super.wishlist,
      super.city,
      super.createdAt,
      super.updatedAt,
      super.v,
      super.cardId,
      super.profileImage,
      super.passwordChangedAt,
  });

  LoginDataDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    email = json['email'];
    role = json['role'];
    active = json['active'];
    ratingsAverage = json['ratingsAverage'];
    ratingsQuantity = json['ratingsQuantity'];
    wishlist = json['wishlist'] != null ? json['wishlist'].cast<String>() : [];
    city = json['city'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    cardId = json['cardId'];
    profileImage = json['profileImage'];
    passwordChangedAt = json['passwordChangedAt'];
  }

}