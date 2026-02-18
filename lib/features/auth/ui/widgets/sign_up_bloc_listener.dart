import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:delivery_app/core/routing/routes.dart';
import 'package:delivery_app/core/theme/app_color.dart';
import 'package:delivery_app/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:delivery_app/features/auth/logic/sign_up_cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignUpLoading ||
          current is SignUpSuccess ||
          current is SignUpError,
      listener: (context, state) {
        switch (state) {
          case SignUpInitial():
          case SignUpLoading():
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            );
            break;

          case SignUpSuccess():
            context.pop();
            showSuccessDialog(context);
            final email = context.read<SignUpCubit>().emailController.text;
            context.pushNamed(Routes.verificationScreen, argument: email);
          case SignUpError(failure: final error):
            setupErrorState(context, error.message);

            break;
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Signup Successful'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have signed up successfully!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
              onPressed: () {
                context.pop();
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }

  void setupErrorState(BuildContext context, String? error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(error??'', style: context.font16TextDarkRegular),
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
