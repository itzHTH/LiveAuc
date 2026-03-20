import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:street_auction/core/helpers/navigation_extension.dart';
import 'package:street_auction/core/routing/app_routes_name.dart';
import 'package:street_auction/core/widgets/app_loading_dialog.dart';
import 'package:street_auction/features/auth/domain/entities/auth.dart';
import 'package:street_auction/features/auth/ui/cubit/auth_cubit.dart';

class AuthBlocListener extends StatelessWidget {
  const AuthBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState<Auth>>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            AppLoadingDialog.show(context);
          },
          success: (auth) {
            AppLoadingDialog.hide(context);
            context.pushReplacementNamed(AppRoutes.home);
          },
          error: (error) {
            AppLoadingDialog.hide(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error),
                backgroundColor: const Color(0xFFFF5959),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
        );
      },
      child: child,
    );
  }
}
