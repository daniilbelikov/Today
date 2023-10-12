import 'package:flutter/foundation.dart';
import '../../../../helpers/constants.dart';

class EventsProvider with ChangeNotifier {
  String selectedCity = TodayData.selectedCity;
  List<String> cities = TodayData.citiesArray;

  String get getSelectedCity => selectedCity;
  List<String> get getCities => cities;

  void setSelectedValue(String value) {
    selectedCity = value;
    notifyListeners();
  }

  String getRightCity() {
    switch (selectedCity) {
      case 'Самара':
        return 'Самаре';
      case 'Тольятти':
        return 'Тольятти';
      case 'Сызрань':
        return 'Сызране';
      case 'Новокуйбышевск':
        return 'Новокуйбышевске';
      case 'Жигулёвск':
        return 'Жигулёвске';
      default:
        return '';
    }
  }
}
