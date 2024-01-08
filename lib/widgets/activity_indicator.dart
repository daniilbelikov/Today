import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ActivityIndicatorWidget extends StatelessWidget {
  const ActivityIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator(
              color: Theme.of(context).shadowColor,
              radius: 16.0,
            )
          : CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).shadowColor,
              ),
            ),
    );
  }
}
