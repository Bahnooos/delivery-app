import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:delivery_app/core/theme/app_color.dart';
import 'package:delivery_app/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.arrowBackAppBar,
          radius: 20.r,
          child: SvgPicture.asset(
            AppImages.arrowBack,
            width: 5.w,
            height: 10.h,
          ),
        ),
        24.horizontalSpace,
        Text(title ?? '', style: context.font16TextDarkRegular),
      ],
    );
  }
}
