// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/forget_password/data/data_sources/remote_data_source/forget_password_remote_data_source.dart'
    as _i1045;
import '../../features/auth/forget_password/data/repositories/forget_password_repository_impl.dart'
    as _i584;
import '../../features/auth/forget_password/domain/repositories/forget_password_repository.dart'
    as _i974;
import '../../features/auth/forget_password/domain/use_cases/forget_password_use_case.dart'
    as _i913;
import '../../features/auth/forget_password/presentation/manager/forget_password_cubit.dart'
    as _i454;
import '../../features/auth/login/data/data_sources/remote_data_source/login_remote_data_source.dart'
    as _i529;
import '../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i470;
import '../../features/auth/login/domain/repositories/login_repository.dart'
    as _i176;
import '../../features/auth/login/domain/use_cases/login_use_case.dart' as _i50;
import '../../features/auth/login/presentation/manager/login_cubit.dart'
    as _i1024;
import '../../features/auth/register/data/data_sources/remote_data_source/register_remote_data_source.dart'
    as _i549;
import '../../features/auth/register/data/repositories/register_repository_impl.dart'
    as _i200;
import '../../features/auth/register/domain/repositories/register_repository.dart'
    as _i57;
import '../../features/auth/register/domain/use_cases/register_use_case.dart'
    as _i118;
import '../../features/auth/register/domain/use_cases/verify_otp_use_case.dart'
    as _i741;
import '../../features/auth/register/presentation/manager/register_cubit.dart'
    as _i208;
import '../../features/auth/reset_password/data/data_sources/remote_data_source/reset_password_remote_data_source.dart'
    as _i314;
import '../../features/auth/reset_password/data/repositories/reset_password_repository_impl.dart'
    as _i1018;
import '../../features/auth/reset_password/domain/repositories/reset_password_repository.dart'
    as _i606;
import '../../features/auth/reset_password/domain/use_cases/reset_password_use_case.dart'
    as _i698;
import '../../features/auth/reset_password/presentation/manager/reset_password_cubit.dart'
    as _i964;
import '../../features/auth/verify_code/data/data_sources/remote_data_source/verify_code_remote_data_source.dart'
    as _i1052;
import '../../features/auth/verify_code/data/repositories/verify_code_repository_impl.dart'
    as _i787;
import '../../features/auth/verify_code/domain/repositories/verify_code_repository.dart'
    as _i650;
import '../../features/auth/verify_code/domain/use_cases/verify_code_use_case.dart'
    as _i109;
import '../../features/auth/verify_code/presentation/manager/verify_code_cubit.dart'
    as _i40;
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i314.ResetPasswordRemoteDataSource>(
      () => _i314.ResetPasswordRemoteDataSourceImpl(
        apiManager: gh<_i1047.ApiManager>(),
      ),
    );
    gh.factory<_i549.RegisterRemoteDataSource>(
      () => _i549.RegisterRemoteDataSourceImpl(
        apiManager: gh<_i1047.ApiManager>(),
      ),
    );
    gh.factory<_i529.LoginRemoteDataSource>(
      () =>
          _i529.LoginRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
    );
    gh.factory<_i1045.ForgetPasswordRemoteDataSource>(
      () => _i1045.ForgetPasswordRemoteDataSourceImpl(
        apiManager: gh<_i1047.ApiManager>(),
      ),
    );
    gh.factory<_i974.ForgetPasswordRepository>(
      () => _i584.ForgetPasswordRepositoryImpl(
        remoteDataSource: gh<_i1045.ForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i1052.VerifyCodeRemoteDataSource>(
      () => _i1052.VerifyCodeRemoteDataSourceImpl(
        apiManager: gh<_i1047.ApiManager>(),
      ),
    );
    gh.factory<_i606.ResetPasswordRepository>(
      () => _i1018.ResetPasswordRepositoryImpl(
        remoteDataSource: gh<_i314.ResetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i57.RegisterRepository>(
      () => _i200.RegisterRepositoryImpl(
        remoteDataSource: gh<_i549.RegisterRemoteDataSource>(),
      ),
    );
    gh.factory<_i650.VerifyCodeRepository>(
      () => _i787.VerifyCodeRepositoryImpl(
        remoteDataSource: gh<_i1052.VerifyCodeRemoteDataSource>(),
      ),
    );
    gh.factory<_i118.RegisterUseCase>(
      () => _i118.RegisterUseCase(
        registerRepository: gh<_i57.RegisterRepository>(),
      ),
    );
    gh.factory<_i741.VerifyOtpUseCase>(
      () => _i741.VerifyOtpUseCase(
        registerRepository: gh<_i57.RegisterRepository>(),
      ),
    );
    gh.factory<_i109.VerifyCodeUseCase>(
      () => _i109.VerifyCodeUseCase(
        verifyCodeRepository: gh<_i650.VerifyCodeRepository>(),
      ),
    );
    gh.factory<_i176.LoginRepository>(
      () => _i470.LoginRepositoryImpl(
        remoteDataSource: gh<_i529.LoginRemoteDataSource>(),
      ),
    );
    gh.factory<_i40.VerifyCodeCubit>(
      () => _i40.VerifyCodeCubit(
        verifyCodeUseCase: gh<_i109.VerifyCodeUseCase>(),
      ),
    );
    gh.factory<_i50.LoginUseCase>(
      () => _i50.LoginUseCase(loginRepository: gh<_i176.LoginRepository>()),
    );
    gh.factory<_i913.ForgetPasswordUseCase>(
      () => _i913.ForgetPasswordUseCase(
        forgetPasswordRepository: gh<_i974.ForgetPasswordRepository>(),
      ),
    );
    gh.factory<_i698.ResetPasswordUseCase>(
      () => _i698.ResetPasswordUseCase(
        resetPasswordRepository: gh<_i606.ResetPasswordRepository>(),
      ),
    );
    gh.factory<_i964.ResetPasswordCubit>(
      () => _i964.ResetPasswordCubit(
        resetPasswordUseCase: gh<_i698.ResetPasswordUseCase>(),
      ),
    );
    gh.factory<_i454.ForgetPasswordCubit>(
      () => _i454.ForgetPasswordCubit(
        forgetPasswordUseCase: gh<_i913.ForgetPasswordUseCase>(),
      ),
    );
    gh.factory<_i208.RegisterCubit>(
      () => _i208.RegisterCubit(
        registerUseCase: gh<_i118.RegisterUseCase>(),
        verifyOtpUseCase: gh<_i741.VerifyOtpUseCase>(),
      ),
    );
    gh.factory<_i1024.LoginCubit>(
      () => _i1024.LoginCubit(loginUseCase: gh<_i50.LoginUseCase>()),
    );
    return this;
  }
}
