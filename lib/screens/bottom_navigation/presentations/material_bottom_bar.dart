import 'package:flutter/material.dart';
import '../../../utils/tab_icons.dart';
import '../../../widgets/active_icon.dart';
import '../bloc/bottom_navigation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../events/presentation/events_screen.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../activity/presentation/activity_screen.dart';

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
          resizeToAvoidBottomInset: false,
          body: const [
            EventsScreen(),
            ActivityScreen(),
            ProfileScreen(),
          ].elementAt(state.tabIndex),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Theme.of(context).hintColor.withAlpha(100),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            currentIndex: state.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) => BlocProvider.of<BottomNavigationBloc>(context)
                .add(TabChangeEvent(tabIndex: index)),
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
      },
    );
  }
}
