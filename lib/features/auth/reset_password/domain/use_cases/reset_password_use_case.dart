import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/reset_password/domain/entities/reset_password_response_entity.dart';
import 'package:wasel_app/features/auth/reset_password/domain/repositories/reset_password_repository.dart';

@injectable
class ResetPasswordUseCase {
  ResetPasswordUseCase({required this.resetPasswordRepository});

  ResetPasswordRepository resetPasswordRepository;

  Future<Either<Failures, ResetPasswordResponseEntity>> invoke({
    required String email,
    required String resetCode,
    required String newPassword,
  }) {
    return resetPasswordRepository.resetPassword(
      email: email,
      resetCode: resetCode,
      newPassword: newPassword,
    );
  }
}
