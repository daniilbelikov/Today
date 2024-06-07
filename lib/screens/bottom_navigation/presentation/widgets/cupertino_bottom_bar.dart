import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:today/utils/tab_icons.dart';
import 'package:today/screens/profile/presentation/screen/profile_screen.dart';
import 'package:today/widgets/active_icon.dart';
import 'package:today/screens/events/presentation/screen/events_screen.dart';

class CupertinoBottomBar extends StatefulWidget {
  const CupertinoBottomBar({super.key});

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
            ProfileScreen(),
          ][index];
        },
      ),
    );
  }
}
