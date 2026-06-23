class LoginResponseEntity {
  LoginResponseEntity({
      this.data, 
      this.token,
      this.status,
      this.message,
  });

  LoginDataEntity? data;
  String? token;
  String? status;
  String? message;

}

class LoginDataEntity {
  LoginDataEntity({
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
      this.cardId, 
      this.profileImage, 
      this.passwordChangedAt,
  });

  String? id;
  String? name;
  String? slug;
  String? email;
  String? role;
  bool? active;
  num? ratingsAverage;
  num? ratingsQuantity;
  List<String>? wishlist;
  String? city;
  String? createdAt;
  String? updatedAt;
  num? v;
  String? cardId;
  String? profileImage;
  String? passwordChangedAt;

}