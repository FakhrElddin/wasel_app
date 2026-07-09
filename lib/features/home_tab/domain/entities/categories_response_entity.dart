class CategoriesResponseEntity {
  CategoriesResponseEntity({
      this.results, 
      this.paginationResult, 
      this.data,
      this.status,
      this.message,
  });

  num? results;
  PaginationResultEntity? paginationResult;
  List<CategoriesDataEntity>? data;
  String? status;
  String? message;

}

class CategoriesDataEntity {
  CategoriesDataEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image, 
      this.createdAt, 
      this.updatedAt,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

}

class PaginationResultEntity {
  PaginationResultEntity({
      this.currentPage, 
      this.limit, 
      this.numberOfPages,
  });

  num? currentPage;
  num? limit;
  num? numberOfPages;

}