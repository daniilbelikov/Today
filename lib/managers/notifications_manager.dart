import 'dart:io';
import '../helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsManager {
  final _plugin = FlutterLocalNotificationsPlugin();

  final _channel = const AndroidNotificationChannel(
    'android_notifications',
    'Android Notifications',
    importance: Importance.high,
    playSound: true,
  );

  Future initFirebaseMessaging() async {
    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    if (Platform.isAndroid) {
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  void initLocalNotifications() {
    _requestPermission();
    _registerSettings();
    _onForegroundMessage();
  }

  void registerActionsListener(BuildContext context) {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
  }

  void _requestPermission() {
    FirebaseMessaging.instance.requestPermission();
  }

  void _registerSettings() {
    const android = AndroidInitializationSettings(TodayValues.icon);
    const iOS = DarwinInitializationSettings(defaultPresentBadge: true);
    const settings = InitializationSettings(android: android, iOS: iOS);
    _plugin.initialize(settings);
  }

  void _onForegroundMessage() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        final notification = message.notification;

        if (notification == null) return;

        await _plugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _channel.id,
              _channel.name,
              channelDescription: _channel.description,
              playSound: true,
              icon: TodayValues.icon,
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

  Future<void> onBackgroundMessage(RemoteMessage message) async {
    final notification = message.notification;

    if (notification == null) return;

    await _plugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _channel.id,
          _channel.name,
          channelDescription: _channel.description,
          playSound: true,
          icon: TodayValues.icon,
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentSound: true,
          presentBadge: true,
        ),
      ),
    );
  }
}
