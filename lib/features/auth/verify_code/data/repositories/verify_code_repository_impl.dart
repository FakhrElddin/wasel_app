import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/verify_code/data/data_sources/remote_data_source/verify_code_remote_data_source.dart';
import 'package:wasel_app/features/auth/verify_code/domain/entities/verify_code_response_entity.dart';
import 'package:wasel_app/features/auth/verify_code/domain/repositories/verify_code_repository.dart';

@Injectable(as: VerifyCodeRepository)
class VerifyCodeRepositoryImpl implements VerifyCodeRepository {
  VerifyCodeRepositoryImpl({required this.remoteDataSource});

  VerifyCodeRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failures, VerifyCodeResponseEntity>> verifyCode({
    required String email,
    required String code,
  }) async {
    var either = await remoteDataSource.verifyCode(email: email, code: code);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
