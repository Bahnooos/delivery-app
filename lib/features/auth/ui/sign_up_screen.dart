import 'package:delivery_app/features/auth/ui/widgets/auth_form_container.dart';
import 'package:delivery_app/features/auth/ui/widgets/auth_header.dart';
import 'package:delivery_app/features/auth/ui/widgets/email_text_form_field.dart';
import 'package:delivery_app/features/auth/ui/widgets/login_button.dart';
import 'package:delivery_app/features/auth/ui/widgets/name_text_form_field.dart';
import 'package:delivery_app/features/auth/ui/widgets/password_text_form_field.dart';
import 'package:delivery_app/features/auth/ui/widgets/phone_text_form_field.dart';
import 'package:delivery_app/features/auth/ui/widgets/re_type_password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_color.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authBackGround,
      body: Column(
        mainAxisAlignment: .center,
        children: [
          AuthHeader(
            title: 'Sign Up',
            subtitle: 'Create a new account',
            showBack: true,
          ),
          24.verticalSpace,
          Expanded(
            child: AuthFormContainer(
              child: Column(
                spacing: 12.h,
                children: [
                  NameTextFormField(),
                  EmailTextFormField(),
                  PhoneTextFormField(),
                  PasswordTextFormField(),
                  ReTypePasswordTextFormField(),
                  LoginButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
