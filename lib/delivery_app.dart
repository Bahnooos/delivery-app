import 'package:delivery_app/core/routing/routes.dart';
import 'package:delivery_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          themeMode: ThemeMode.system,
          initialRoute: Routes.notificationScreen,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
