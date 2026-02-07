import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:delivery_app/core/routing/routes.dart';
import 'package:delivery_app/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Future<void> _startApp() async {
    await Future.delayed(const Duration(seconds: 3));

    context.pushReplacementNamed(Routes.loginScreen);
  }

  Future<void> animate() async {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..forward();
  }

  @override
  void initState() {
    super.initState();
    animate();
    _startApp();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
              AppImages.splashEllipseTop,
              width: 157.w,
              height: 157.h,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(
              AppImages.splashEllipseBottom,
              width: 262.w,
              height: 265.h,
            ),
          ),

          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) => Transform.translate(
                offset: Offset(0, 40 * (1 - _controller.value)),
                child: Transform.scale(
                  scale: .5 + (.3 * _controller.value),
                  child: Opacity(opacity: _controller.value, child: child),
                ),
              ),
              child: SvgPicture.asset(
                AppImages.appLogo,
                width: 142.w,
                height: 79.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
