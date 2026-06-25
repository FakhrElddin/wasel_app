import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/core/api/api_manager.dart';
import 'package:wasel_app/core/api/end_points.dart';
import 'package:wasel_app/core/api/status_code.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/forget_password/data/models/forget_password_response_dm.dart';
import 'package:wasel_app/features/auth/forget_password/domain/entities/forget_password_response_entity.dart';

abstract class ForgetPasswordRemoteDataSource {
  Future<Either<Failures, ForgetPasswordResponseEntity>> forgetPassword({
    required String email,
  });
}


@Injectable(as: ForgetPasswordRemoteDataSource)
class ForgetPasswordRemoteDataSourceImpl
    implements ForgetPasswordRemoteDataSource {
  ForgetPasswordRemoteDataSourceImpl({required this.apiManager});

  ApiManager apiManager;

  @override
  Future<Either<Failures, ForgetPasswordResponseDm>> forgetPassword({
    required String email,
  }) async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.postData(
          endPoint: EndPoints.forgetPasswordEndPoint,
          data: {"email": email},
        );
        var forgetPasswordResponse = ForgetPasswordResponseDm.fromJson(
          response.data,
        );
        if (response.statusCode! >= StatusCode.statusCode200 &&
            response.statusCode! < StatusCode.statusCode300) {
          return Right(forgetPasswordResponse);
        } else {
          return Left(
            ServerError(
              errorMessage:
                  forgetPasswordResponse.message ??
                  'Something went wrong, please try again later.',
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
