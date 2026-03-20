import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/features/auth/domain/entities/auth.dart';
import 'package:street_auction/features/auth/domain/entities/login_request.dart';
import 'package:street_auction/features/auth/domain/usecases/login_usecase.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState<Auth>> {
  final LoginUseCase loginUseCase;
  AuthCubit(this.loginUseCase) : super(const AuthState.initial());

  Future<void> login(LoginRequest request) async {
    emit(const AuthState.loading());
    final result = await loginUseCase.call(request);
    result.when(
      success: (data) {
        emit(AuthState.success(data));
      },
      failure: (error) {
        emit(AuthState.error(error.apiErrorModel.message ?? "Unknown Error"));
      },
    );
  }
}
