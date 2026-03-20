import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:street_auction/core/helpers/navigation_extension.dart';
import 'package:street_auction/core/routing/app_routes_name.dart';
import 'package:street_auction/core/theme/app_text_styles.dart';
import 'package:street_auction/core/widgets/app_snack_bar.dart';
import 'package:street_auction/features/auth/domain/entities/register_request.dart';
import 'package:street_auction/features/auth/ui/cubit/register/register_cubit.dart';
import 'package:street_auction/features/auth/ui/widgets/register_form.dart';

class ThirdRegisterPage extends StatefulWidget {
  const ThirdRegisterPage({super.key});

  @override
  State<ThirdRegisterPage> createState() => _ThirdRegisterPageState();
}

class _ThirdRegisterPageState extends State<ThirdRegisterPage> {
  bool _isAgreed = false;
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "It's a pleasure to meet you!",
          style: AppTextStyles.font20BlackMedium,
          textAlign: TextAlign.center,
        ),
        Gap(16.h),
        Text(
          "Sign up and get started",
          style: AppTextStyles.font16GrayRegular,
          textAlign: TextAlign.center,
        ),

        // register form
        Gap(44.h),
        RegisterForm(
          formKey: _formKey,
          firstNameController: _firstNameController,
          lastNameController: _lastNameController,
          passwordController: _passwordController,
          confirmPasswordController: _confirmPasswordController,
        ),

        // continue button
        Gap(32.h),
        ElevatedButton(
          onPressed: () async {
            if (!_isAgreed) {
              AppSnackBar.showWarning(
                context: context,
                message: "Please agree to the terms and conditions",
              );
              return;
            }
            if (_formKey.currentState!.validate()) {
              final cubit = context.read<RegisterCubit>();
              await cubit.register(
                RegisterRequest(
                  firstName: _firstNameController.text,
                  lastName: _lastNameController.text,
                  password: _passwordController.text,
                  registerToken:
                      (cubit.state as VerifyOtpSuccess).registerToken,
                ),
              );

              if (cubit.state is RegisterSuccess) {
                if (context.mounted) {
                  context.pushReplacementNamed(AppRoutes.home);
                }
              }
            }
          },
          child: const Text("Submit"),
        ),

        // terms and conditions
        Gap(16.h),
        Row(
          children: [
            Transform.scale(
              scale: 1.3,
              child: Checkbox(
                value: _isAgreed,
                onChanged: (value) {
                  setState(() {
                    _isAgreed = value!;
                  });
                },
              ),
            ),
            Expanded(
              child: Text.rich(
                TextSpan(
                  text: "By clicking \"Agree\" you accept the ",
                  style: AppTextStyles.font14GrayRegular,
                  children: [
                    TextSpan(
                      text: "terms and conditions",
                      style: AppTextStyles.font14Primary500Medium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
