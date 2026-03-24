import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:street_auction/core/helpers/app_validators.dart';
import 'package:street_auction/core/theme/app_text_styles.dart';
import 'package:street_auction/core/widgets/app_text_form_field.dart';
import 'package:street_auction/features/auth/domain/entities/request_email_otp.dart';
import 'package:street_auction/features/auth/ui/cubit/forget_password/forget_password_cubit.dart';

class FirstForgetPasswordPage extends StatefulWidget {
  const FirstForgetPasswordPage({
    super.key,
    required this.onNext,
    required this.emailController,
  });

  final VoidCallback onNext;
  final TextEditingController emailController;

  @override
  State<FirstForgetPasswordPage> createState() =>
      _FirstForgetPasswordPageState();
}

class _FirstForgetPasswordPageState extends State<FirstForgetPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Please provide your email address',
          style: AppTextStyles.font20BlackMedium,
          textAlign: TextAlign.center,
        ),
        Gap(16.h),
        Text(
          'We will send you an OTP to reset your password',
          style: AppTextStyles.font16GrayRegular,
          textAlign: TextAlign.center,
        ),
        Gap(44.h),
        Form(
          key: _formKey,
          child: AppTextFormField(
            controller: widget.emailController,
            hintText: 'Email Address',
            validator: AppValidators.email,
          ),
        ),
        Gap(32.h),
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final cubit = context.read<ForgetPasswordCubit>();
              await cubit.requestOtp(
                RequestEmailOtp(email: widget.emailController.text),
              );

              if (!mounted) return;
              if (cubit.state is FpOtpSent) {
                widget.onNext.call();
              }
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
