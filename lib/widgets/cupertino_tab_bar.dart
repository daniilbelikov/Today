import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoBottomTabBar extends StatefulWidget {
  const CupertinoBottomTabBar({Key? key}) : super(key: key);

  @override
  _CupertinoPageState createState() => _CupertinoPageState();
}

class _CupertinoPageState extends State<CupertinoBottomTabBar> {
  final List<Widget> widgets = const <Widget>[];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        resizeToAvoidBottomInset: false,
        tabBar: CupertinoTabBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: Theme.of(context).indicatorColor,
          items: const [
            BottomNavigationBarItem(
              label: null,
              icon: Icon(Icons.abc),
            ),
            BottomNavigationBarItem(
              label: null,
              icon: Icon(Icons.abc),
            ),
            BottomNavigationBarItem(
              label: null,
              icon: Icon(Icons.abc),
            ),
            BottomNavigationBarItem(
              label: null,
              icon: Icon(Icons.abc),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, index) {
          return widgets[index];
        },
      ),
    );
  }
}
