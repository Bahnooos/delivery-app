import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  final VoidCallback? onTap;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                icon,
                size: 20.sp,
                color: iconColor,
              ),
            ),

            SizedBox(width: 16.w),

            Expanded(
              child: Text(
                title,
                style: context.font16TextDarkRegular?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: context.font13TextHintRegular?.color,
            ),
          ],
        ),
      ),
    );
  }
}