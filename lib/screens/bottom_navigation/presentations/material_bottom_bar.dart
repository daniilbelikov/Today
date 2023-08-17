import 'package:flutter/material.dart';
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
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            currentIndex: state.tabIndex,
            onTap: (index) {
              BlocProvider.of<BottomNavigationBloc>(context).add(
                TabChangeEvent(tabIndex: index),
              );
            },
            items: const [
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.ac_unit),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.alt_route),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.linked_camera),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.account_circle),
              ),
            ],
          ),
        );
      },
    );
  }
}
