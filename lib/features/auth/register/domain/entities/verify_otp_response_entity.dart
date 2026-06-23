class VerifyOtpResponseEntity {
  VerifyOtpResponseEntity({
      this.data, 
      this.token,
      this.status,
      this.message,
  });

  VerifyOtpDataEntity? data;
  String? token;
  String? status;
  String? message;

}

class VerifyOtpDataEntity {
  VerifyOtpDataEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.email, 
      this.role, 
      this.active, 
      this.ratingsAverage, 
      this.ratingsQuantity, 
      this.wishlist, 
      this.city, 
      this.createdAt, 
      this.updatedAt, 
      this.v,
  });

  String? id;
  String? name;
  String? slug;
  String? email;
  String? role;
  bool? active;
  num? ratingsAverage;
  num? ratingsQuantity;
  List<dynamic>? wishlist;
  String? city;
  String? createdAt;
  String? updatedAt;
  num? v;


}