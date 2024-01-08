import 'package:flutter/foundation.dart';

class ActivityProvider with ChangeNotifier {
  int index = 0;

  int get getIndex => index;

  void changeIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }
}
