import 'dart:io';
import 'material_bottom_bar.dart';
import 'cupertino_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today/managers/notifications_manager.dart';
import 'package:today/screens/bottom_navigation/bloc/bottom_navigation_bloc.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({Key? key}) : super(key: key);

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  void _registerNotifications() {
    NotificationsManager().initLocalNotifications();
  }

  @override
  void initState() {
    super.initState();
    _registerNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const CupertinoBottomBar()
        : BlocProvider<BottomNavigationBloc>.value(
            value: BottomNavigationBloc(),
            child: const MaterialBottomBar(),
          );
  }
}
