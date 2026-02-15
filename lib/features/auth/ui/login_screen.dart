import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:delivery_app/core/theme/app_color.dart';
import 'package:delivery_app/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:delivery_app/features/auth/ui/widgets/auth_form_container.dart';
import 'package:delivery_app/features/auth/ui/widgets/auth_header.dart';
import 'package:delivery_app/features/auth/ui/widgets/custom_elevated_button.dart';
import 'package:delivery_app/features/auth/ui/widgets/do_not_have_account_sign_up.dart';
import 'package:delivery_app/features/auth/ui/widgets/login_bloc_listener.dart';
import 'package:delivery_app/features/auth/ui/widgets/login_form.dart';
import 'package:delivery_app/features/auth/ui/widgets/login_with_facebook_and_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/remember_me_and_forget_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authBackGround,
      body: SafeArea(
        child: CustomScrollView(
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
                  children: [
                    LoginForm(),
                    12.verticalSpace,
                    RememberMeAndForgetPassword(),
                    12.verticalSpace,
                    CustomElevatedButton(
                      onPressed: () => validateThenDoLogin(context),
                      text: 'Log In',
                    ),
                    12.verticalSpace,
                    DoNotHaveAccountSignUp(),
                    12.verticalSpace,
                    LoginBlocListener(),
                    12.verticalSpace,
                    Text('OR', style: context.font16TextDarkRegular),
                    4.verticalSpace,
                    LoginWithFacebookAndGoogle(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
