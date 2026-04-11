import 'package:delivery_app/core/di/dependency_injection.dart';
import 'package:delivery_app/features/auth/logic/forget_password_cubit/forget_and_reset_password_cubit.dart';
import 'package:delivery_app/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:delivery_app/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:delivery_app/features/auth/logic/verify_cubit/verification_cubit.dart';
import 'package:delivery_app/features/auth/ui/login_screen.dart';
import 'package:delivery_app/features/auth/ui/reset_password_screen.dart';
import 'package:delivery_app/features/my%20food/domain/entities/meal_entity.dart';
import 'package:delivery_app/features/my%20food/logic/meal_detail_cubit/meal_detail_cubit.dart';
import 'package:delivery_app/features/my%20food/logic/meals_cubit/meals_cubit.dart';
import 'package:delivery_app/features/my%20food/ui/meal_detail_screen.dart';
import 'package:delivery_app/features/my%20food/ui/my_food_screen.dart'
    as my_food;
import 'package:delivery_app/features/my%20food/ui/my_meals_screen.dart';
import 'package:delivery_app/features/notification/ui/notification_screen.dart';
import 'package:delivery_app/features/onbording/ui/onbording_screen.dart';
import 'package:delivery_app/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/ui/forget_password_screen.dart';
import '../../features/auth/ui/sign_up_screen.dart';
import '../../features/auth/ui/verification_screen.dart';
import '../../features/home/ui/home_screen.dart';
import 'routes.dart';

class AppRouter {
  static const String initialRoute = '/';

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.verificationScreen:
        final email = args as String?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VerificationCubit>(),
            child: VerificationScreen(email: email),
          ),
        );
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ForgetAndResetPasswordCubit>(),
            child: const ForgetPasswordScreen(),
          ),
        );
      case Routes.resetPasswordScreen:
        final email = args as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ForgetAndResetPasswordCubit>(),
            child: ResetPasswordScreen(email: email),
          ),
        );
      case Routes.notificationScreen:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onbordingScreen:
        return MaterialPageRoute(builder: (_) => const OnbordingScreen());
      case Routes.myFoodScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<MealsCubit>()..emitMealsStates(),
            child: const my_food.MyFoodScreen(),
          ),
        );
      case Routes.myMealsScreen:
        return MaterialPageRoute(builder: (_) => const MyMealsScreen());
      case Routes.mealDetailScreen:
        final meal = settings.arguments as MealEntity;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<MealDetailCubit>()..loadMeal(meal: meal),
            child: const MealDetailScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
