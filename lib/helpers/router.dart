import 'package:flutter/material.dart';
import 'package:today/managers/auth_wrapper_widget.dart';

class TodayRouter {
  static const String init = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case init:
        return MaterialPageRoute(
          builder: (_) => const AuthWrapperWidget(),
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
