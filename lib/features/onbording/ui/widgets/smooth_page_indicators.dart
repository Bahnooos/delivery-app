import 'package:delivery_app/core/theme/app_color.dart';
import 'package:delivery_app/features/onbording/data/models/onbording_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPageIndicators extends StatelessWidget {
  const SmoothPageIndicators({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: onbordingPages.length,
      axisDirection: Axis.horizontal,
      effect: SlideEffect(
        spacing: 12.w,
        radius: 12.r,
        dotWidth: 12.w,
        dotHeight: 12.h,
        paintStyle: PaintingStyle.fill,
        dotColor: AppColors.gray,
        activeDotColor: AppColors.primary,
      ),

      onDotClicked: (index) => pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
      ),
    );
  }
}
