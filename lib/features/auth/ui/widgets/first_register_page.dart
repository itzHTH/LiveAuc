import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:street_auction/core/helpers/app_validators.dart';
import 'package:street_auction/core/theme/app_text_styles.dart';
import 'package:street_auction/core/widgets/app_text_form_field.dart';
import 'package:street_auction/features/auth/domain/entities/request_email_otp.dart';
import 'package:street_auction/features/auth/ui/cubit/register/register_cubit.dart';

class FirstRegisterPage extends StatefulWidget {
  const FirstRegisterPage({
    super.key,
    required this.onNext,
    required this.emailController,
  });

  final VoidCallback onNext;
  final TextEditingController emailController;

  @override
  State<FirstRegisterPage> createState() => _FirstRegisterPageState();
}

class _FirstRegisterPageState extends State<FirstRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Please provide your email address",
          style: AppTextStyles.font20BlackMedium,
          textAlign: TextAlign.center,
        ),
        Gap(16.h),
        Text(
          "We need this information to verify your identity",
          style: AppTextStyles.font16GrayRegular,
          textAlign: TextAlign.center,
        ),

        // email field
        Gap(44.h),
        Form(
          key: _formKey,
          child: AppTextFormField(
            controller: widget.emailController,
            hintText: "Email Address",
            validator: AppValidators.email,
          ),
        ),

        // continue button
        Gap(32.h),
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final cubit = context.read<RegisterCubit>();
              await cubit.requestEmailOtp(
                RequestEmailOtp(email: widget.emailController.text),
              );

              if (!mounted) return;
              if (cubit.state is OtpSent) {
                widget.onNext.call();
              }
            }
          },
          child: const Text("Submit"),
        ),
      ],
    );
  }
}
