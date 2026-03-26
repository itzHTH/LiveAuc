import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:street_auction/core/routing/app_routes_name.dart';
import 'package:street_auction/features/auth/ui/cubit/forget_password/forget_password_cubit.dart';
import 'package:street_auction/features/auth/ui/cubit/login/login_cubit.dart';
import 'package:street_auction/features/auth/ui/cubit/register/register_cubit.dart';
import 'package:street_auction/features/auth/ui/screens/auth_main_screen.dart';
import 'package:street_auction/features/auth/ui/screens/forget_password_screen.dart';
import 'package:street_auction/features/auth/ui/screens/login_screen.dart';
import 'package:street_auction/features/auth/ui/screens/register_screen.dart';
import 'package:street_auction/features/home/ui/screens/home_screen.dart';
import 'package:street_auction/features/onborading/screens/onboarding_screen.dart';
import 'package:street_auction/features/splash/ui/cubit/app_status_cubit.dart';
import 'package:street_auction/features/splash/ui/screens/force_update_screen.dart';
import 'package:street_auction/features/splash/ui/screens/splash_screen.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => GetIt.instance<AppStatusCubit>(),
            child: const SplashScreen(),
          ),
        );
      case AppRoutes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case AppRoutes.auth:
        return MaterialPageRoute(builder: (context) => const AuthMainScreen());
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => GetIt.instance<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case AppRoutes.register:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => GetIt.instance<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case AppRoutes.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => GetIt.instance<ForgetPasswordCubit>(),
            child: const ForgetPasswordScreen(),
          ),
        );
      case AppRoutes.forceUpdate:
        final args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => ForceUpdateScreen(storeUrl: args),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => GetIt.instance<LoginCubit>(),
            child: const HomeScreen(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
