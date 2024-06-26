import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:today/screens/events/bloc/events_bloc.dart';
import 'package:today/screens/profile/bloc/profile_bloc.dart';
import 'package:today/helpers/themes.dart';
import 'package:today/screens/auth/data/provider/auth_provider.dart';
import 'package:today/screens/events/data/provider/events_provider.dart';
import 'package:today/utils/without_glow_behavior.dart';
import 'package:today/helpers/router.dart';
import 'package:today/screens/auth/data/repository/auth_repository.dart';
import 'package:today/screens/auth/presentation/auth_screen.dart';
import 'package:today/screens/auth/bloc/auth_bloc.dart';
import 'package:today/screens/bottom_navigation/data/bottom_provider.dart';
import 'package:today/screens/create_event/data/create_event_provider.dart';
import 'package:today/generated/l10n.dart';
import 'package:today/screens/edit_profile/data/edit_profile_provider.dart';
import 'package:today/screens/events/data/repository/events_repository.dart';
import 'package:today/screens/profile/data/repository/profile_repository.dart';

class TodayApp extends StatefulWidget {
  const TodayApp({super.key});

  @override
  State<TodayApp> createState() => _TodayAppState();
}

class _TodayAppState extends State<TodayApp> with WidgetsBindingObserver {
  void _addObserver() {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void initState() {
    super.initState();
    _addObserver();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        FlutterAppBadger.removeBadge();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthRepository()),
        RepositoryProvider(create: (_) => EventsRepository()),
        RepositoryProvider(create: (_) => ProfileRepository()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => EventsProvider()),
        ChangeNotifierProvider(create: (_) => BottomProvider()),
        ChangeNotifierProvider(create: (_) => CreateEventProvider()),
        ChangeNotifierProvider(create: (_) => EditProfileProvider()),
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
            create: (context) => ProfileBloc(
              repository: RepositoryProvider.of<ProfileRepository>(context),
            ),
          ),
        ],
        child: Sizer(
          builder: (context, orientation, type) => MaterialApp(
            theme: Themes().light,
            darkTheme: Themes().dark,
            scrollBehavior: WithoutGlowBehavior(),
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            onGenerateRoute: (settings) => TodayRouter.generateRoute(settings),
            builder: (_, child) => child ?? const AuthScreen(),
            initialRoute: TodayRouter.init,
          ),
        ),
      ),
    );
  }
}
