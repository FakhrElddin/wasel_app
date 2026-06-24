import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/core/api/api_manager.dart';
import 'package:wasel_app/core/api/end_points.dart';
import 'package:wasel_app/core/api/status_code.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/verify_code/data/models/verify_code_response_dm.dart';
import 'package:wasel_app/features/auth/verify_code/domain/entities/verify_code_response_entity.dart';

abstract class VerifyCodeRemoteDataSource {
  Future<Either<Failures, VerifyCodeResponseEntity>> verifyCode({
    required String email,
    required String code,
  });
}

@Injectable(as: VerifyCodeRemoteDataSource)
class VerifyCodeRemoteDataSourceImpl implements VerifyCodeRemoteDataSource {
  VerifyCodeRemoteDataSourceImpl({required this.apiManager});

  ApiManager apiManager;

  @override
  Future<Either<Failures, VerifyCodeResponseDm>> verifyCode({
    required String email,
    required String code,
  }) async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.postData(
          endPoint: EndPoints.verifyResetCodeEndPoint,
          data: {
            "email": email,
            "resetCode": code,
          },
        );
        var verifyCodeResponse = VerifyCodeResponseDm.fromJson(response.data);
        if (response.statusCode! >= StatusCode.statusCode200 &&
            response.statusCode! < StatusCode.statusCode300) {
          return Right(verifyCodeResponse);
        } else {
          return Left(
            ServerError(
              errorMessage:
                  verifyCodeResponse.message ??
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
