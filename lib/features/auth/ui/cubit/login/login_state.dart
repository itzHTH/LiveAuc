part of 'login_cubit.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(T auth) = Success;
  const factory LoginState.logoutSuccess() = LogoutSuccess;
  const factory LoginState.error(String error) = Error;
}
