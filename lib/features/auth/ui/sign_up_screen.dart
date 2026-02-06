import 'package:delivery_app/features/auth/ui/widgets/auth_form_container.dart';
import 'package:delivery_app/features/auth/ui/widgets/auth_header.dart';
import 'package:delivery_app/features/auth/ui/widgets/custom_elevated_button.dart';
import 'package:delivery_app/features/auth/ui/widgets/sign_up_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_color.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authBackGround,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              AuthHeader(
                title: 'Sign Up',
                subtitle: 'Create a new account',
                showBack: true,
              ),
              24.verticalSpace,
              AuthFormContainer(
                child: Column(
                  spacing: 12.h,
                  children: [
                    SignUpFormField(),
                    12.verticalSpace,
                    CustomElevatedButton(onPressed: () {}, text: 'Sign Up'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
