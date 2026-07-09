import 'package:dartz/dartz.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/home_tab/domain/entities/categories_response_entity.dart';

abstract class HomeTabRepository {
  Future<Either<Failures, CategoriesResponseEntity>> getCategories();
}