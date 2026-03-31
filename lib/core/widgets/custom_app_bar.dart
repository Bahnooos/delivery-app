import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:delivery_app/core/theme/app_color.dart';
import 'package:delivery_app/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: ShapeDecoration(
            shape: CircleBorder(),
            color: AppColors.arrowBackAppBar,
          ),
          child: Center(
            child: SvgPicture.asset(AppImages.arrowBack, width: 24, height: 24),
          ),
        ),
        SizedBox(width: 16),
        Text(title, style: context.font16TextDarkRegular),
      ],
    );
  }
}
