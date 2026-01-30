import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_color.dart';

class DoNotHaveAccountSignUp extends StatelessWidget {
  const DoNotHaveAccountSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Text(
          'Don’t have an account?',
          style: context.font16TextDarkRegular?.copyWith(color: AppColors.gray),
        ),
        12.horizontalSpace,

        InkWell(
          onTap: () => context.pushNamed(Routes.signUpScreen),
          child: Text(
            'Sign Up',
            style: context.font14TextSecondaryRegular?.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
