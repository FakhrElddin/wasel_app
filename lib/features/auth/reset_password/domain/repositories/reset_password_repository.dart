import 'package:dartz/dartz.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/reset_password/domain/entities/reset_password_response_entity.dart';

abstract class ResetPasswordRepository {
  Future<Either<Failures, ResetPasswordResponseEntity>> resetPassword({
    required String email,
    required String resetCode,
    required String newPassword,
});
}