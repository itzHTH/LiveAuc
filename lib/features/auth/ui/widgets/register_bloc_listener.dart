import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            AppLoadingDialog.show(context);
          },
          otpSent: () {
            AppLoadingDialog.hide(context);
            AppSnackBar.showSuccess(
              context: context,
              message: "Otp Sent Successfully",
            );
          },
          registerSuccess: (_) {
            AppLoadingDialog.hide(context);
            AppSnackBar.showSuccess(
              context: context,
              message: "Register Successfully",
            );
            SchedulerBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                Navigator.of(context, rootNavigator: true)
                    .pushReplacementNamed(AppRoutes.home);
              }
            });
          },
          verifyOtpSuccess: (_) {
            AppLoadingDialog.hide(context);
            AppSnackBar.showSuccess(
              context: context,
              message: "Verify Otp Successfully",
            );
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
