import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/core/api/api_manager.dart';
import 'package:wasel_app/core/api/end_points.dart';
import 'package:wasel_app/core/api/status_code.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/home_tab/data/models/categories_response_dm.dart';
import 'package:wasel_app/features/home_tab/domain/entities/categories_response_entity.dart';

abstract class HomeTabRemoteDataSource {
  Future<Either<Failures, CategoriesResponseEntity>> getCategories();
}

@Injectable(as: HomeTabRemoteDataSource)
class HomeTabRemoteDataSourceImpl implements HomeTabRemoteDataSource{
  HomeTabRemoteDataSourceImpl({required this.apiManager});
  ApiManager apiManager;


  @override
  Future<Either<Failures, CategoriesResponseDm>> getCategories() async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(
          endPoint: EndPoints.categoriesEndPoint,
        );
        var categoriesResponse = CategoriesResponseDm.fromJson(response.data);
        if (response.statusCode! >= StatusCode.statusCode200 &&
            response.statusCode! < StatusCode.statusCode300) {
          return Right(categoriesResponse);
        } else {
          return Left(
            ServerError(
              errorMessage:
              categoriesResponse.message!,
            ),
          );
        }
      } else {
        return Left(NetworkError());
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerError.fromDioException(e));
      }
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}