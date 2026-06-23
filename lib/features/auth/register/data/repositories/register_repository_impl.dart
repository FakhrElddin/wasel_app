import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/register/data/data_sources/remote_data_source/register_remote_data_source.dart';
import 'package:wasel_app/features/auth/register/domain/entities/register_response_entity.dart';
import 'package:wasel_app/features/auth/register/domain/repositories/register_repository.dart';

@Injectable(as: RegisterRepository)
class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRepositoryImpl({required this.remoteDataSource});

  RegisterRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failures, RegisterResponseEntity>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    var either = await remoteDataSource.register(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
