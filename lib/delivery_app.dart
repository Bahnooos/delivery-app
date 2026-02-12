import 'package:delivery_app/core/helpers/extensions.dart';
import 'package:delivery_app/core/routing/routes.dart';
import 'package:delivery_app/core/theme/app_theme.dart';
import 'package:delivery_app/features/auth/logic/auth_cubit/auth_cubit.dart';
import 'package:delivery_app/features/auth/logic/auth_cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          context.pushNamedAndRemoveUntil(Routes.loginScreen, (_) => false);
        } else if (state is AuthAuthenticated) {
          context.pushNamedAndRemoveUntil(Routes.homeScreen, (_) => false);
        }
      },
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            themeMode: ThemeMode.system,
            initialRoute: Routes.splashScreen,
            onGenerateRoute: appRouter.generateRoute,
          );
        },
      ),
    );
  }
}
