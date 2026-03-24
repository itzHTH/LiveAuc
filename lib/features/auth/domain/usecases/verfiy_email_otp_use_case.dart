import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/core/usecase/base_use_case.dart';
import 'package:street_auction/features/auth/domain/entities/otp.dart';
import 'package:street_auction/features/auth/domain/entities/verfiy_email_otp.dart';
import 'package:street_auction/features/auth/domain/repo/base_auth_repo.dart';

class VerifyEmailOtpUseCase
    implements BaseUseCase<ApiResults<Otp>, VerifyEmailOtp> {
  final BaseAuthRepo _baseAuthRepo;

  VerifyEmailOtpUseCase(this._baseAuthRepo);

  @override
  Future<ApiResults<Otp>> call(VerifyEmailOtp params) async {
    return await _baseAuthRepo.verifyRegisterOtp(params);
  }
}
