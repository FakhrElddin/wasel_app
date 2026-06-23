import 'package:dartz/dartz.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/register/domain/entities/register_response_entity.dart';

abstract class RegisterRepository {
  Future<Either<Failures, RegisterResponseEntity>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  });
}
