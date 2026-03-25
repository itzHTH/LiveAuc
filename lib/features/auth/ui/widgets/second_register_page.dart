import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:street_auction/core/theme/app_color.dart';
import 'package:street_auction/core/theme/app_text_styles.dart';
import 'package:street_auction/features/auth/domain/entities/request_email_otp.dart';
import 'package:street_auction/features/auth/domain/entities/verfiy_email_otp.dart';
import 'package:street_auction/features/auth/ui/cubit/register/register_cubit.dart';

class SecondRegisterPage extends StatefulWidget {
  const SecondRegisterPage({
    super.key,
    required this.onNext,
    required this.email,
  });

  final VoidCallback onNext;
  final TextEditingController email;

  @override
  State<SecondRegisterPage> createState() => _SecondRegisterPageState();
}

class _SecondRegisterPageState extends State<SecondRegisterPage> {
  Future<void> _onOtpCompleted(String value) async {
    final cubit = context.read<RegisterCubit>();
    await cubit.verifyEmailOtp(
      VerifyEmailOtp(email: widget.email.text, otp: value),
    );

    if (!context.mounted) return;

    if (cubit.state is VerifyOtpSuccess) {
      widget.onNext.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Please check your email for the account configuration link",
          style: AppTextStyles.font20BlackMedium,
          textAlign: TextAlign.center,
        ),
        Gap(16.h),
        Text(
          "An account activation link has been sent to your email address",
          style: AppTextStyles.font16GrayRegular,
          textAlign: TextAlign.center,
        ),

        // email field
        Gap(44.h),
        Pinput(
          length: 6,
          onCompleted: _onOtpCompleted,
          onClipboardFound: _onOtpCompleted,
          defaultPinTheme: PinTheme(
            width: 64.w,
            height: 64.h,
            textStyle: AppTextStyles.font20BlackMedium,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColor.uiGray),
            ),
          ),
        ),

        // continue button
        Gap(32.h),
        Text(
          "Haven't received the configuration link? ",
          style: AppTextStyles.font14GrayRegular,
        ),
        TextButton(
          onPressed: () async {
            final cubit = context.read<RegisterCubit>();
            await cubit.requestEmailOtp(
              RequestEmailOtp(email: widget.email.text),
            );
          },
          child: Text(
            "Resend Email",
            style: AppTextStyles.font14Primary500Medium,
          ),
        ),
      ],
    );
  }
}
