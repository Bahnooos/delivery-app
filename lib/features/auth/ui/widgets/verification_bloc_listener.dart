import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:delivery_app/core/routing/routes.dart';
import 'package:delivery_app/core/theme/app_color.dart';
import 'package:delivery_app/features/auth/logic/verify_cubit/verification_cubit.dart';
import 'package:delivery_app/features/auth/logic/verify_cubit/verification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationBlocListener extends StatelessWidget {
  const VerificationBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationCubit, VerificationStates>(
      listener: (context, state) {
        switch (state) {
          case VerificationLoadingState():
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            );
          case VerificationSuccessState():
            context.pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Verification successful'),
                backgroundColor: Colors.green,
              ),
            );
            context.pushNamed(Routes.notificationScreen);
            break;
          case VerificationErrorState(failure: final errorMessage):
            context.pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage.message ?? ''),
                backgroundColor: Colors.red,
              ),
            );
            break;

          case ResendVerificationSuccessState(message: final successMessage):
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  successMessage ?? 'Verification code resent successfully',
                ),
                backgroundColor: Colors.green,
              ),
            );
            break;

          case ResendVerificationErrorState(failure: final resendErrorMessage):
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(resendErrorMessage.message ?? ''),
                backgroundColor: Colors.red,
              ),
            );
            break;
          default:
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
