import 'package:street_auction/core/const/app_constants.dart';
import 'package:street_auction/core/helpers/app_version.dart';
import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/core/usecase/base_use_case.dart';
import 'package:street_auction/features/splash/domain/entities/app_check_result.dart';
import 'package:street_auction/features/splash/domain/repos/base_app_status_repo.dart';

class GetAppStatusUseCase
    implements BaseUseCase<ApiResults<AppCheckResult>, void> {
  BaseAppStatusRepo baseAppStatusRepo;

  GetAppStatusUseCase({required this.baseAppStatusRepo});

  @override
  Future<ApiResults<AppCheckResult>> call(void params) async {
    final result = await baseAppStatusRepo.getAppStatus();
    return result.when(
      success: (data) {
        // Maintenance mode
        if (data.isMaintenance) {
          return ApiResults.success(MaintenanceMode(data.message));
        }
        // Force update mode
        else if (data.updateRequired || data.isBanned) {
          return ApiResults.success(ForceUpdate(storeUrl: data.storeUrl ?? ''));
        }
        // Optional update mode
        else if (AppVersion.parse(
              AppConstants.appVersion,
            ).compareTo(AppVersion.parse(data.currentVersion)) <
            0) {
          return ApiResults.success(
            OptionalUpdate(storeUrl: data.storeUrl ?? ''),
          );
        }
        // App is up to date
        else {
          return const ApiResults.success(AppOk());
        }
      },
      // Failure case
      failure: (failure) {
        return ApiResults.failure(failure);
      },
    );
  }
}
