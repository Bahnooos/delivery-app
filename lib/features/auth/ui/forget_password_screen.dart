import 'package:delivery_app/features/auth/ui/widgets/auth_form_container.dart';
import 'package:delivery_app/features/auth/ui/widgets/auth_header.dart';
import 'package:delivery_app/features/auth/ui/widgets/custom_elevated_button.dart';
import 'package:delivery_app/features/auth/ui/widgets/email_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_color.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authBackGround,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AuthHeader(
                title: 'Forgot Password',
                subtitle:
                    'Please enter your email to receive a password reset link',
                showBack: true,
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
                    12.verticalSpace,
                    CustomElevatedButton(text: 'SEND CODE', onPressed: () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
