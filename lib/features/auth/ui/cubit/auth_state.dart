part of 'auth_cubit.dart';

@freezed
class AuthState<T> with _$AuthState<T> {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = Loading;
  const factory AuthState.success(T auth) = Success;
  const factory AuthState.error(String error) = Error;
}
