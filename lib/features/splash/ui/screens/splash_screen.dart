import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:street_auction/core/theme/app_color.dart';
import 'package:street_auction/features/splash/ui/cubit/app_status_cubit.dart';
import 'package:street_auction/features/splash/ui/widgets/animated_logo.dart';
import 'package:street_auction/features/splash/ui/widgets/animated_status_message.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _handleSplash();
  }

  Future<void> _handleSplash() async {
    await context.read<AppStatusCubit>().getAppStatus();
    // await Future.delayed(const Duration(seconds: 7));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.uiWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Spacer(flex: 3),
            AnimatedLogo(),
            Spacer(flex: 2),
            AnimatedStatusMessage(),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
