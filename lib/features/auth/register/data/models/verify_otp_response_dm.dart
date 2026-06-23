import 'package:wasel_app/features/auth/register/domain/entities/verify_otp_response_entity.dart';

class VerifyOtpResponseDm extends VerifyOtpResponseEntity{
  VerifyOtpResponseDm({
      super.data,
      super.token,
      super.status,
      super.message,
  });

  VerifyOtpResponseDm.fromJson(dynamic json) {
    data = json['data'] != null ? VerifyOtpDataDm.fromJson(json['data']) : null;
    token = json['token'];
    status = json['status'];
    message = json['message'];
  }

}

class VerifyOtpDataDm extends VerifyOtpDataEntity{
  VerifyOtpDataDm({
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
  });

  VerifyOtpDataDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    email = json['email'];
    role = json['role'];
    active = json['active'];
    ratingsAverage = json['ratingsAverage'];
    ratingsQuantity = json['ratingsQuantity'];
    if (json['wishlist'] != null) {
      wishlist = [];
      json['wishlist'].forEach((v) {
        wishlist?.add(v);
      });
    }
    city = json['city'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

}