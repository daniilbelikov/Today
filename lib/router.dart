import 'managers/auth_manager.dart';
import 'package:flutter/material.dart';

class TodayRouter {
  static const String init = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case init:
        return MaterialPageRoute(
          builder: (_) => const AuthManager(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
        );
    }
  }
}
