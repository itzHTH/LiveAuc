import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:street_auction/core/helpers/app_validators.dart';
import 'package:street_auction/core/theme/app_color.dart';
import 'package:street_auction/core/widgets/app_text_form_field.dart';
import 'package:street_auction/features/auth/domain/entities/login_request.dart';
import 'package:street_auction/features/auth/ui/cubit/login/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) : _formKey = formKey,
       _emailController = emailController,
       _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: widget._emailController,
            hintText: 'Email',
            validator: AppValidators.email,
          ),
          const SizedBox(height: 16),
          AppTextFormField(
            isObscureText: isPasswordVisible,
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              color: AppColor.uiGray,
              iconSize: 20.sp,
              icon: Icon(
                isPasswordVisible
                    ? Icons.visibility_rounded
                    : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ),
            controller: widget._passwordController,
            hintText: 'Password',
            validator: AppValidators.password,
          ),
          const SizedBox(height: 32),

          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  // Trigger Login
                  if (widget._formKey.currentState!.validate()) {
                    context.read<LoginCubit>().login(
                      LoginRequest(
                        email: widget._emailController.text,
                        password: widget._passwordController.text,
                      ),
                    );
                  }
                },
                child: const Text('Sign In'),
              );
            },
          ),
        ],
      ),
    );
  }
}
