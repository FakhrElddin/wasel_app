import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/home_tab/domain/entities/categories_response_entity.dart';
import 'package:wasel_app/features/home_tab/domain/repositories/home_tab_repository.dart';

@injectable
class GetCategoriesUseCase {
  GetCategoriesUseCase({required this.homeTabRepository});

  HomeTabRepository homeTabRepository;

  Future<Either<Failures, CategoriesResponseEntity>> invoke(){
    return homeTabRepository.getCategories();
  }
}