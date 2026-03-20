import 'package:flutter/material.dart';
import 'package:street_auction/core/routing/app_routes_name.dart';
import 'package:street_auction/features/auth/ui/screens/auth_main_screen.dart';
import 'package:street_auction/features/auth/ui/screens/login_screen.dart';
import 'package:street_auction/features/home/ui/screens/home_screen.dart';
import 'package:street_auction/features/onborading/screens/onboarding_screen.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case AppRoutes.auth:
        return MaterialPageRoute(builder: (context) => const AuthMainScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
    }
  }
}
