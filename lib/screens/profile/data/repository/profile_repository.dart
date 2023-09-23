import 'package:today/helpers/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../events/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileRepository {
  final _usersRef = FirebaseFirestore.instance.collection(TodayKeys.users);
  final _currentUser = FirebaseAuth.instance.currentUser;

  Future<UserModel> getUserData() async {
    try {
      final userUID = _currentUser?.uid ?? '';
      final docRef = _usersRef.doc(userUID);
      final snapshot = await docRef.get();
      final data = snapshot.data() ?? {};
      final user = UserModel.fromJson(data);
      return user;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
