import 'package:flutter/material.dart';

class MaterialBottomTabBar extends StatelessWidget {
  const MaterialBottomTabBar({Key? key}) : super(key: key);

  final List<Widget> widgets = const <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: PageController(),
        onPageChanged: (_) {},
        physics: const NeverScrollableScrollPhysics(),
        children: widgets,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).indicatorColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        currentIndex: 0,
        onTap: (_) {},
        items: const [
          BottomNavigationBarItem(
            label: null,
            icon: Icon(Icons.abc),
          ),
          BottomNavigationBarItem(
            label: null,
            icon: Icon(Icons.abc),
          ),
          BottomNavigationBarItem(
            label: null,
            icon: Icon(Icons.abc),
          ),
          BottomNavigationBarItem(
            label: null,
            icon: Icon(Icons.abc),
          ),
        ],
      ),
    );
  }
}
