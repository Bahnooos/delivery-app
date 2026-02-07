import 'package:delivery_app/core/helpers/app_regex.dart';
import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:delivery_app/core/widgets/app_text_form_field.dart';
import 'package:delivery_app/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email', style: context.font13TextHintRegular),
          8.verticalSpace,
          AppTextFormField(
            controller: context.read<LoginCubit>().emailController,
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
          Text('Password', style: context.font13TextHintRegular),
          8.verticalSpace,
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
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
        ],
      ),
    );
  }
}
