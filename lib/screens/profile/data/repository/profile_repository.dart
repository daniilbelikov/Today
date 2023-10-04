import 'package:hive/hive.dart';
import 'package:today/helpers/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:today/models/hive/local_user_model.dart';

class ProfileRepository {
  final _usersRef = FirebaseFirestore.instance.collection(TodayKeys.users);
  final _currentUser = FirebaseAuth.instance.currentUser;

  Future<LocalUserModel> getProfile() async {
    try {
      final userUID = _currentUser?.uid ?? '';
      final docRef = _usersRef.doc(userUID);
      final snapshot = await docRef.get();
      final data = snapshot.data() ?? {};
      final user = LocalUserModel.fromJson(data);
      _saveInHive(user);
      return user;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> updateProfile(LocalUserModel user) async {
    try {
      final userUID = _currentUser?.uid ?? '';
      final docRef = _usersRef.doc(userUID);
      final data = {
        'isEmpty': user.isEmpty,
        'about': user.about,
        'age': user.age,
        'avatar': user.avatar,
        'id': user.id,
        'name': user.name,
        'work': user.work,
        'telegram': user.telegram,
        'vk': user.vk,
      };
      await docRef.update(data);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  void _saveInHive(LocalUserModel user) {
    final box = Hive.box(TodayKeys.user);
    final person = LocalUserModel(
      id: user.id,
      age: user.age,
      name: user.name,
      work: user.work,
      avatar: user.avatar,
      about: user.about,
      vk: user.vk,
      telegram: user.telegram,
      isEmpty: user.isEmpty,
    );
    box.put(TodayKeys.localUser, person);
  }
}
