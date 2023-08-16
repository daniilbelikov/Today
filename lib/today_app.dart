import 'generated/l10n.dart';
import 'helpers/themes.dart';
import 'package:flutter/material.dart';
import 'screens/auth/bloc/auth_bloc.dart';
import 'screens/auth/data/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:today/screens/auth/presentation/auth_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/bottom_navigation/presentations/bottom_navigation_widget.dart';

class TodayApp extends StatelessWidget {
  const TodayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.light,
      light: Themes.light,
      dark: Themes.dark,
      builder: (light, dark) {
        return RepositoryProvider(
          create: (context) => AuthRepository(),
          child: BlocProvider(
            create: (context) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(context),
            ),
            child: MaterialApp(
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              home: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.userChanges(),
                builder: (_, snapshot) {
                  return snapshot.hasData
                      ? const BottomNavigationView()
                      : const AuthScreen();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
