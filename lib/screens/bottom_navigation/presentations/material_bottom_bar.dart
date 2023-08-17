import 'package:flutter/material.dart';
import '../../../widgets/active_icon.dart';
import '../bloc/bottom_navigation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feed/presentation/feed_screen.dart';
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
            unselectedItemColor: Theme.of(context).splashColor.withAlpha(100),
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
                  child: Icon(Icons.home),
                ),
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: '',
                activeIcon: ActiveIconWidget(
                  child: Icon(Icons.description),
                ),
                icon: Icon(Icons.description),
              ),
              BottomNavigationBarItem(
                label: '',
                activeIcon: ActiveIconWidget(
                  child: Icon(Icons.favorite),
                ),
                icon: Icon(Icons.favorite),
              ),
              BottomNavigationBarItem(
                label: '',
                activeIcon: ActiveIconWidget(
                  child: Icon(Icons.account_circle),
                ),
                icon: Icon(Icons.account_circle),
              ),
            ],
          ),
        );
      },
    );
  }
}
