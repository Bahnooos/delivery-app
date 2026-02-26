import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:delivery_app/core/routing/routes.dart';
import 'package:delivery_app/core/theme/app_color.dart';
import 'package:delivery_app/features/auth/logic/forget_password_cubit/forget_and_reset_password_cubit.dart';
import 'package:delivery_app/features/auth/logic/forget_password_cubit/forget_and_reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordBlocListener extends StatelessWidget {
  const ForgetPasswordBlocListener({super.key,this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    return BlocListener<
      ForgetAndResetPasswordCubit,
      ForgetAndResetPasswordState
    >(
      listenWhen: (previous, current) =>
          current is ForgetAndResetPasswordLoadingState ||
          current is ForgetPasswordSuccessState ||
          current is ForgetPasswordErrorState ||
          current is ResetPasswordSuccessState ||
          current is ResetPasswordErrorState,
      listener: (context, state) {
        switch (state) {
          case ForgetAndResetPasswordInitialState():
          case ForgetAndResetPasswordLoadingState():
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            );

          case ForgetPasswordSuccessState():
            context.pop();
            context.pushNamed(Routes.resetPasswordScreen, argument: email);
          case ForgetPasswordErrorState(failure: final error):
            setupErrorState(context, error.message);
          case ResetPasswordSuccessState<dynamic>():
            context.pop();
            context.pushNamed(Routes.notificationScreen);
          case ResetPasswordErrorState(failure: final error):
            setupErrorState(context, error.message);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String? error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(error ?? '', style: context.font16TextDarkRegular),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Got it', style: context.font14TextSecondaryRegular),
          ),
        ],
      ),
    );
  }
}
