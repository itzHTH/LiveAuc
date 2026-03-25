import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:street_auction/features/splash/domain/entities/app_status.dart';

part 'app_status_state.freezed.dart';

@freezed
class AppStatusState with _$AppStatusState {
  const factory AppStatusState.initial() = _Initial;
  const factory AppStatusState.loading() = _Loading;
  const factory AppStatusState.success(AppStatus appStatus) = _Success;
  const factory AppStatusState.failure(String error) = _Failure;
}
