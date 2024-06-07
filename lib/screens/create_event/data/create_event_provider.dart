import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:flutter_picker_plus/flutter_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:today/utils/picker_helper.dart';
import 'package:today/widgets/common_alert.dart';
import 'package:today/models/hive/local_user_model.dart';
import 'package:today/generated/l10n.dart';
import 'package:today/helpers/constants.dart';

class CreateEventProvider with ChangeNotifier {
  String _city = '';
  String _type = '';
  String _count = '';
  String _desc = '';

  String get getCity => _city;
  String get getType => _type;
  String get getCount => _count;
  String get getDesc => _desc;

  void updateDescText(String text) {
    _desc = text;
    notifyListeners();
  }

  bool getActiveStatus() {
    return _city.isNotEmpty &&
        _type.isNotEmpty &&
        _count.isNotEmpty &&
        _desc.isNotEmpty;
  }

  int getEType(String text) {
    return TodayData.typesMap[text] ?? 0;
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
        title: S.of(context).error_common,
        buttonTitle: S.of(context).close,
        text: S.of(context).error_profile,
      ),
    );
  }

  Future<List<int>?> showCityPicker(BuildContext context) {
    return PickerHelper.generatePicker(
      height: 150.0,
      context: context,
      data: TodayData.cities,
      title: S.of(context).choose_city,
      onConfirm: (Picker picker, _) => _saveValue(TodayKeys.city, picker),
    ).showDialog(context);
  }

  Future<List<int>?> showTypePicker(BuildContext context) {
    return PickerHelper.generatePicker(
      height: 180.0,
      context: context,
      data: TodayData.types,
      title: S.of(context).choose_type,
      onConfirm: (Picker picker, _) => _saveValue(TodayKeys.type, picker),
    ).showDialog(context);
  }

  Future<List<int>?> showCountPicker(BuildContext context) {
    return PickerHelper.generatePicker(
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
        _city = picker.getSelectedValues().first;
        break;
      case TodayKeys.type:
        _type = picker.getSelectedValues().first;
        break;
      case TodayKeys.count:
        _count = picker.getSelectedValues().first;
        break;
      default:
        break;
    }
    notifyListeners();
  }
}
