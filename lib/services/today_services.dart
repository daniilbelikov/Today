import '../helpers/constants.dart';
import 'package:hive_flutter/adapters.dart';
import '../models/hive/local_user_model.dart';
import '../managers/notifications_manager.dart';

class TodayServices {
  static Future<void> initServices() async {
    await _initMessagingService();
    await _initHiveService();
  }

  static Future<void> _initMessagingService() async {
    await NotificationsManager().initFirebaseMessaging();
  }

  static Future<void> _initHiveService() async {
    await Hive.initFlutter();
    Hive.registerAdapter(LocalUserModelAdapter());
    await Hive.openBox(TodayKeys.user);
  }
}
