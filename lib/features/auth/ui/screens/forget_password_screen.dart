import 'package:flutter/material.dart';
import 'package:street_auction/features/auth/ui/widgets/auth_page_controller.dart';
import 'package:street_auction/features/auth/ui/widgets/auth_page_layout.dart';
import 'package:street_auction/features/auth/ui/widgets/first_forget_password_page.dart';
import 'package:street_auction/features/auth/ui/widgets/forget_password_bloc_listener.dart';
import 'package:street_auction/features/auth/ui/widgets/second_forget_password_page.dart';
import 'package:street_auction/features/auth/ui/widgets/third_forget_password_page.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _emailController = TextEditingController();
  final _pageController = AuthPageController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
      controller: _pageController,
      pages: [
        FirstForgetPasswordPage(
          onNext: _pageController.nextPage,
          emailController: _emailController,
        ),
        SecondForgetPasswordPage(
          onNext: _pageController.nextPage,
          email: _emailController,
        ),
        ThirdForgetPasswordPage(email: _emailController),
      ],
      blocListener: const ForgetPasswordBlocListener(child: SizedBox.shrink()),
    );
  }
}
