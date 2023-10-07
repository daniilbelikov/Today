import 'dart:io';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../../helpers/constants.dart';
import '../../../../utils/route_wrapper.dart';
import '../../../../widgets/common_alert.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../models/hive/local_user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EditProfileProvider with ChangeNotifier {
  final storage = FirebaseStorage.instance;

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
      ),
    ).whenComplete(() => RouteWraper().pop(context, result: true));
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

  LocalUserModel getUserModel() {
    final box = Hive.box(TodayKeys.user);
    final user = box.get(TodayKeys.localUser) as LocalUserModel;
    return LocalUserModel(
      about: user.about,
      age: user.age,
      avatar: user.avatar,
      id: user.id,
      name: user.name,
      telegram: user.telegram,
      vk: user.vk,
      work: user.work,
      isEmpty: user.isEmpty,
    );
  }
}
