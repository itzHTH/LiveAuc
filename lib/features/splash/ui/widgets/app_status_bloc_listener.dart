import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:street_auction/core/const/app_constants.dart';
import 'package:street_auction/core/helpers/app_local_cache.dart';
import 'package:street_auction/core/helpers/navigation_extension.dart';
import 'package:street_auction/core/routing/app_routes_name.dart';

import 'package:street_auction/core/helpers/app_url_launcher.dart';
import 'package:street_auction/core/theme/app_text_styles.dart';
import 'package:street_auction/core/widgets/app_bottom_sheet.dart';
import 'package:street_auction/features/splash/domain/entities/app_check_result.dart';
import 'package:street_auction/features/splash/ui/cubit/app_status_cubit.dart';
import 'package:street_auction/features/splash/ui/cubit/app_status_state.dart';

class AppStatusBlocListener extends StatefulWidget {
  const AppStatusBlocListener({super.key, required this.child});

  final Widget child;

  @override
  State<AppStatusBlocListener> createState() => _AppStatusBlocListenerState();
}

class _AppStatusBlocListenerState extends State<AppStatusBlocListener> {
  /// Check if the app is first time or not
  /// and if not first time check if the user is logged in or not
  Future<void> _checkFirstTimeAndTokens() async {
    final bool? isFirstTime = await AppLocalCache.getBool(
      AppConstants.isFirstTimeKey,
    );

    if (isFirstTime == true || isFirstTime == null) {
      context.pushNamedAndRemoveUntil(AppRoutes.onboarding);
    } else {
      await _checkTokens();
    }
  }

  /// Check if the user is logged in or not
  Future<void> _checkTokens() async {
    final String? token = await AppLocalCache.getSecuredString(
      AppConstants.tokenKey,
    );
    final String? refreshToken = await AppLocalCache.getSecuredString(
      AppConstants.refreshTokenKey,
    );

    if (token != null && refreshToken != null) {
      context.pushNamedAndRemoveUntil(AppRoutes.home);
    } else {
      context.pushNamedAndRemoveUntil(AppRoutes.auth);
    }
  }

  /// Shows optional update bottom sheet then navigates on skip
  Future<void> _showOptionalUpdateSheet(
    BuildContext context,
    String storeUrl,
  ) async {
    await AppBottomSheet.show(
      context: context,
      isDismissible: true,
      title: 'New Update',
      body: Text(
        'There is a new version of the app. You can update now or later.',
        style: AppTextStyles.font16GrayRegular,
      ),
      primaryLabel: 'Update Now',
      onPrimary: () async {
        await AppUrlLauncher.launch(storeUrl);
        if (context.mounted) Navigator.pop(context, true);
      },
      secondaryLabel: 'Later',
      onSecondary: () => Navigator.pop(context, false),
    );
    // After sheet closes (either action), navigate normally
    if (context.mounted) await _checkFirstTimeAndTokens();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppStatusCubit, AppStatusState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      listener: (context, state) {
        switch (state) {
          case Success(:final appCheckResult):
            switch (appCheckResult) {
              case ForceUpdate data:
                debugPrint("ForceUpdate: ${data.storeUrl}");
              // TODO: Navigate to force update screen
              // context.pushNamedAndRemoveUntil(AppRoutes.forceUpdate);
              case OptionalUpdate data:
                debugPrint("OptionalUpdate: ${data.storeUrl}");
                _showOptionalUpdateSheet(context, data.storeUrl);
              case MaintenanceMode data:
                debugPrint("MaintenanceMode: ${data.message}");
              // TODO: Navigate to maintenance screen
              // context.pushNamedAndRemoveUntil(AppRoutes.maintenance);
              case AppOk():
                debugPrint("AppOk");
                _checkFirstTimeAndTokens();
            }
          case Failure(:final error):
            debugPrint("Failure: $error");
          default:
            break;
        }
      },
      child: widget.child,
    );
  }
}
