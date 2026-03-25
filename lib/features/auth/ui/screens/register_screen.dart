import 'package:flutter/material.dart';
import 'package:street_auction/features/auth/ui/widgets/auth_page_controller.dart';
import 'package:street_auction/features/auth/ui/widgets/auth_page_layout.dart';
import 'package:street_auction/features/auth/ui/widgets/first_register_page.dart';
import 'package:street_auction/features/auth/ui/widgets/register_bloc_listener.dart';
import 'package:street_auction/features/auth/ui/widgets/second_register_page.dart';
import 'package:street_auction/features/auth/ui/widgets/third_register_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
        FirstRegisterPage(
          onNext: _pageController.nextPage,
          emailController: _emailController,
        ),
        SecondRegisterPage(
          onNext: _pageController.nextPage,
          email: _emailController,
        ),
        const ThirdRegisterPage(),
      ],
      blocListener: const RegisterBlocListener(child: SizedBox.shrink()),
    );
  }
}
