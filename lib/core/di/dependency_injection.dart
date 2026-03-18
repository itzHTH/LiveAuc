import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:street_auction/core/networking/dio_factory.dart';

class AppDependencyInjection {
  static void setupGetIt() {
    // Initialize Dio
    GetIt.instance.registerLazySingleton<Dio>(() => DioFactory.instance.dio);
  }
}
