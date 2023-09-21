import 'package:flutter/material.dart';

class RouteWraper {
  void push(
    BuildContext context,
    Widget toWidget,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => toWidget,
      ),
    );
  }

  void pushAndRemove(
    BuildContext context,
    Widget toWidget,
  ) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute<void>(builder: (BuildContext context) => toWidget),
      (route) => false,
    );
  }

  void pop(BuildContext context, {dynamic result}) {
    result == null ? Navigator.pop(context) : Navigator.pop(context, result);
  }
}
