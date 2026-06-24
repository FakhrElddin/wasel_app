import 'package:dartz/dartz.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/forget_password/domain/entities/forget_password_response_entity.dart';

abstract class ForgetPasswordRepository {
  Future<Either<Failures, ForgetPasswordResponseEntity>> forgetPassword({
    required String email,
  });
}
