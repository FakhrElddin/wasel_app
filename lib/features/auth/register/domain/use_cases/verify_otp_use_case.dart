import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/register/domain/entities/verify_otp_response_entity.dart';
import 'package:wasel_app/features/auth/register/domain/repositories/register_repository.dart';

@injectable
class VerifyOtpUseCase {
  VerifyOtpUseCase({required this.registerRepository});

  RegisterRepository registerRepository;

  Future<Either<Failures, VerifyOtpResponseEntity>> invoke({
    required String email,
    required String otp,
  }) {
    return registerRepository.verifyOtp(email: email, otp: otp);
  }
}
