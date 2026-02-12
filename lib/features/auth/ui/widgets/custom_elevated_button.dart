import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:delivery_app/core/theme/app_color.dart';
import 'package:delivery_app/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    required this.text,
    this.color,
    this.isSkipButton,
  });
  final VoidCallback? onPressed;
  final String text;
  final Color? color;
  final bool? isSkipButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 62.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        backgroundColor: color == null ? AppColors.primary : Colors.white,
      ),
      child: Text(
        text,
        style: context.font14TextSecondaryRegular?.copyWith(
          fontWeight: FontWeightHelper.bold,
          color: isSkipButton == null ? AppColors.textDark : Colors.white,
        ),
      ),
    );
  }
}
