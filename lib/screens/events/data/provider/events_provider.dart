import '../model/active_model.dart';
import 'package:flutter/foundation.dart';
import '../../../../helpers/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:today/models/common/event_model.dart';

class EventsProvider with ChangeNotifier {
  final _currentUser = FirebaseAuth.instance.currentUser;

  String selectedCity = TodayData.selectedCity;
  List<String> cities = TodayData.citiesArray;

  String get getSelectedCity => selectedCity;
  List<String> get getCities => cities;

  void setSelectedValue(String value) {
    selectedCity = value;
    notifyListeners();
  }

  ActiveModel determineActive(EventModel event) {
    final applications = event.applications;
    final creatorID = event.creatorId;
    final id = _currentUser?.uid ?? '';

    if (creatorID == id) {
      return ActiveModel(false, false);
    } else if (applications.contains(id)) {
      return ActiveModel(false, true);
    } else {
      return ActiveModel(true, true);
    }
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

  String getTitle(int type, int count) {
    switch (type) {
      case 0:
        return 'Свидание, до $count человек';
      case 1:
        return 'Вечеринка, до $count человек';
      case 2:
        return 'Прогулка, до $count человек';
      case 3:
        return 'Пробежка, до $count человек';
      case 4:
        return 'Поход в кино, до $count человек';
      default:
        return '';
    }
  }

  String getEmojies(int type) {
    switch (type) {
      case 0:
        return '😍 💋 ❤️';
      case 1:
        return '🍷 💃 🕺';
      case 2:
        return '🐶 🌻 🌳';
      case 3:
        return '☀️ 🏃‍♀️ 🏃‍♂️';
      case 4:
        return '🍿 🎥 🧙‍♂️';
      default:
        return '';
    }
  }
}
