import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/reset_password/data/data_sources/remote_data_source/reset_password_remote_data_source.dart';
import 'package:wasel_app/features/auth/reset_password/domain/entities/reset_password_response_entity.dart';
import 'package:wasel_app/features/auth/reset_password/domain/repositories/reset_password_repository.dart';

@Injectable(as: ResetPasswordRepository)
class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  ResetPasswordRepositoryImpl({required this.remoteDataSource});

  ResetPasswordRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failures, ResetPasswordResponseEntity>> resetPassword({
    required String email,
    required String resetCode,
    required String newPassword,
  }) async {
    var either = await remoteDataSource.resetPassword(
      email: email,
      resetCode: resetCode,
      newPassword: newPassword,
    );
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
