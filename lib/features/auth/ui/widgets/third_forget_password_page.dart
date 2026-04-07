import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:street_auction/core/helpers/app_validators.dart';
import 'package:street_auction/core/theme/app_color.dart';
import 'package:street_auction/core/theme/app_text_styles.dart';
import 'package:street_auction/core/widgets/app_text_form_field.dart';
import 'package:street_auction/features/auth/domain/entities/reset_password_request.dart';
import 'package:street_auction/features/auth/ui/cubit/forget_password/forget_password_cubit.dart';

class ThirdForgetPasswordPage extends StatefulWidget {
  const ThirdForgetPasswordPage({super.key, required this.email});

  final TextEditingController email;

  @override
  State<ThirdForgetPasswordPage> createState() =>
      _ThirdForgetPasswordPageState();
}

class _ThirdForgetPasswordPageState extends State<ThirdForgetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;

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
          'Create a new password',
          style: AppTextStyles.font20BlackMedium,
          textAlign: TextAlign.center,
        ),
        Gap(16.h),
        Text(
          'Your new password must be different from your previous one',
          style: AppTextStyles.font16GrayRegular,
          textAlign: TextAlign.center,
        ),
        Gap(44.h),
        Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextFormField(
                controller: _passwordController,
                hintText: 'New Password',
                validator: AppValidators.password,
                isObscureText: !_isPasswordVisible,
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 20.sp,
                  color: AppColor.uiGray,
                  onPressed: () {
                    setState(() => _isPasswordVisible = !_isPasswordVisible);
                  },
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              Gap(16.h),
              AppTextFormField(
                controller: _confirmPasswordController,
                hintText: 'Confirm New Password',
                isObscureText: !_isPasswordVisible,
                validator: (value) => AppValidators.confirmPassword(
                  value,
                  _passwordController.text,
                ),
              ),
            ],
          ),
        ),
        Gap(32.h),
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final cubit = context.read<ForgetPasswordCubit>();
              final resetToken = cubit.resetToken;
              await cubit.resetPassword(
                ResetPasswordRequest(
                  email: widget.email.text,
                  password: _passwordController.text,
                  token: resetToken,
                ),
              );
            }
          },
          child: const Text('Reset Password'),
        ),
      ],
    );
  }
}
