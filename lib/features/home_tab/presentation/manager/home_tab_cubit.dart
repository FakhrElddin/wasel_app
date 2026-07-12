import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/features/home_tab/domain/entities/books_response_entity.dart';
import 'package:wasel_app/features/home_tab/domain/entities/categories_response_entity.dart';
import 'package:wasel_app/features/home_tab/domain/use_cases/get_books_use_case.dart';
import 'package:wasel_app/features/home_tab/domain/use_cases/get_categories_use_case.dart';
import 'package:wasel_app/features/home_tab/presentation/manager/home_tab_states.dart';

@injectable
class HomeTabCubit extends Cubit<HomeTabStates> {
  HomeTabCubit({
    required this.getCategoriesUseCase,
    required this.getBooksUseCase,
  }) : super(HomeTabInitialState());

  GetCategoriesUseCase getCategoriesUseCase;
  GetBooksUseCase getBooksUseCase;

  int selectedCategory = 0;
  CategoriesResponseEntity? categoriesResponse;
  BooksResponseEntity? booksResponse;

  static HomeTabCubit get(BuildContext context) =>
      BlocProvider.of<HomeTabCubit>(context);

  void getCategories() async {
    if (categoriesResponse != null) return;

    emit(GetCategoriesLoadingState());
    var either = await getCategoriesUseCase.invoke();
    either.fold(
      (failure) => emit(GetCategoriesFailureState(failure: failure)),
      (response) {
        categoriesResponse = response;
        emit(GetCategoriesSuccessState(responseEntity: response));
      },
    );
  }

  void changeSelectedCategory({required int index}) {
    selectedCategory = index;
    emit(ChangeSelectedCategoryState());
  }

  void getBooks() async {
    if (booksResponse != null) return;

    emit(GetBooksLoadingState());
    var either = await getBooksUseCase.invoke();
    either.fold((failure) => emit(GetBooksFailureState(failure: failure)), (
      response,
    ) {
      booksResponse = response;
      emit(GetBooksSuccessState(responseEntity: response));
    });
  }
}
