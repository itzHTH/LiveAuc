import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:street_auction/core/helpers/app_validators.dart';
import 'package:street_auction/core/theme/app_color.dart';
import 'package:street_auction/core/theme/app_text_styles.dart';
import 'package:street_auction/core/widgets/app_snack_bar.dart';
import 'package:street_auction/core/widgets/app_text_form_field.dart';
import 'package:street_auction/features/auth/ui/widgets/register_form.dart';

class FirstRegisterPage extends StatelessWidget {
  const FirstRegisterPage({super.key, required this.onNext});

  final VoidCallback onNext;

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
        const AppTextFormField(
          hintText: "Email Address",
          validator: AppValidators.email,
        ),

        // continue button
        Gap(32.h),
        ElevatedButton(
          onPressed: () {
            onNext.call();
          },
          child: const Text("Submit"),
        ),
      ],
    );
  }
}

class SecondRegisterPage extends StatelessWidget {
  const SecondRegisterPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "PPlease check your email for the account configuration link",
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
          onCompleted: (value) => onNext.call(),
          onClipboardFound: (value) => onNext.call(),
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
          onPressed: () {},
          child: Text(
            "Resend Email",
            style: AppTextStyles.font14Primary500Medium,
          ),
        ),
      ],
    );
  }
}

class ThirdRegisterPage extends StatefulWidget {
  const ThirdRegisterPage({super.key, required this.onNext});

  final VoidCallback onNext;

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
          onPressed: () {
            if (!_isAgreed) {
              AppSnackBar.showWarning(
                context: context,
                message: "Please agree to the terms and conditions",
              );
              return;
            }
            if (_formKey.currentState!.validate()) {
              widget.onNext.call();
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
