import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:delivery_app/core/theme/app_color.dart';
import 'package:delivery_app/core/theme/font_weight_helper.dart';
import 'package:delivery_app/features/onbording/data/models/onbording_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnbordingItem extends StatelessWidget {
  const OnbordingItem({super.key, required this.onbordingPageModel});
  final OnbordingPageModel onbordingPageModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(onbordingPageModel.image ?? '', height: 292.h, width: 240.w),
        30.verticalSpace,
        Text(
          onbordingPageModel.title ?? '',
          style: context.font22TextPrimarySemiBold?.copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeightHelper.extraBold,
            color: AppColors.textDark,
          ),
          textAlign: TextAlign.center,
        ),
        12.verticalSpace,
        Text(
          onbordingPageModel.description,
          style: context.font16TextDarkRegular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
