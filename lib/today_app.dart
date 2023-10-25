import 'generated/l10n.dart';
import 'helpers/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/auth/bloc/auth_bloc.dart';
import 'screens/events/bloc/events_bloc.dart';
import 'screens/profile/bloc/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/activity/bloc/activity_bloc.dart';
import 'package:today/utils/no_glow_behavior.dart';
import 'screens/auth/data/provider/auth_provider.dart';
import 'screens/auth/data/repository/auth_repository.dart';
import 'screens/events/data/provider/events_provider.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'screens/profile/data/provider/profile_provider.dart';
import 'screens/activity/data/provider/activity_provider.dart';
import 'screens/profile/data/repository/profile_repository.dart';
import 'package:today/screens/auth/presentation/auth_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/activity/data/repository/activity_repository.dart';
import 'screens/create_event/data/provider/create_event_provider.dart';
import 'package:today/screens/events/data/repository/events_repository.dart';
import 'screens/bottom_navigation/presentations/bottom_navigation_widget.dart';
import 'package:today/screens/edit_profile/data/provider/edit_profile_provider.dart';

class TodayApp extends StatefulWidget {
  const TodayApp({Key? key}) : super(key: key);

  @override
  State<TodayApp> createState() => _TodayAppState();
}

class _TodayAppState extends State<TodayApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.hidden:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.resumed:
        FlutterAppBadger.removeBadge();
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => EventsRepository(),
        ),
        RepositoryProvider(
          create: (context) => ActivityRepository(),
        ),
        RepositoryProvider(
          create: (context) => ProfileRepository(),
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
          BlocProvider(
            create: (context) => ActivityBloc(
              repository: RepositoryProvider.of<ActivityRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => ProfileBloc(
              repository: RepositoryProvider.of<ProfileRepository>(context),
            ),
          ),
        ],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => AuthProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => CreateEventProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => EventsProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => ActivityProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => ProfileProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => EditProfileProvider(),
            ),
          ],
          child: MaterialApp(
            theme: Themes.light,
            darkTheme: Themes.dark,
            scrollBehavior: NoGlowScrollBehavior(),
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
  }
}
