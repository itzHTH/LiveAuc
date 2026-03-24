import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/features/auth/domain/entities/auth.dart';
import 'package:street_auction/features/auth/domain/entities/login_request.dart';
import 'package:street_auction/features/auth/domain/usecases/login_usecase.dart';
import 'package:street_auction/features/auth/domain/usecases/logout_use_case.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState<Auth>> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  LoginCubit(this.loginUseCase, this.logoutUseCase)
    : super(const LoginState.initial());

  Future<void> login(LoginRequest request) async {
    emit(const LoginState.loading());
    final result = await loginUseCase.call(request);
    result.when(
      success: (data) {
        emit(LoginState.success(data));
      },
      failure: (error) {
        emit(LoginState.error(error.apiErrorModel.message ?? "Unknown Error"));
      },
    );
  }

  Future<void> logout() async {
    emit(const LoginState.loading());
    final result = await logoutUseCase.call(null);
    result.when(
      success: (data) {
        emit(const LoginState.logoutSuccess());
      },
      failure: (error) {
        emit(LoginState.error(error.apiErrorModel.message ?? "Unknown Error"));
      },
    );
  }
}
