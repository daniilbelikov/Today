import 'package:flutter/material.dart';

class BottomProvider with ChangeNotifier {
  PageController controller = PageController();
  int currentIndex = 0;

  PageController get pageController => controller;
  int get selectedIndex => currentIndex;

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void onItemTapped(int index) {
    controller.jumpToPage(index);
    notifyListeners();
  }
}
