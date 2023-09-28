import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../../helpers/constants.dart';
import 'package:flutter_picker/flutter_picker.dart';
import '../../../events/data/models/user_model.dart';

class CreateEventProvider with ChangeNotifier {
  String city = '';
  String type = '';
  String count = '';
  String desc = '';

  String get getCity => city;
  String get getType => type;
  String get getCount => count;
  String get getDesc => desc;

  void updateDescText(String text) {
    desc = text;
    notifyListeners();
  }

  String getCurrentDate() {
    final date = DateTime.now();
    return DateFormat(TodayValues.dayPattern).format(date);
  }

  UserModel getUserModel() {
    return UserModel(
      about: '',
      age: '',
      avatar: '',
      id: '',
      name: '',
      telegram: '',
      vk: '',
      work: '',
    );
  }

  Future<List<int>?> showCityPicker(BuildContext context) {
    return _generatePicker(
      height: 150.0,
      context: context,
      data: TodayData.cities,
      title: S.of(context).choose_city,
      onConfirm: (Picker picker, List value) => _saveValue('city', picker),
    ).showDialog(context);
  }

  Future<List<int>?> showTypePicker(BuildContext context) {
    return _generatePicker(
      height: 180.0,
      context: context,
      data: TodayData.types,
      title: S.of(context).choose_type,
      onConfirm: (Picker picker, List value) => _saveValue('type', picker),
    ).showDialog(context);
  }

  Future<List<int>?> showCountPicker(BuildContext context) {
    return _generatePicker(
      height: 200.0,
      context: context,
      data: TodayData.numbers,
      title: S.of(context).choose_count,
      onConfirm: (Picker picker, List value) => _saveValue('count', picker),
    ).showDialog(context);
  }

  void _saveValue(String value, Picker picker) {
    switch (value) {
      case 'city':
        city = picker.getSelectedValues().first;
        break;
      case 'type':
        type = picker.getSelectedValues().first;
        break;
      case 'count':
        count = picker.getSelectedValues().first;
        break;
      default:
        break;
    }
    notifyListeners();
  }

  Picker _generatePicker({
    required String title,
    required double height,
    required BuildContext context,
    required List<PickerItem<String>>? data,
    required Function(Picker, List<int>)? onConfirm,
  }) {
    return Picker(
      height: height,
      looping: false,
      itemExtent: 38.0,
      hideHeader: true,
      onConfirm: onConfirm,
      textAlign: TextAlign.center,
      confirmText: S.of(context).done,
      cancelText: S.of(context).cancel,
      adapter: PickerDataAdapter<String>(data: data),
      cancelTextStyle: TextStyle(
        color: Theme.of(context).shadowColor,
        fontFamily: TodayFonts.medium,
        fontSize: 16.0,
      ),
      confirmTextStyle: TextStyle(
        color: Theme.of(context).shadowColor,
        fontFamily: TodayFonts.medium,
        fontSize: 16.0,
      ),
      textStyle: TextStyle(
        color: Theme.of(context).shadowColor,
        fontFamily: TodayFonts.medium,
        fontSize: 18.0,
      ),
      selectedTextStyle: TextStyle(
        color: Theme.of(context).shadowColor,
        fontFamily: TodayFonts.medium,
        fontSize: 20.0,
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: TodayFonts.semiBold,
          fontSize: 20.0,
        ),
      ),
    );
  }
}