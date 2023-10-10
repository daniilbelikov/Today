import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsManager {
  static FlutterLocalNotificationsPlugin plugin =
      FlutterLocalNotificationsPlugin();

  static AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'android_notifications',
    'Android Notifications',
    importance: Importance.high,
    playSound: true,
  );

  Future initFirebaseMessaging() async {
    await Firebase.initializeApp();

    await plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    if (Platform.isAndroid) {
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  static void initLocalNotifications() {
    requestPermission();
    registerSettings();
    onForegroundMessage();
  }

  static void getFCMToken() async {
    final messaging = FirebaseMessaging.instance;
    final fcmToken = await messaging.getToken() ?? '';
    final storage = await SharedPreferences.getInstance();
    storage.setString('fcm', fcmToken);
  }

  static registerActionsListener(BuildContext context) {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
  }

  static requestPermission() {
    FirebaseMessaging.instance.requestPermission();
  }

  static void registerSettings() {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = DarwinInitializationSettings(defaultPresentBadge: true);
    const settings = InitializationSettings(android: android, iOS: iOS);
    plugin.initialize(settings);
  }

  static Future<void> onBackgroundMessage(RemoteMessage message) async {
    final notification = message.notification;

    if (notification == null) return;

    await plugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          playSound: true,
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentSound: true,
          presentBadge: true,
        ),
      ),
    );
  }

  static void onForegroundMessage() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        final notification = message.notification;

        if (notification == null) return;

        await plugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              playSound: true,
            ),
            iOS: const DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
            ),
          ),
        );
      },
    );
  }
}
