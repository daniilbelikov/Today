import 'helpers/themes.dart';
import 'package:flutter/material.dart';
import 'package:today/helpers/routes.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class TodayApp extends StatelessWidget {
  const TodayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.light,
      light: Themes.light,
      dark: Themes.dark,
      builder: (light, dark) {
        return MaterialApp(
          initialRoute: TodayRouter.onboarding,
          onGenerateRoute: (settings) => TodayRouter.generateRoute(settings),
        );
      },
    );
  }
}
