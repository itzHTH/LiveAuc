import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:street_auction/features/splash/domain/entities/app_check_result.dart';
part 'app_status_state.freezed.dart';

@freezed
class AppStatusState with _$AppStatusState {
  const factory AppStatusState.initial() = Initial;
  const factory AppStatusState.loading() = Loading;
  const factory AppStatusState.success(AppCheckResult appCheckResult) = Success;
  const factory AppStatusState.failure(String error) = Failure;
}
