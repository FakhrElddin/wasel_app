import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/core/api/api_manager.dart';
import 'package:wasel_app/core/api/end_points.dart';
import 'package:wasel_app/core/api/status_code.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/reset_password/data/models/reset_password_response_dm.dart';
import 'package:wasel_app/features/auth/reset_password/domain/entities/reset_password_response_entity.dart';

abstract class ResetPasswordRemoteDataSource {
  Future<Either<Failures, ResetPasswordResponseEntity>> resetPassword({
    required String email,
    required String resetCode,
    required String newPassword,
  });
}

@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImpl
    implements ResetPasswordRemoteDataSource {
  ResetPasswordRemoteDataSourceImpl({required this.apiManager});

  ApiManager apiManager;
  @override
  Future<Either<Failures, ResetPasswordResponseDm>> resetPassword({
    required String email,
    required String resetCode,
    required String newPassword,
  }) async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.patchData(
          endPoint: EndPoints.resetPasswordEndPoint,
          data: {
            "email": email,
            "resetCode": resetCode,
            "newPassword": newPassword,
          },
        );
        print(response.data);
        var resetPasswordResponse = ResetPasswordResponseDm.fromJson(response.data);
        if (response.statusCode! >= StatusCode.statusCode200 &&
            response.statusCode! < StatusCode.statusCode300) {
          return Right(resetPasswordResponse);
        } else {
          return Left(
            ServerError(
              errorMessage:
              resetPasswordResponse.message ??
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
