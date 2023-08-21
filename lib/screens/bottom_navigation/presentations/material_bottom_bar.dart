import 'package:flutter/material.dart';
import '../../../widgets/active_icon.dart';
import '../bloc/bottom_navigation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feed/presentation/feed_screen.dart';
import 'package:today/helpers/today_bottom_icons.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../request/presentation/requests_screen.dart';
import '../../response/presentation/response_screen.dart';

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
            ResponseScreen(),
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
                label: '',
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
                label: '',
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
                label: '',
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
        );
      },
    );
  }
}
