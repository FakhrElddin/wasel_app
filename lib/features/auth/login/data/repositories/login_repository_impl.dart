import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/login/data/data_sources/remote_data_source/login_remote_data_source.dart';
import 'package:wasel_app/features/auth/login/domain/entities/login_response_entity.dart';
import 'package:wasel_app/features/auth/login/domain/repositories/login_repository.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({required this.remoteDataSource});

  LoginRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failures, LoginResponseEntity>> login({
    required String email,
    required String password,
  }) async {
    var either = await remoteDataSource.login(email: email, password: password);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
