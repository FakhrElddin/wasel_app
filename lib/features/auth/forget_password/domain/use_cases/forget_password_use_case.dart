import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/forget_password/domain/entities/forget_password_response_entity.dart';
import 'package:wasel_app/features/auth/forget_password/domain/repositories/forget_password_repository.dart';

@injectable
class ForgetPasswordUseCase {
  ForgetPasswordUseCase({required this.forgetPasswordRepository});

  ForgetPasswordRepository forgetPasswordRepository;

  Future<Either<Failures, ForgetPasswordResponseEntity>> invoke({
    required String email,
  }) {
    return forgetPasswordRepository.forgetPassword(email: email);
  }
}
