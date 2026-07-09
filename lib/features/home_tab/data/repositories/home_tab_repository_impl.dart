import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/home_tab/data/data_sources/remote_data_source/home_tab_remote_data_source.dart';
import 'package:wasel_app/features/home_tab/domain/entities/categories_response_entity.dart';
import 'package:wasel_app/features/home_tab/domain/repositories/home_tab_repository.dart';

@Injectable(as: HomeTabRepository)
class HomeTabRepositoryImpl implements HomeTabRepository {
  HomeTabRepositoryImpl({required this.remoteDataSource});

  HomeTabRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failures, CategoriesResponseEntity>> getCategories() async {
    var either = await remoteDataSource.getCategories();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
