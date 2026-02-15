import 'package:delivery_app/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginWithFacebookAndGoogle extends StatelessWidget {
  const LoginWithFacebookAndGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(onPressed: (){}, icon: SvgPicture.asset(AppImages.facebookLogo)),
        IconButton(onPressed: (){}, icon: SvgPicture.asset(AppImages.googleLogo)),
      ],
    );
  }
}