import 'package:flutter/foundation.dart';
import '../../../../helpers/constants.dart';

class EventsProvider with ChangeNotifier {
  String selectedValue = TodayData.selectedValue;
  List<String> values = TodayData.values;

  List<String> get getValues => values;
  String get getSelectedValue => selectedValue;

  void setSelectedValue(String value) {
    selectedValue = value;
    notifyListeners();
  }

  String getRightCity() {
    if (selectedValue == TodayData.samaraOld) return TodayData.samaraNew;
    return selectedValue;
  }
}
