import 'package:street_auction/core/const/app_constants.dart';
import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/core/networking/errors/error_handler.dart';
import 'package:street_auction/features/splash/data/services/app_status_api_service.dart';
import 'package:street_auction/features/splash/domain/entities/app_status.dart';
import 'package:street_auction/features/splash/domain/repos/base_app_status_repo.dart';

class AppStatusRepo extends BaseAppStatusRepo {
  AppStatusService appStatusService;

  AppStatusRepo({required this.appStatusService});

  @override
  Future<ApiResults<AppStatus>> getAppStatus() async {
    try {
      final response = await appStatusService.getAppStatus(
        AppConstants.appVersion,
      );
      return ApiResults.success(response.toEntity());
    } catch (e) {
      return ApiResults.failure(ErrorHandler.handle(e));
    }
  }
}
