import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/verify_code/domain/entities/verify_code_response_entity.dart';
import 'package:wasel_app/features/auth/verify_code/domain/repositories/verify_code_repository.dart';

@injectable
class VerifyCodeUseCase {
  VerifyCodeRepository verifyCodeRepository;

  VerifyCodeUseCase({required this.verifyCodeRepository});

  Future<Either<Failures, VerifyCodeResponseEntity>> invoke({
    required String email,
    required String code,
  }) {
    return verifyCodeRepository.verifyCode(email: email, code: code);
  }
}
