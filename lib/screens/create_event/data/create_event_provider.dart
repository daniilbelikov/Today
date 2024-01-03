import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../helpers/constants.dart';
import '../../../widgets/common_alert.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:today/models/hive/local_user_model.dart';

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

  bool getActiveStatus() {
    return city.isNotEmpty &&
        type.isNotEmpty &&
        count.isNotEmpty &&
        desc.isNotEmpty;
  }

  String getCurrentDate() {
    final date = DateTime.now();
    return DateFormat(TodayValues.dayPattern).format(date);
  }

  LocalUserModel getUserModel() {
    final box = Hive.box(TodayKeys.user);
    final user = box.get(TodayKeys.localUser) as LocalUserModel;
    return user;
  }

  Future<void> showSuccessAlert(BuildContext context) async {
    showDialog(
      context: context,
      builder: (_) => CommonAlertWidget(
        title: S.of(context).success,
        buttonTitle: S.of(context).close,
        text: S.of(context).create_event_success,
      ),
    ).whenComplete(() => Navigator.pop(context, true));
  }

  void showErrorAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => CommonAlertWidget(
        title: S.of(context).error,
        buttonTitle: S.of(context).close,
        text: S.of(context).error_profile,
      ),
    );
  }

  Future<List<int>?> showCityPicker(BuildContext context) {
    return _generatePicker(
      height: 150.0,
      context: context,
      data: TodayData.cities,
      title: S.of(context).choose_city,
      onConfirm: (Picker picker, _) => _saveValue(TodayKeys.city, picker),
    ).showDialog(context);
  }

  Future<List<int>?> showTypePicker(BuildContext context) {
    return _generatePicker(
      height: 180.0,
      context: context,
      data: TodayData.types,
      title: S.of(context).choose_type,
      onConfirm: (Picker picker, _) => _saveValue(TodayKeys.type, picker),
    ).showDialog(context);
  }

  Future<List<int>?> showCountPicker(BuildContext context) {
    return _generatePicker(
      height: 200.0,
      context: context,
      data: TodayData.numbers,
      title: S.of(context).choose_count,
      onConfirm: (Picker picker, _) => _saveValue(TodayKeys.count, picker),
    ).showDialog(context);
  }

  void _saveValue(String value, Picker picker) {
    switch (value) {
      case TodayKeys.city:
        city = picker.getSelectedValues().first;
        break;
      case TodayKeys.type:
        type = picker.getSelectedValues().first;
        break;
      case TodayKeys.count:
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
