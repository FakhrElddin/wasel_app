import 'package:dartz/dartz.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/verify_code/domain/entities/verify_code_response_entity.dart';

abstract class VerifyCodeRepository {
  Future<Either<Failures, VerifyCodeResponseEntity>> verifyCode({
    required String email,
    required String code,
  });
}
