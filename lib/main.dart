import 'package:delivery_app/core/di/dependency_injection.dart';
import 'package:delivery_app/core/routing/app_router.dart';
import 'package:delivery_app/delivery_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(DeliveryApp(appRouter: AppRouter()));
}
