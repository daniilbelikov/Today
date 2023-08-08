import 'today_app.dart';
import 'package:flutter/material.dart';
import 'managers/firebase_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseManager().init();
  runApp(const TodayApp());
}
