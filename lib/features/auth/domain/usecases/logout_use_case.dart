import 'package:dio/dio.dart';
import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/core/usecase/cancellable_use_case.dart';
import 'package:street_auction/features/auth/domain/repo/base_auth_repo.dart';

class LogoutUseCase extends CancellableUseCase<ApiResults<void>, void> {
  final BaseAuthRepo _baseAuthRepo;
  LogoutUseCase(this._baseAuthRepo);

  @override
  Future<ApiResults<void>> execute(void params, CancelToken cancelToken) async {
    return await _baseAuthRepo.logout(cancelToken: cancelToken);
  }
}
