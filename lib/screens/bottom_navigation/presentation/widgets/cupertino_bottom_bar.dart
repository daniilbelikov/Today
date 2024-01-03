import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../../utils/tab_icons.dart';
import '../../../../widgets/active_icon.dart';
import 'package:today/screens/events/presentation/screen/events_screen.dart';
import 'package:today/screens/profile/presentation/screen/profile_screen.dart';
import 'package:today/screens/activity/presentation/screen/activity_screen.dart';

class CupertinoBottomBar extends StatefulWidget {
  const CupertinoBottomBar({Key? key}) : super(key: key);

  @override
  CupertinoPageState createState() => CupertinoPageState();
}

class CupertinoPageState extends State<CupertinoBottomBar> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: CupertinoTabScaffold(
        resizeToAvoidBottomInset: false,
        tabBar: CupertinoTabBar(
          border: null,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          inactiveColor: Theme.of(context).hintColor.withAlpha(100),
          items: const [
            BottomNavigationBarItem(
              activeIcon: ActiveIconWidget(
                child: Icon(
                  TabIcons.flame,
                  size: 26.0,
                ),
              ),
              icon: Icon(
                TabIcons.flame,
                size: 26.0,
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: ActiveIconWidget(
                child: Icon(
                  TabIcons.heart,
                  size: 27.0,
                ),
              ),
              icon: Icon(
                TabIcons.heart,
                size: 27.0,
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: ActiveIconWidget(
                child: Icon(
                  TabIcons.star,
                  size: 27.0,
                ),
              ),
              icon: Icon(
                TabIcons.star,
                size: 27.0,
              ),
            ),
          ],
        ),
        tabBuilder: (_, index) {
          return const [
            EventsScreen(),
            ActivityScreen(),
            ProfileScreen(),
          ][index];
        },
      ),
    );
  }
}
