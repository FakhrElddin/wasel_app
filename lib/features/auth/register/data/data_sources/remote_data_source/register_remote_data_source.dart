import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/core/api/api_manager.dart';
import 'package:wasel_app/core/api/end_points.dart';
import 'package:wasel_app/core/api/status_code.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/register/data/models/register_response_dm.dart';
import 'package:wasel_app/features/auth/register/domain/entities/register_response_entity.dart';

abstract class RegisterRemoteDataSource {
  Future<Either<Failures, RegisterResponseEntity>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  });
}

@Injectable(as: RegisterRemoteDataSource)
class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  RegisterRemoteDataSourceImpl({required this.apiManager});

  ApiManager apiManager;

  @override
  Future<Either<Failures, RegisterResponseDm>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.postData(
          endPoint: EndPoints.registerEndPoint,
          data: {
            "name": name,
            "email": email,
            "password": password,
            "passwordConfirm": confirmPassword,
          },
        );
        var registerResponse = RegisterResponseDm.fromJson(response.data);
        if (response.statusCode! >= StatusCode.statusCode200 &&
            response.statusCode! < StatusCode.statusCode300) {
          return Right(registerResponse);
        } else {
          return Left(
            ServerError(
              errorMessage:
                  registerResponse.errors?.first.msg ??
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
