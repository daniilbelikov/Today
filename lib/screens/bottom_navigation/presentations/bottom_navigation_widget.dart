import 'dart:io';
import 'material_bottom_bar.dart';
import 'cupertino_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today/screens/bottom_navigation/bloc/bottom_navigation_bloc.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({Key? key}) : super(key: key);

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
