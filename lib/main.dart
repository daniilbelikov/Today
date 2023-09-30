import 'today_app.dart';
import 'package:flutter/material.dart';
import 'models/hive/local_user_model.dart';
import 'package:today/helpers/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(LocalUserModelAdapter());
  await Hive.openBox(TodayKeys.user);
  runApp(const TodayApp());
}
