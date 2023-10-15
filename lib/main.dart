import 'today_app.dart';
import 'utils/init_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await InitServices.initMessagingService();
  await InitServices.initHiveService();
  runApp(const TodayApp());
}
