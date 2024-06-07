import 'package:flutter/material.dart';

class BottomProvider with ChangeNotifier {
  PageController controller = PageController();
  int _currentIndex = 0;

  PageController get pageController => controller;
  int get selectedIndex => _currentIndex;

  void onPageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void onItemTapped(int index) {
    controller.jumpToPage(index);
    notifyListeners();
  }
}
