import '../helpers/constants.dart';
import 'package:hive_flutter/adapters.dart';
import '../models/hive/local_user_model.dart';
import '../managers/notifications_manager.dart';

class TodayServices {
  static Future<void> initMessagingService() async {
    await NotificationsManager().initFirebaseMessaging();
  }

  static Future<void> initHiveService() async {
    await Hive.initFlutter();
    Hive.registerAdapter(LocalUserModelAdapter());
    await Hive.openBox(TodayKeys.user);
  }
}
