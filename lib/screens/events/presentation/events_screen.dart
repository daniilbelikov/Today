import 'dart:io';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../auth/bloc/auth_bloc.dart';
import '../../../helpers/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/flexible_space_bar.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return NestedScrollView(
            headerSliverBuilder: (_, __) => <Widget>[
              SliverAppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.light,
                ),
                snap: false,
                pinned: true,
                elevation: 0.0,
                centerTitle: false,
                expandedHeight: 96.0,
                automaticallyImplyLeading: true,
                flexibleSpace: BackgroundFlexibleSpaceBar(
                  title: Text(
                    S.of(context).events,
                    style: TextStyle(
                      color: Theme.of(context).shadowColor,
                      fontFamily: TodayFonts.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  centerTitle: false,
                  titlePadding: EdgeInsets.only(
                    left: Platform.isAndroid ? 16.0 : 20.0,
                    bottom: 8.0,
                  ),
                  background: ClipRect(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                ),
              )
            ],
            body: Center(
              child: TextButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(
                    SignOutEvent(),
                  );
                },
                child: const Text(
                  'Signout',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
