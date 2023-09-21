import 'generated/l10n.dart';
import 'helpers/themes.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'screens/auth/bloc/auth_bloc.dart';
import 'screens/events/bloc/events_bloc.dart';
import 'screens/auth/data/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'screens/reactions/data/reactions_provider.dart';
import 'screens/events/data/provider/events_provider.dart';
import 'package:today/screens/auth/presentation/auth_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:today/screens/events/data/repository/events_repository.dart';
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
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => AuthRepository(),
            ),
            RepositoryProvider(
              create: (context) => EventsRepository(),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AuthBloc(
                  repository: RepositoryProvider.of<AuthRepository>(context),
                ),
              ),
              BlocProvider(
                create: (context) => EventsBloc(
                  repository: RepositoryProvider.of<EventsRepository>(context),
                ),
              ),
            ],
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => EventsProvider(),
                ),
                ChangeNotifierProvider(
                  create: (_) => ReactionsProvider(),
                ),
              ],
              child: MaterialApp(
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                home: StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (_, snapshot) {
                    return snapshot.hasData
                        ? const BottomNavigationView()
                        : const AuthScreen();
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
