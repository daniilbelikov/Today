import 'package:flutter/material.dart';
import '../../../utils/tab_icons.dart';
import 'package:provider/provider.dart';
import '../../../widgets/active_icon.dart';
import '../../events/presentation/events_screen.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../activity/presentation/activity_screen.dart';
import 'package:today/screens/bottom_navigation/data/bottom_provider.dart';

class MaterialBottomBar extends StatefulWidget {
  const MaterialBottomBar({Key? key}) : super(key: key);

  @override
  State<MaterialBottomBar> createState() => _MaterialBottomBarState();
}

class _MaterialBottomBarState extends State<MaterialBottomBar> {
  @override
  Widget build(BuildContext context) {
    final bottomProvider = Provider.of<BottomProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: bottomProvider.pageController,
        onPageChanged: bottomProvider.onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          EventsScreen(),
          ActivityScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Theme.of(context).hintColor.withAlpha(100),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        currentIndex: bottomProvider.selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: bottomProvider.onItemTapped,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0.0,
        items: const [
          BottomNavigationBarItem(
            label: '',
            activeIcon: ActiveIconWidget(
              child: Icon(
                TabIcons.flame,
                size: 24.0,
              ),
            ),
            icon: Icon(
              TabIcons.flame,
              size: 24.0,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            activeIcon: ActiveIconWidget(
              child: Icon(
                TabIcons.heart,
                size: 24.0,
              ),
            ),
            icon: Icon(
              TabIcons.heart,
              size: 24.0,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            activeIcon: ActiveIconWidget(
              child: Icon(
                TabIcons.star,
                size: 24.0,
              ),
            ),
            icon: Icon(
              TabIcons.star,
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
