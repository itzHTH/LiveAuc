import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/core/usecase/base_use_case.dart';
import 'package:street_auction/features/auth/domain/entities/auth.dart';
import 'package:street_auction/features/auth/domain/entities/register_request.dart';
import 'package:street_auction/features/auth/domain/repo/base_auth_repo.dart';

class RegisterUseCase
    implements BaseUseCase<ApiResults<Auth>, RegisterRequest> {
  final BaseAuthRepo _baseAuthRepo;

  RegisterUseCase(this._baseAuthRepo);

  @override
  Future<ApiResults<Auth>> call(RegisterRequest params) async {
    return await _baseAuthRepo.register(params);
  }
}
