import 'dart:io';
import 'package:flutter/material.dart';
import 'package:today/managers/notifications_manager.dart';
import 'package:today/screens/bottom_navigation/presentation/widgets/material_bottom_bar.dart';
import 'package:today/screens/bottom_navigation/presentation/widgets/cupertino_bottom_bar.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({super.key});

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
        : const MaterialBottomBar();
  }
}
