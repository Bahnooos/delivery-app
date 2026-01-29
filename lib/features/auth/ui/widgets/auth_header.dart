import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_images.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.showBack,
    required this.title,
    required this.subtitle,
  });
  final bool showBack;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: Stack(
        children: [
          Positioned(
            top: -5,
            left: 0,
            right: 0,
            child: Image.asset(AppImages.authBackground, fit: BoxFit.cover),
          ),
          if (showBack)
            Positioned(
              top: 48.h,
              left: 16,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20.r,
                child: IconButton(
                  icon: SvgPicture.asset(
                    AppImages.arrowBack,
                    width: 5.w,
                    height: 10.h,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),

          Positioned.fill(
            top: 110.h,
            left: 24.w,
            right: 24.w,
            child: Column(
              children: [
                Text(
                  title,
                  style: context.font28TextPrimaryBold?.copyWith(
                    color: Colors.white,
                  ),
                ),
                8.verticalSpace,
                Text(
                  subtitle,
                  style: context.font16TextDarkRegular?.copyWith(
                    color: AppColors.lightGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
