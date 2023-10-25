import 'dart:math';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:crypto/crypto.dart';
import '../../../../helpers/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthRepository {
  final _usersRef = FirebaseFirestore.instance.collection(TodayKeys.users);
  final _fireStorage = FirebaseStorage.instance;
  final _fireAuth = FirebaseAuth.instance;

  Future<User?> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential = await _fireAuth.signInWithCredential(credential);
      final user = userCredential.user;
      _userDataManagement(user);
      return user;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<User?> signInWithApple() async {
    try {
      final rawNonce = _generateRawNonce();
      final nonce = _sha256ofString(rawNonce);

      final credentialAppleID = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final credential = OAuthProvider('apple.com').credential(
        idToken: credentialAppleID.identityToken,
        rawNonce: rawNonce,
      );

      final userCredential = await _fireAuth.signInWithCredential(credential);
      final user = userCredential.user;
      _userDataManagement(user);
      return user;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _fireAuth.signOut();
      _clearHive();
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> deleteAccount() async {
    try {
      final uid = _fireAuth.currentUser?.uid ?? '';
      final snapshot = await _usersRef.doc(uid).get();
      final data = snapshot.data() ?? {};
      final fileUrl = data['avatar'] as String;

      if (fileUrl.isNotEmpty) await _fireStorage.refFromURL(fileUrl).delete();

      await _usersRef.doc(uid).delete();
      await _fireAuth.currentUser?.delete(); // TO-DO
      _clearHive();
    } catch (error) {
      throw Exception(error);
    }
  }

  void _clearHive() {
    final box = Hive.box(TodayKeys.user);
    box.clear();
  }

  void _userDataManagement(User? user) {
    final displayName = user?.displayName;
    if (displayName == null) _addUserInFirestore(user);
  }

  Future<void> _addUserInFirestore(User? user) async {
    final uid = user?.uid ?? '';

    try {
      await _usersRef.doc(uid).set({
        'id': uid,
        'age': '',
        'name': '',
        'work': '',
        'avatar': '',
        'about': '',
        'vk': '',
        'telegram': '',
        'isEmpty': true,
      });
      await user?.updateDisplayName('User ${user.uid}');
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  String _generateRawNonce([int length = 32]) {
    const charset = TodayValues.charset;
    final random = Random.secure();
    final result = List.generate(length, (_) {
      charset[random.nextInt(charset.length)];
    }).join();
    return result;
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    final result = digest.toString();
    return result;
  }
}
