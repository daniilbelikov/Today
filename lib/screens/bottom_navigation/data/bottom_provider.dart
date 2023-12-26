import 'package:flutter/material.dart';

class BottomProvider with ChangeNotifier {
  final PageController _controller = PageController();
  int _index = 0;

  PageController get pageController => _controller;
  int get selectedIndex => _index;

  void onPageChanged(int index) {
    _index = index;
    notifyListeners();
  }

  void onItemTapped(int index) {
    _controller.jumpToPage(index);
    notifyListeners();
  }
}
