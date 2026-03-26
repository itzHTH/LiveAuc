import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:street_auction/core/networking/dio_factory.dart';
import 'package:street_auction/features/auth/data/repo/auth_repo.dart';
import 'package:street_auction/features/auth/data/services/auth_api_service.dart';
import 'package:street_auction/features/auth/domain/repo/base_auth_repo.dart';
import 'package:street_auction/features/auth/domain/usecases/forget_password_use_case.dart';
import 'package:street_auction/features/auth/domain/usecases/login_usecase.dart';
import 'package:street_auction/features/auth/domain/usecases/logout_use_case.dart';
import 'package:street_auction/features/auth/domain/usecases/register_use_case.dart';
import 'package:street_auction/features/auth/domain/usecases/request_email_otp_use_case.dart';
import 'package:street_auction/features/auth/domain/usecases/request_forget_password_otp_use_case.dart';
import 'package:street_auction/features/auth/domain/usecases/verfiy_email_otp_use_case.dart';
import 'package:street_auction/features/auth/domain/usecases/verfiy_forget_password_otp_use_case.dart';
import 'package:street_auction/features/auth/ui/cubit/forget_password/forget_password_cubit.dart';
import 'package:street_auction/features/auth/ui/cubit/login/login_cubit.dart';
import 'package:street_auction/features/auth/ui/cubit/register/register_cubit.dart';
import 'package:street_auction/features/splash/data/repos/app_status_repo.dart';
import 'package:street_auction/features/splash/data/services/app_status_api_service.dart';
import 'package:street_auction/features/splash/domain/repos/base_app_status_repo.dart';
import 'package:street_auction/features/splash/domain/usecases/get_app_status_use_case.dart';
import 'package:street_auction/features/splash/ui/cubit/app_status_cubit.dart';

class AppDependencyInjection {
  static void setupGetIt() {
    // Initialize Dio
    GetIt.instance.registerLazySingleton<Dio>(() => DioFactory.instance.dio);

    // Splash (App Status)
    GetIt.instance.registerLazySingleton<AppStatusService>(
      () => AppStatusService(GetIt.instance<Dio>()),
    );
    GetIt.instance.registerLazySingleton<BaseAppStatusRepo>(
      () => AppStatusRepo(appStatusService: GetIt.instance<AppStatusService>()),
    );
    GetIt.instance.registerLazySingleton<GetAppStatusUseCase>(
      () => GetAppStatusUseCase(
        baseAppStatusRepo: GetIt.instance<BaseAppStatusRepo>(),
      ),
    );
    GetIt.instance.registerFactory<AppStatusCubit>(
      () => AppStatusCubit(
        getAppStatusUseCase: GetIt.instance<GetAppStatusUseCase>(),
      ),
    );

    /// Auth
    GetIt.instance.registerLazySingleton<AuthApiService>(
      () => AuthApiService(GetIt.instance<Dio>()),
    );
    GetIt.instance.registerLazySingleton<BaseAuthRepo>(
      () => AuthRepo(GetIt.instance<AuthApiService>()),
    );
    // Login
    GetIt.instance.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(GetIt.instance<BaseAuthRepo>()),
    );
    GetIt.instance.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(GetIt.instance<BaseAuthRepo>()),
    );
    GetIt.instance.registerFactory<LoginCubit>(
      () => LoginCubit(
        GetIt.instance<LoginUseCase>(),
        GetIt.instance<LogoutUseCase>(),
      ),
    );
    // Register
    GetIt.instance.registerLazySingleton<RequestEmailOtpUseCase>(
      () => RequestEmailOtpUseCase(GetIt.instance<BaseAuthRepo>()),
    );
    GetIt.instance.registerLazySingleton<VerifyEmailOtpUseCase>(
      () => VerifyEmailOtpUseCase(GetIt.instance<BaseAuthRepo>()),
    );
    GetIt.instance.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(GetIt.instance<BaseAuthRepo>()),
    );
    GetIt.instance.registerFactory<RegisterCubit>(
      () => RegisterCubit(
        GetIt.instance<RequestEmailOtpUseCase>(),
        GetIt.instance<VerifyEmailOtpUseCase>(),
        GetIt.instance<RegisterUseCase>(),
      ),
    );
    // Forget Password
    GetIt.instance.registerLazySingleton<RequestForgetPasswordOtpUseCase>(
      () => RequestForgetPasswordOtpUseCase(GetIt.instance<BaseAuthRepo>()),
    );
    GetIt.instance.registerLazySingleton<VerifyForgetPasswordOtpUseCase>(
      () => VerifyForgetPasswordOtpUseCase(GetIt.instance<BaseAuthRepo>()),
    );
    GetIt.instance.registerLazySingleton<ForgetPasswordUseCase>(
      () => ForgetPasswordUseCase(GetIt.instance<BaseAuthRepo>()),
    );
    GetIt.instance.registerFactory<ForgetPasswordCubit>(
      () => ForgetPasswordCubit(
        GetIt.instance<RequestForgetPasswordOtpUseCase>(),
        GetIt.instance<VerifyForgetPasswordOtpUseCase>(),
        GetIt.instance<ForgetPasswordUseCase>(),
      ),
    );

    // Home
  }
}
