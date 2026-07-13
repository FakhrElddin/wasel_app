class BooksResponseEntity {
  BooksResponseEntity({
      this.results, 
      this.paginationResult, 
      this.data,
      this.status,
      this.message,
  });

  num? results;
  BooksPaginationResultEntity? paginationResult;
  List<BooksDataEntity>? data;
  String? status;
  String? message;

}

class BooksDataEntity {
  BooksDataEntity({
      this.id, 
      this.title, 
      this.slug, 
      this.price, 
      this.quantity, 
      this.coverImage, 
      this.images, 
      this.category, 
      this.user, 
      this.usedTime, 
      this.edition, 
      this.state, 
      this.createdAt, 
      this.updatedAt,
  });

  String? id;
  String? title;
  String? slug;
  num? price;
  num? quantity;
  String? coverImage;
  List<String>? images;
  dynamic category;
  BooksUserEntity? user;
  num? usedTime;
  num? edition;
  String? state;
  String? createdAt;
  String? updatedAt;

}

class BooksUserEntity {
  BooksUserEntity({
      this.id, 
      this.name, 
      this.ratingsAverage, 
      this.ratingsQuantity, 
      this.city, 
      this.profileImage,
  });

  String? id;
  String? name;
  num? ratingsAverage;
  num? ratingsQuantity;
  String? city;
  String? profileImage;

}

class BooksPaginationResultEntity {
  BooksPaginationResultEntity({
      this.currentPage, 
      this.limit, 
      this.numberOfPages,
  });

  num? currentPage;
  num? limit;
  num? numberOfPages;

}