import 'package:wasel_app/features/home_tab/domain/entities/books_response_entity.dart';

class BooksResponseDm extends BooksResponseEntity{
  BooksResponseDm({
      super.results,
      super.paginationResult,
      super.data,
      super.status,
      super.message,
  });

  BooksResponseDm.fromJson(dynamic json) {
    results = json['results'];
    paginationResult = json['paginationResult'] != null ? BooksPaginationResultDm.fromJson(json['paginationResult']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BooksDataDm.fromJson(v));
      });
    }
  }

}

class BooksDataDm extends BooksDataEntity{
  BooksDataDm({
      super.id,
      super.title,
      super.slug,
      super.price,
      super.quantity,
      super.coverImage,
      super.images,
      super.category,
      super.user,
      super.usedTime,
      super.edition,
      super.state,
      super.createdAt,
      super.updatedAt,
  });

  BooksDataDm.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    price = json['price'];
    quantity = json['quantity'];
    coverImage = json['coverImage'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    category = json['category'];
    user = json['user'] != null ? BooksUserDm.fromJson(json['user']) : null;
    usedTime = json['usedTime'];
    edition = json['edition'];
    state = json['state'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

}

class BooksUserDm extends BooksUserEntity{
  BooksUserDm({
      super.id,
      super.name,
      super.ratingsAverage,
      super.ratingsQuantity,
      super.city,
  });

  BooksUserDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    ratingsAverage = json['ratingsAverage'];
    ratingsQuantity = json['ratingsQuantity'];
    city = json['city'];
    id = json['id'];
  }

}

class BooksPaginationResultDm extends BooksPaginationResultEntity{
  BooksPaginationResultDm({
      super.currentPage,
      super.limit,
      super.numberOfPages,
  });

  BooksPaginationResultDm.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    limit = json['limit'];
    numberOfPages = json['numberOfPages'];
  }

}