import 'package:delivery_app/core/helpers/app_regex.dart';
import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:delivery_app/core/widgets/app_text_form_field.dart';
import 'package:delivery_app/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:delivery_app/features/auth/ui/widgets/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpFormField extends StatefulWidget {
  const SignUpFormField({super.key});

  @override
  State<SignUpFormField> createState() => _SignUpFormFieldState();
}

class _SignUpFormFieldState extends State<SignUpFormField> {
  bool isVisible = false;
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  bool hasMatched = false;

  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;
  late final TextEditingController phoneController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    passwordConfirmationController = TextEditingController();
    phoneController = context.read<SignUpCubit>().phoneController;
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
    passwordConfirmationController.addListener(() {
      setState(() {
        hasMatched =
            passwordController.text == passwordConfirmationController.text;
      });
    });
    phoneController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('First Name', style: context.font13TextHintRegular),
          8.verticalSpace,
          AppTextFormField(
            controller: context.read<SignUpCubit>().firstNameController,
            hintText: 'Enter Your First Name',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name';
              }
            },
          ),
          16.verticalSpace,
          Text('Last Name', style: context.font13TextHintRegular),
          8.verticalSpace,
          AppTextFormField(
            controller: context.read<SignUpCubit>().lastNameController,
            hintText: 'Enter Your Last Name',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your last name';
              }
            },
          ),
          16.verticalSpace,
          Text('Email', style: context.font13TextHintRegular),
          8.verticalSpace,
          AppTextFormField(
            controller: context.read<SignUpCubit>().emailController,
            hintText: 'example@gmail.com',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter your valid email';
              }
            },
          ),
          16.verticalSpace,
          Text('Phone Number', style: context.font13TextHintRegular),
          8.verticalSpace,
          AppTextFormField(
            controller: phoneController,
            hintText: 'Enter Your Phone Number',
            keyboardType: TextInputType.phone,
            prefixText: phoneController.text.isNotEmpty ? '+2' : null,

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              if (!AppRegex.isEgyptianPhoneValid(value)) {
                return 'Please enter a valid Egyptian phone number';
              }
            },
          ),
          16.verticalSpace,
          Text('Password', style: context.font13TextHintRegular),
          8.verticalSpace,
          AppTextFormField(
            controller: context.read<SignUpCubit>().passwordController,
            hintText: 'Enter Your Password',
            isObscureText: !isVisible,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (!AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              }
            },
            suffixIcon: InkWell(
              onTap: () => setState(() => isVisible = !isVisible),
              child: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
            ),
          ),
          16.verticalSpace,

          Text('Re-type Password', style: context.font13TextHintRegular),
          8.verticalSpace,
          AppTextFormField(
            hintText: 'Re-type Your Password',
            isObscureText: !isVisible,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your Confirmed password';
              }
              if (value !=
                  context.read<SignUpCubit>().passwordController.text) {
                return 'Passwords do not match';
              }
            },
            suffixIcon: InkWell(
              onTap: () => setState(() => isVisible = !isVisible),
              child: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
            ),
          ),
          8.verticalSpace,
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
            hasMatched: hasMatched,
          ),
        ],
      ),
    );
  }
}
