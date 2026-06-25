import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/forget_password/data/data_sources/remote_data_source/forget_password_remote_data_source.dart';
import 'package:wasel_app/features/auth/forget_password/domain/entities/forget_password_response_entity.dart';
import 'package:wasel_app/features/auth/forget_password/domain/repositories/forget_password_repository.dart';

@Injectable(as: ForgetPasswordRepository)
class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  ForgetPasswordRepositoryImpl({required this.remoteDataSource});

  ForgetPasswordRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failures, ForgetPasswordResponseEntity>> forgetPassword({
    required String email,
  }) async {
    var either = await remoteDataSource.forgetPassword(email: email);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
