import 'dart:io';
import 'material_bottom_bar.dart';
import 'cupertino_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const CupertinoBottomBar()
        : const MaterialBottomBar();
  }
}
