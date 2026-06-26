import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/core/api/api_manager.dart';
import 'package:wasel_app/core/api/end_points.dart';
import 'package:wasel_app/core/api/status_code.dart';
import 'package:wasel_app/core/cache/shared_prefs_utils.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/features/auth/login/data/models/login_response_dm.dart';
import 'package:wasel_app/features/auth/login/domain/entities/login_response_entity.dart';

abstract class LoginRemoteDataSource {
  Future<Either<Failures, LoginResponseEntity>> login({
    required String email,
    required String password,
  });
}

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  LoginRemoteDataSourceImpl({required this.apiManager});

  ApiManager apiManager;

  @override
  Future<Either<Failures, LoginResponseDm>> login({
    required String email,
    required String password,
  }) async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.postData(
          endPoint: EndPoints.loginEndPoint,
          data: {"email": email, "password": password},
        );
        var loginResponse = LoginResponseDm.fromJson(response.data);
        if (response.statusCode! >= StatusCode.statusCode200 &&
            response.statusCode! < StatusCode.statusCode300) {
          await SharedPrefsUtils.saveData(
            key: AppConstants.token,
            value: loginResponse.token,
          );
          return Right(loginResponse);
        } else {
          return Left(
            ServerError(
              errorMessage:
                  loginResponse.message ??
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
