import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/login/domain/entities/login_response_entity.dart';
import 'package:wasel_app/features/auth/login/domain/repositories/login_repository.dart';

@injectable
class LoginUseCase {
  LoginUseCase({required this.loginRepository});

  LoginRepository loginRepository;

  Future<Either<Failures, LoginResponseEntity>> invoke({
    required String email,
    required String password,
  }) {
    return loginRepository.login(email: email, password: password);
  }
}
