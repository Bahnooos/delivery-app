import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:delivery_app/core/routing/routes.dart';
import 'package:delivery_app/features/auth/ui/widgets/custom_elevated_button.dart';
import 'package:delivery_app/features/onbording/data/models/onbording_page_model.dart';
import 'package:delivery_app/features/onbording/ui/widgets/onbording_item.dart';
import 'package:delivery_app/features/onbording/ui/widgets/smooth_page_indicators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 40.h),
          child: Column(
            children: [
              80.verticalSpace,
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: onbordingPages.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      OnbordingItem(onbordingPageModel: onbordingPages[index]),
                ),
              ),
              20.verticalSpace,
              SmoothPageIndicators(pageController: pageController),
              40.verticalSpace,
              CustomElevatedButton(
                text: 'Next',
                onPressed: () => pageController.page == onbordingPages.length - 1
                    ? context.pushNamed(Routes.loginScreen)
                    : pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.bounceInOut,
                      ),
              ),
              10.verticalSpace,
              CustomElevatedButton(
                text: 'Skip',
                color: Colors.white,
                onPressed: () => context.pushNamed(Routes.loginScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
