import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:street_auction/core/networking/dio_factory.dart';
import 'package:street_auction/features/auth/data/repo/auth_repo.dart';
import 'package:street_auction/features/auth/data/services/auth_api_service.dart';
import 'package:street_auction/features/auth/domain/repo/base_auth_repo.dart';
import 'package:street_auction/features/auth/domain/usecases/login_usecase.dart';
import 'package:street_auction/features/auth/ui/cubit/login_cubit.dart';

class AppDependencyInjection {
  static void setupGetIt() {
    // Initialize Dio
    GetIt.instance.registerLazySingleton<Dio>(() => DioFactory.instance.dio);

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
    GetIt.instance.registerFactory<LoginCubit>(
      () => LoginCubit(GetIt.instance<LoginUseCase>()),
    );

    // Home
  }
}
