import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/home_tab/domain/entities/books_response_entity.dart';
import 'package:wasel_app/features/home_tab/domain/entities/categories_response_entity.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates{}

class GetCategoriesLoadingState extends HomeTabStates{}

class GetCategoriesSuccessState extends HomeTabStates{
  final CategoriesResponseEntity responseEntity;

  GetCategoriesSuccessState({required this.responseEntity});
}

class GetCategoriesFailureState extends HomeTabStates{
  final Failures failure;

  GetCategoriesFailureState({required this.failure});
}

class ChangeSelectedCategoryState extends HomeTabStates{}

class GetBooksLoadingState extends HomeTabStates{}

class GetBooksSuccessState extends HomeTabStates{
  final BooksResponseEntity responseEntity;

  GetBooksSuccessState({required this.responseEntity});
}

class GetBooksFailureState extends HomeTabStates{
  final Failures failure;

  GetBooksFailureState({required this.failure});
}