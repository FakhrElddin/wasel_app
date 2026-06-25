import 'package:dartz/dartz.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/login/domain/entities/login_response_entity.dart';

abstract class LoginRepository {
  Future<Either<Failures, LoginResponseEntity>> login({
    required String email,
    required String password,
  });
}
