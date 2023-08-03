import 'today_app.dart';
import 'firebase_manager.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseManager().init();
  runApp(const TodayApp());
}
