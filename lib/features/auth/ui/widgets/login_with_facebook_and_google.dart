import 'package:delivery_app/core/theme/app_images.dart';
import 'package:delivery_app/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginWithFacebookAndGoogle extends StatelessWidget {
  const LoginWithFacebookAndGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 24.w,
      children: [
        IconButton(
          onPressed: () =>context.read<LoginCubit>().facebookLogin(),
          icon: SvgPicture.asset(
            AppImages.facebookLogo,
            width: 62.w,
            height: 62.h,
          ),
        ),

        IconButton(
          onPressed: () =>context.read<LoginCubit>().googleLogin(),
          icon: SvgPicture.asset(
            AppImages.googleLogo,
            width: 62.w,
            height: 62.h,
          ),
        ),
      ],
    );
  }
}
