import 'package:delivery_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/extensions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authBackGround,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            118.verticalSpace,
            Text('Login', style: context.font28TextPrimaryBold),
            8.verticalSpace,
            Text(
              'Please sign in to your existing account',
              style: context.font16TextDarkRegular,
            ),
            24.verticalSpace,
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                ),
                color: AppColors.scaffold,
                
              ),
              child: Column(),
            ),
          ],
        ),
      ),
    );
  }
}
