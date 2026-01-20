import 'package:flutter/material.dart';

import '../../features/home/ui/home_screen.dart';
import 'routes.dart';

class AppRouter {
  static const String initialRoute = '/';

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
   
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) =>const HomeScreen(),
                );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}