import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:street_auction/core/helpers/app_validators.dart';
import 'package:street_auction/core/theme/app_color.dart';
import 'package:street_auction/core/widgets/app_text_form_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController firstNameController,
    required TextEditingController lastNameController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
  }) : _formKey = formKey,
       _firstNameController = firstNameController,
       _lastNameController = lastNameController,
       _passwordController = passwordController,
       _confirmPasswordController = confirmPasswordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _firstNameController;
  final TextEditingController _lastNameController;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: widget._firstNameController,
            hintText: "Please enter your first name",
            validator: (value) =>
                AppValidators.name(value, fieldName: "First Name"),
          ),
          Gap(16.h),
          AppTextFormField(
            controller: widget._lastNameController,
            hintText: "Please enter your last name",
            validator: (value) =>
                AppValidators.name(value, fieldName: "Last Name"),
          ),

          Gap(16.h),
          AppTextFormField(
            controller: widget._passwordController,
            hintText: "Please enter your password",
            validator: AppValidators.password,
            isObscureText: _isPasswordVisible,
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              iconSize: 20.sp,
              color: AppColor.uiGray,
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),

          Gap(16.h),
          AppTextFormField(
            controller: widget._confirmPasswordController,
            hintText: "Please Confirm your password",
            validator: (value) => AppValidators.confirmPassword(
              value,
              widget._passwordController.text,
            ),
            isObscureText: _isPasswordVisible,
          ),
        ],
      ),
    );
  }
}
