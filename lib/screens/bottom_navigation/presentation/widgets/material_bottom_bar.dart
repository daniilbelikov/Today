import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:today/widgets/active_icon.dart';
import 'package:today/screens/profile/presentation/screen/profile_screen.dart';
import 'package:today/screens/bottom_navigation/data/bottom_provider.dart';
import 'package:today/utils/tab_icons.dart';
import 'package:today/screens/events/presentation/screen/events_screen.dart';

class MaterialBottomBar extends StatefulWidget {
  const MaterialBottomBar({super.key});

  @override
  State<MaterialBottomBar> createState() => _MaterialBottomBarState();
}

class _MaterialBottomBarState extends State<MaterialBottomBar> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: provider.pageController,
        onPageChanged: provider.onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          EventsScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Theme.of(context).hintColor.withAlpha(100),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        currentIndex: provider.selectedIndex,
        onTap: provider.onItemTapped,
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
