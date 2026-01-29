import 'package:delivery_app/core/theme/app_color.dart';
import 'package:delivery_app/features/auth/ui/widgets/auth_form_container.dart';
import 'package:delivery_app/features/auth/ui/widgets/auth_header.dart';
import 'package:delivery_app/features/auth/ui/widgets/do_not_have_account_sign_up.dart';
import 'package:delivery_app/features/auth/ui/widgets/email_text_form_field.dart';
import 'package:delivery_app/features/auth/ui/widgets/login_button.dart';
import 'package:delivery_app/features/auth/ui/widgets/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/remember_me_and_forget_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authBackGround,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: AuthHeader(
              title: 'Log In',
              subtitle: 'Please sign in to your existing account',
              showBack: false,
            ),
          ),
          SliverToBoxAdapter(child: 40.verticalSpace),
          SliverFillRemaining(
            hasScrollBody: false,
            child: AuthFormContainer(
              child: Column(
                spacing: 12.h,
                children: [
                  EmailTextFormField(),
                  PasswordTextFormField(),
                  RememberMeAndForgetPassword(),
                  LoginButton(),
                  DoNotHaveAccountSignUp(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
