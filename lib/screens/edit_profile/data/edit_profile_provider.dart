import 'dart:io';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../helpers/constants.dart';
import '../../../widgets/common_alert.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_picker/flutter_picker.dart';
import '../../../models/hive/local_user_model.dart';

class EditProfileProvider with ChangeNotifier {
  String name = '';
  String age = '';
  String work = '';
  String about = '';
  String vk = '';
  String telegram = '';
  String avatar = '';
  String oldImage = '';
  File? image;

  String get getName => name;
  String get getAge => age;
  String get getWork => work;
  String get getAbout => about;
  String get getAvatar => avatar;
  String get getVk => vk;
  String get getTelegram => telegram;
  String get getOldImage => oldImage;
  File? get getImage => image;

  void setInitialValues(LocalUserModel user) {
    name = user.name;
    age = user.age;
    work = user.work;
    about = user.about;
    avatar = user.avatar;
    oldImage = user.avatar;
    vk = user.vk;
    telegram = user.telegram;
    notifyListeners();
  }

  void changeName(String text) {
    name = text;
    notifyListeners();
  }

  void changeAge(String text) {
    age = text;
    notifyListeners();
  }

  void changeWork(String text) {
    work = text;
    notifyListeners();
  }

  void changeAbout(String text) {
    about = text;
    notifyListeners();
  }

  void changeVk(String text) {
    vk = text;
    notifyListeners();
  }

  void changeTelegram(String text) {
    telegram = text;
    notifyListeners();
  }

  bool getActiveStatus() {
    return name.isNotEmpty &&
        age.isNotEmpty &&
        work.isNotEmpty &&
        about.isNotEmpty &&
        vk.isNotEmpty &&
        telegram.isNotEmpty;
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
      image = imageTemporary;
      notifyListeners();
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  String getFinalAvatar() {
    final imagePath = image?.path ?? '';
    return avatar.isNotEmpty ? avatar : imagePath;
  }

  void deleteImage() {
    avatar = '';
    image = null;
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
    age = picker.getSelectedValues().first;
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
