import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/features/splash/domain/usecases/get_app_status_use_case.dart';
import 'package:street_auction/features/splash/ui/cubit/app_status_state.dart';

class AppStatusCubit extends Cubit<AppStatusState> {
  AppStatusCubit({required this.getAppStatusUseCase})
    : super(const AppStatusState.initial());
  final GetAppStatusUseCase getAppStatusUseCase;

  Future<void> getAppStatus() async {
    emit(const AppStatusState.loading());
    final result = await getAppStatusUseCase.call(null);
    result.when(
      success: (data) {
        emit(AppStatusState.success(data));
      },
      failure: (error) {
        emit(AppStatusState.failure(error.apiErrorModel.message ?? ""));
      },
    );
  }
}
