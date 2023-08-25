import 'package:flutter/material.dart';
import '../../../helpers/bottom_icons.dart';
import '../../../widgets/active_icon.dart';
import '../bloc/bottom_navigation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feed/presentation/feed_screen.dart';
import 'package:today/helpers/today_bottom_icons.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../request/presentation/requests_screen.dart';

class MaterialBottomBar extends StatefulWidget {
  const MaterialBottomBar({Key? key}) : super(key: key);

  @override
  State<MaterialBottomBar> createState() => _MaterialBottomBarState();
}

class _MaterialBottomBarState extends State<MaterialBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavigationBloc, BottomNavigationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: const [
            FeedScreen(),
            RequestsScreen(),
            ProfileScreen(),
          ].elementAt(state.tabIndex),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Theme.of(context).hintColor.withAlpha(100),
            backgroundColor: Theme.of(context).cardColor,
            currentIndex: state.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              BlocProvider.of<BottomNavigationBloc>(context).add(
                TabChangeEvent(tabIndex: index),
              );
            },
            items: const [
              BottomNavigationBarItem(
                label: '',
                activeIcon: ActiveIconWidget(
                  child: Icon(
                    BottomIcons.home,
                    size: 23.0,
                  ),
                ),
                icon: Icon(
                  BottomIcons.home,
                  size: 23.0,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                activeIcon: ActiveIconWidget(
                  child: Icon(
                    BottomIcons.layers,
                    size: 24.0,
                  ),
                ),
                icon: Icon(
                  BottomIcons.layers,
                  size: 24.0,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                activeIcon: ActiveIconWidget(
                  child: Icon(
                    BottomIcons.account,
                    size: 24.0,
                  ),
                ),
                icon: Icon(
                  BottomIcons.account,
                  size: 24.0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
