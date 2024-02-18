import 'package:hive_flutter/adapters.dart';
import 'package:today/helpers/constants.dart';
import 'package:today/models/hive/local_user_model.dart';
import 'package:today/managers/notifications_manager.dart';

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
