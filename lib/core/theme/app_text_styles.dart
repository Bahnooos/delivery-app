import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String _fontFamily = 'Poppins';

  // -------------------------
  // Headings
  // -------------------------

  static final TextStyle font28TextPrimaryBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static final TextStyle font22TextPrimarySemiBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static final TextStyle font18TextMediumSemiBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textMedium,
  );

  // -------------------------
  // Body
  // -------------------------

  static final TextStyle font16TextDarkRegular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
    height: 1.5,
  );

  static final TextStyle font14TextSecondaryRegular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static final TextStyle font13TextHintRegular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
  );

  // -------------------------
  // Buttons
  // -------------------------

  static final TextStyle font16WhiteSemiBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // -------------------------
  // Caption / Helper
  // -------------------------

  static final TextStyle font11TextHintMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textHint,
  );
}
