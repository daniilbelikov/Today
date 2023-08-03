import 'package:firebase_core/firebase_core.dart';

class FirebaseManager {
  void init() async {
    await Firebase.initializeApp();
  }
}
