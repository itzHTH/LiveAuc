import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/core/usecase/base_use_case.dart';
import 'package:street_auction/features/splash/domain/entities/app_status.dart';
import 'package:street_auction/features/splash/domain/repos/base_app_status_repo.dart';

class GetAppStatusUseCase implements BaseUseCase<ApiResults<AppStatus>, void> {
  BaseAppStatusRepo baseAppStatusRepo;

  GetAppStatusUseCase({required this.baseAppStatusRepo});

  @override
  Future<ApiResults<AppStatus>> call(void params) {
    return baseAppStatusRepo.getAppStatus();
  }
}
