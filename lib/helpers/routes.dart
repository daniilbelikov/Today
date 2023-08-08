import '../screens/auth_screen.dart';
import 'package:flutter/material.dart';

class TodayRouter {
  static const String authRoute = '/auth';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final args = settings.arguments;

    switch (settings.name) {
      case authRoute:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
