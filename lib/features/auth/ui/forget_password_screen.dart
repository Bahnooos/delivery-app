import 'package:delivery_app/core/helpers/app_regex.dart';
import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:delivery_app/core/widgets/app_text_form_field.dart';
import 'package:delivery_app/features/auth/logic/forget_password_cubit/forget_and_reset_password_cubit.dart';
import 'package:delivery_app/features/auth/ui/widgets/auth_form_container.dart';
import 'package:delivery_app/features/auth/ui/widgets/auth_header.dart';
import 'package:delivery_app/features/auth/ui/widgets/custom_elevated_button.dart';
import 'package:delivery_app/features/auth/ui/widgets/forget_password_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_color.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
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
                    Text('Email', style: context.font13TextHintRegular),
                    8.verticalSpace,
                    AppTextFormField(
                      controller: _emailController,
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
                    12.verticalSpace,
                    CustomElevatedButton(
                      text: 'SEND CODE',
                      onPressed: () => context
                          .read<ForgetAndResetPasswordCubit>()
                          .emitForgetPasswordState(
                            email: _emailController.text.trim(),
                          ),
                    ),
                    ForgetPasswordBlocListener(email: _emailController.text.trim()),
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
