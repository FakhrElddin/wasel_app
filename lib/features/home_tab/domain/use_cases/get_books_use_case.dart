import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/home_tab/domain/entities/books_response_entity.dart';
import 'package:wasel_app/features/home_tab/domain/repositories/home_tab_repository.dart';

@injectable
class GetBooksUseCase {
  GetBooksUseCase({required this.homeTabRepository});

  HomeTabRepository homeTabRepository;

  Future<Either<Failures, BooksResponseEntity>> invoke() {
    return homeTabRepository.getBooks();
  }
}
