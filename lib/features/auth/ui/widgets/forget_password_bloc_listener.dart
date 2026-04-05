import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:street_auction/core/routing/app_routes_name.dart';
import 'package:street_auction/core/widgets/app_loading_dialog.dart';
import 'package:street_auction/core/widgets/app_snack_bar.dart';
import 'package:street_auction/features/auth/ui/cubit/forget_password/forget_password_cubit.dart';

class ForgetPasswordBlocListener extends StatelessWidget {
  const ForgetPasswordBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listenWhen: (previous, current) =>
          current is FpLoading ||
          current is FpOtpSent ||
          current is FpVerifyOtpSuccess ||
          current is FpResetSuccess ||
          current is FpError,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            AppLoadingDialog.show(
              context,
              onCancel: () {
                context.read<ForgetPasswordCubit>().cancelCurrentRequest();
              },
            );
          },
          otpSent: () {
            AppLoadingDialog.hide(context);
            AppSnackBar.showSuccess(
              context: context,
              message: 'OTP Sent Successfully',
            );
          },
          verifyOtpSuccess: (_) {
            AppLoadingDialog.hide(context);
            AppSnackBar.showSuccess(
              context: context,
              message: 'OTP Verified Successfully',
            );
          },
          resetSuccess: () {
            AppLoadingDialog.hide(context);
            AppSnackBar.showSuccess(
              context: context,
              message: 'Password Reset Successfully',
            );
            SchedulerBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushReplacementNamed(AppRoutes.login);
              }
            });
          },
          error: (error) {
            AppLoadingDialog.hide(context);
            AppSnackBar.showError(context: context, message: error);
          },
        );
      },
      child: child,
    );
  }
}
