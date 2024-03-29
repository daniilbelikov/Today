import 'today_app.dart';
import 'services/today_services.dart';
import 'package:flutter/material.dart';
import 'package:today/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final options = DefaultFirebaseOptions.currentPlatform;
  await Firebase.initializeApp(options: options);
  await TodayServices.initServices();
  runApp(const TodayApp());
}
