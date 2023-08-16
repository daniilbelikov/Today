import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:today/screens/feed/presentation/feed_screen.dart';
import 'package:today/screens/profile/presentation/profile_screen.dart';
import 'package:today/screens/request/presentation/requests_screen.dart';
import 'package:today/screens/response/presentation/response_screen.dart';

class CupertinoBottomBar extends StatefulWidget {
  const CupertinoBottomBar({Key? key}) : super(key: key);

  @override
  CupertinoPageState createState() => CupertinoPageState();
}

class CupertinoPageState extends State<CupertinoBottomBar> {
  final List<Widget> widgets = const [
    FeedScreen(),
    RequestsScreen(),
    ResponseScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        resizeToAvoidBottomInset: false,
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.white,
          activeColor: Colors.black,
          inactiveColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alt_route),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.linked_camera),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
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
