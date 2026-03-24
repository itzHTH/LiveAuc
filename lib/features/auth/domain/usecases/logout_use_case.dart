import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/core/usecase/base_use_case.dart';
import 'package:street_auction/features/auth/domain/repo/base_auth_repo.dart';

class LogoutUseCase extends BaseUseCase<void, void> {
  final BaseAuthRepo _baseAuthRepo;
  LogoutUseCase(this._baseAuthRepo);

  @override
  Future<ApiResults<void>> call(void params) async {
    return await _baseAuthRepo.logout();
  }
}
