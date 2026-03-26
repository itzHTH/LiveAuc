import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:street_auction/core/const/app_constants.dart';
import 'package:street_auction/core/helpers/app_local_cache.dart';
import 'package:street_auction/core/helpers/app_navigation.dart';
import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/core/routing/app_routes_name.dart';
import 'package:street_auction/features/splash/domain/usecases/get_app_status_use_case.dart';
import 'package:street_auction/features/splash/ui/cubit/app_status_state.dart';

class AppStatusCubit extends Cubit<AppStatusState> {
  AppStatusCubit({required this.getAppStatusUseCase})
    : super(const AppStatusState.initial());
  final GetAppStatusUseCase getAppStatusUseCase;

  Future<void> getAppStatus() async {
    emit(const AppStatusState.loading());
    final result = await getAppStatusUseCase.call(null);
    result.when(
      success: (data) {
        emit(AppStatusState.success(data));
        _checkFirstTimeAndTokens();
      },
      failure: (error) {
        emit(AppStatusState.failure(error.apiErrorModel.message ?? ""));
      },
    );
  }

  Future<void> _checkFirstTimeAndTokens() async {
    final bool? isFirstTime = await AppLocalCache.getBool(
      AppConstants.isFirstTimeKey,
    );

    if (isFirstTime == true || isFirstTime == null) {
      AppNavigation.pushNamedAndRemoveUntil(
        AppRoutes.onboarding,
        predicate: (route) => false,
      );
    } else {
      await _checkTokens();
    }
  }

  Future<void> _checkTokens() async {
    final String? token = await AppLocalCache.getSecuredString(
      AppConstants.tokenKey,
    );
    final String? refreshToken = await AppLocalCache.getSecuredString(
      AppConstants.refreshTokenKey,
    );

    if (token != null && refreshToken != null) {
      AppNavigation.pushNamedAndRemoveUntil(
        AppRoutes.home,
        predicate: (route) => false,
      );
    } else {
      AppNavigation.pushNamedAndRemoveUntil(
        AppRoutes.auth,
        predicate: (route) => false,
      );
    }
  }
}
