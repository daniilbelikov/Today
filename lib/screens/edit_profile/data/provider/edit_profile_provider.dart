import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileProvider with ChangeNotifier {
  File? image;

  File? get getImage => image;

  Future pickingImage(bool camera) async {
    try {
      final imageFile = await ImagePicker().pickImage(
        source: camera ? ImageSource.camera : ImageSource.gallery,
      );
      if (imageFile == null) return;
      final imageTemporary = File(imageFile.path);
      image = imageTemporary;
      notifyListeners();
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  void deleteImage() {
    image = null;
    notifyListeners();
  }
}
