import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/register/domain/entities/register_response_entity.dart';
import 'package:wasel_app/features/auth/register/domain/repositories/register_repository.dart';

@injectable
class RegisterUseCase {
  RegisterUseCase({required this.registerRepository});

  final RegisterRepository registerRepository;

  Future<Either<Failures, RegisterResponseEntity>> invoke({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    return registerRepository.register(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}
