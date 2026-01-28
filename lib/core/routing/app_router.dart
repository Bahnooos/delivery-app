import 'package:delivery_app/features/auth/ui/login_screen.dart';
import 'package:flutter/material.dart';

import '../../features/auth/ui/sign_up_screen.dart';
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
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
