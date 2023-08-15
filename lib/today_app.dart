import 'generated/l10n.dart';
import 'helpers/themes.dart';
import 'package:flutter/material.dart';
import 'package:today/helpers/routes.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          initialRoute: TodayRouter.authRoute,
          onGenerateRoute: (settings) => TodayRouter.generateRoute(settings),
        );
      },
    );
  }
}
