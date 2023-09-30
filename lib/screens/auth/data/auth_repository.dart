import 'dart:math';
import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';
import '../../../helpers/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthRepository {
  final _usersRef = FirebaseFirestore.instance.collection(TodayKeys.users);
  final _fireAuth = FirebaseAuth.instance;

  Future<User?> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential = await _fireAuth.signInWithCredential(
        credential,
      );
      final user = userCredential.user;

      addUserInFirestore(user);
      return user;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<User?> signInWithApple() async {
    try {
      final rawNonce = _generateRawNonce();
      final nonce = _sha256ofString(rawNonce);

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      final userCredential =
          await _fireAuth.signInWithCredential(oauthCredential);
      final user = userCredential.user;

      addUserInFirestore(user);
      return user;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> addUserInFirestore(User? user) async {
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
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _fireAuth.signOut();
    } catch (error) {
      throw Exception(error);
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
