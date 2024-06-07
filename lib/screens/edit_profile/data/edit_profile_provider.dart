import 'dart:io';
import 'package:flutter_picker_plus/flutter_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:today/widgets/common_alert.dart';
import 'package:today/models/hive/local_user_model.dart';
import 'package:today/generated/l10n.dart';
import 'package:today/helpers/constants.dart';

class EditProfileProvider with ChangeNotifier {
  String _name = '';
  String _age = '';
  String _work = '';
  String _about = '';
  String _vk = '';
  String _telegram = '';
  String _avatar = '';
  String _oldImage = '';
  File? _image;

  String get getName => _name;
  String get getAge => _age;
  String get getWork => _work;
  String get getAbout => _about;
  String get getAvatar => _avatar;
  String get getVk => _vk;
  String get getTelegram => _telegram;
  String get getOldImage => _oldImage;
  File? get getImage => _image;

  void setInitialValues(LocalUserModel user) {
    _name = user.name;
    _age = user.age;
    _work = user.work;
    _about = user.about;
    _avatar = user.avatar;
    _oldImage = user.avatar;
    _vk = user.vk;
    _telegram = user.telegram;
    notifyListeners();
  }

  void changeName(String text) {
    _name = text;
    notifyListeners();
  }

  void changeAge(String text) {
    _age = text;
    notifyListeners();
  }

  void changeWork(String text) {
    _work = text;
    notifyListeners();
  }

  void changeAbout(String text) {
    _about = text;
    notifyListeners();
  }

  void changeVk(String text) {
    _vk = text;
    notifyListeners();
  }

  void changeTelegram(String text) {
    _telegram = text;
    notifyListeners();
  }

  bool getActiveStatus() {
    return _name.isNotEmpty &&
        _age.isNotEmpty &&
        _work.isNotEmpty &&
        _about.isNotEmpty &&
        _vk.isNotEmpty &&
        _telegram.isNotEmpty;
  }

  Future<void> showSuccessAlert(BuildContext context) async {
    showDialog(
      context: context,
      builder: (_) => CommonAlertWidget(
        title: S.of(context).success,
        text: S.of(context).edit_profile_success,
        buttonTitle: S.of(context).close,
      ),
    ).whenComplete(() => Navigator.pop(context, true));
  }

  Future<void> pickingImage(bool camera) async {
    try {
      final imageFile = await ImagePicker().pickImage(
        source: camera ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 50,
      );
      if (imageFile == null) return;
      final imageTemporary = File(imageFile.path);
      _image = imageTemporary;
      notifyListeners();
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  String getFinalAvatar() {
    final imagePath = _image?.path ?? '';
    return _avatar.isNotEmpty ? _avatar : imagePath;
  }

  void deleteImage() {
    _avatar = '';
    _image = null;
    notifyListeners();
  }

  Future<List<int>?> showAgePicker(BuildContext context) {
    return _generatePicker(
      height: 200.0,
      context: context,
      data: TodayData.ages,
      title: S.of(context).choose_age,
      onConfirm: (Picker picker, _) => _saveValue(picker),
    ).showDialog(context);
  }

  void _saveValue(Picker picker) {
    _age = picker.getSelectedValues().first;
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
