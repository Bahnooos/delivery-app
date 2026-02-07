import 'package:delivery_app/core/theme/app_color.dart';
import 'package:delivery_app/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:delivery_app/features/auth/ui/widgets/auth_form_container.dart';
import 'package:delivery_app/features/auth/ui/widgets/auth_header.dart';
import 'package:delivery_app/features/auth/ui/widgets/custom_elevated_button.dart';
import 'package:delivery_app/features/auth/ui/widgets/do_not_have_account_sign_up.dart';
import 'package:delivery_app/features/auth/ui/widgets/login_bloc_listener.dart';
import 'package:delivery_app/features/auth/ui/widgets/login_form.dart';
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
                  spacing: 12.h,
                  children: [
                    LoginForm(),
                    RememberMeAndForgetPassword(),
                    CustomElevatedButton(onPressed: () => validateThenDoLogin(context), text: 'Log In'),
                    DoNotHaveAccountSignUp(),
                    LoginBlocListener(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    
  }
  void validateThenDoLogin(BuildContext context){
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
