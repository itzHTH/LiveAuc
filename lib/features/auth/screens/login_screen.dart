import 'package:flutter/material.dart';
import 'package:street_auction/core/helpers/navigation_extension.dart';
import 'package:street_auction/core/theme/app_text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.pop();
          },
        ),
      ),

      /// Body
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Title & Subtitle
              Text(
                'It\'s great to have you back!',
                style: AppTextStyles.font24BlackMedium,
              ),
              Text(
                'Sign in and continue your journey',
                style: AppTextStyles.font16GrayRegular,
              ),

              const SizedBox(height: 48),

              /// Login Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(hintText: 'Email'),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(hintText: 'Password'),
                    ),
                    const SizedBox(height: 32),

                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Sign In'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// Sign Up & Forgot Password Row
              Row(
                children: [
                  Text('New user?', style: AppTextStyles.font14BlackMedium),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      // TODO: Navigate to Register Screen
                    },
                    child: Text(
                      'Register',
                      style: AppTextStyles.font14Primary500Medium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
