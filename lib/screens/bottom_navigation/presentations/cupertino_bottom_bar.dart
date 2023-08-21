import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
                  TodayBottomIcons.home,
                  size: 25.0,
                ),
              ),
              icon: Icon(
                TodayBottomIcons.home,
                size: 25.0,
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: ActiveIconWidget(
                child: Icon(
                  TodayBottomIcons.list,
                  size: 23.0,
                ),
              ),
              icon: Icon(
                TodayBottomIcons.list,
                size: 23.0,
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: ActiveIconWidget(
                child: Icon(
                  TodayBottomIcons.heart,
                  size: 25.0,
                ),
              ),
              icon: Icon(
                TodayBottomIcons.heart,
                size: 25.0,
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: ActiveIconWidget(
                child: Icon(
                  TodayBottomIcons.user,
                  size: 25.0,
                ),
              ),
              icon: Icon(
                TodayBottomIcons.user,
                size: 25.0,
              ),
            ),
          ],
        ),
        tabBuilder: (_, index) {
          return const [
            FeedScreen(),
            RequestsScreen(),
            ResponseScreen(),
            ProfileScreen(),
          ][index];
        },
      ),
    );
  }
}
