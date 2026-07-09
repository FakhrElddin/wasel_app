import 'package:wasel_app/features/home_tab/domain/entities/categories_response_entity.dart';

class CategoriesResponseDm extends CategoriesResponseEntity{
  CategoriesResponseDm({
      super.results,
      super.paginationResult,
      super.data,
      super.status,
      super.message,
  });

  CategoriesResponseDm.fromJson(dynamic json) {
    results = json['results'];
    status = json['status'];
    message = json['message'];
    paginationResult = json['paginationResult'] != null ? PaginationResultDm.fromJson(json['paginationResult']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoriesDataDm.fromJson(v));
      });
    }
  }

}

class CategoriesDataDm extends CategoriesDataEntity{
  CategoriesDataDm({
      super.id,
      super.name,
      super.slug,
      super.image,
      super.createdAt,
      super.updatedAt,
  });

  CategoriesDataDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

}

class PaginationResultDm extends PaginationResultEntity{
  PaginationResultDm({
      super.currentPage,
      super.limit,
      super.numberOfPages,
  });

  PaginationResultDm.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    limit = json['limit'];
    numberOfPages = json['numberOfPages'];
  }

}