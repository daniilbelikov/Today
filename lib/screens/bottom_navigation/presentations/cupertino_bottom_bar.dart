import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../helpers/bottom_icons.dart';
import '../../../widgets/active_icon.dart';
import '../../../helpers/today_bottom_icons.dart';
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
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        resizeToAvoidBottomInset: false,
        tabBar: CupertinoTabBar(
          backgroundColor: Theme.of(context).cardColor,
          inactiveColor: Theme.of(context).hintColor.withAlpha(100),
          items: const [
            BottomNavigationBarItem(
              activeIcon: ActiveIconWidget(
                child: Icon(
                  BottomIcons.home,
                  size: 26.0,
                ),
              ),
              icon: Icon(
                BottomIcons.home,
                size: 26.0,
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: ActiveIconWidget(
                child: Icon(
                  BottomIcons.layers,
                  size: 27.0,
                ),
              ),
              icon: Icon(
                BottomIcons.layers,
                size: 27.0,
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: ActiveIconWidget(
                child: Icon(
                  BottomIcons.account,
                  size: 27.0,
                ),
              ),
              icon: Icon(
                BottomIcons.account,
                size: 27.0,
              ),
            ),
          ],
        ),
        tabBuilder: (_, index) {
          return const [
            FeedScreen(),
            RequestsScreen(),
            ProfileScreen(),
          ][index];
        },
      ),
    );
  }
}
