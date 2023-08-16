import 'package:flutter/material.dart';
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
  final List<Widget> widgets = const [
    FeedScreen(),
    RequestsScreen(),
    ResponseScreen(),
    ProfileScreen(),
  ];

  PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: widgets,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index) => controller.jumpToPage(index),
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
  }
}
