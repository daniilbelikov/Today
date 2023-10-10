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
      case 'Казань':
        return 'Казане';
      case 'Уфа':
        return 'Уфе';
      case 'Нижний Новгород':
        return 'Нижнем Новгороде';
      case 'Пермь':
        return 'Перми';
      case 'Новосибирск':
        return 'Новосибирске';
      case 'Екатеринбург':
        return 'Екатеринбурге';
      case 'Волгоград':
        return 'Волгограде';
      default:
        return '';
    }
  }
}
