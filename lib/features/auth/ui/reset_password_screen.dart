import 'package:delivery_app/features/auth/ui/widgets/auth_form_container.dart';
import 'package:delivery_app/features/auth/ui/widgets/auth_header.dart';
import 'package:delivery_app/features/auth/ui/widgets/o_t_p_verify_reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_color.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authBackGround,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AuthHeader(
                title: 'Reset Password',
                subtitle:
                    'Please enter your code and OTP to set a new password',
                showBack: true,
              ),
            ),
            SliverToBoxAdapter(child: 40.verticalSpace),
            SliverFillRemaining(
              hasScrollBody: false,
              child: AuthFormContainer(
                child: Column(
                  spacing: 12.h,
                  children: [OTPVerifyResetPassword(email: widget.email)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
