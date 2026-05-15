import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:street_auction/core/analytics/analytics_events.dart';
import 'package:street_auction/core/analytics/analytics_service.dart';
import 'package:street_auction/core/routing/app_routes_name.dart';
import 'package:street_auction/core/widgets/app_loading_dialog.dart';
import 'package:street_auction/core/widgets/app_snack_bar.dart';
import 'package:street_auction/features/auth/ui/cubit/register/register_cubit.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is Loading ||
          current is OtpSent ||
          current is Error ||
          current is RegisterSuccess ||
          current is VerifyOtpSuccess,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            AppLoadingDialog.show(
              context,
              onCancel: () {
                context.read<RegisterCubit>().cancelCurrentRequest();
              },
            );
          },
          otpSent: () {
            GetIt.instance<AnalyticsService>().logEvent(
              name: AnalyticsEvents.registerOtpRequested,
              parameters: {'method': 'email'},
            );
            AppLoadingDialog.hide(context);
            AppSnackBar.showSuccess(
              context: context,
              message: "Otp Sent Successfully",
            );
          },
          registerSuccess: (_) {
            GetIt.instance<AnalyticsService>().logSignUp(method: 'email');
            AppLoadingDialog.hide(context);
            AppSnackBar.showSuccess(
              context: context,
              message: "Register Successfully",
            );
            SchedulerBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushReplacementNamed(AppRoutes.home);
              }
            });
          },
          verifyOtpSuccess: (_) {
            GetIt.instance<AnalyticsService>().logEvent(
              name: AnalyticsEvents.registerOtpVerified,
              parameters: {'method': 'email'},
            );
            AppLoadingDialog.hide(context);
            AppSnackBar.showSuccess(
              context: context,
              message: "Verify Otp Successfully",
            );
          },
          error: (error) {
            GetIt.instance<AnalyticsService>().logEvent(
              name: AnalyticsEvents.signUpFailed,
              parameters: {'error': error},
            );
            AppLoadingDialog.hide(context);
            AppSnackBar.showError(context: context, message: error);
          },
        );
      },
      child: child,
    );
  }
}
