import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/core/usecase/base_use_case.dart';
import 'package:street_auction/features/auth/domain/entities/auth.dart';
import 'package:street_auction/features/auth/domain/entities/login_request.dart';
import 'package:street_auction/features/auth/domain/repo/base_auth_repo.dart';

class LoginUseCase implements BaseUseCase<ApiResults<Auth>, LoginRequest> {
  final BaseAuthRepo _baseAuthRepo;

  LoginUseCase(this._baseAuthRepo);

  @override
  Future<ApiResults<Auth>> call(LoginRequest params) async {
    return await _baseAuthRepo.login(params);
  }
}
