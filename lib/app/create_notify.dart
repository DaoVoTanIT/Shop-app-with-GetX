// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:cmms/translations/export_lang.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CreateNotify {
  Future<void> createNotification() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();
    const DarwinInitializationSettings initializationSettingsMacOS =
        DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: initializationSettingsMacOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> scheduleNotification(
      int hour, int minutes, String nameAssets) async {
    tz.initializeTimeZones();
    const String timeZoneName = 'Asia/Bangkok';
    tz.setLocalLocation(tz.getLocation(timeZoneName));
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'CMMS', 'CMMS',
        playSound: true,
        largeIcon: DrawableResourceAndroidBitmap('@mipmap/launcher_icon'),
        //  sound: RawResourceAndroidNotificationSound('soproudnotification'),
        channelDescription: 'Notification');
    const iOSPlatformChannelSpecifics = DarwinNotificationDetails();
    const platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    final now = DateTime.now();
    final offset = now.timeZoneOffset;
    await flutterLocalNotificationsPlugin.cancelAll();
    // await flutterLocalNotificationsPlugin.show(
    //     12345,
    //     assetsDb.db.assetName,
    //     'Thay đổi trạng thái sang ${assetsDb.messageStatus}',
    //     platformChannelSpecifics,
    //     payload: 'data');
    await flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        'notification'.tr(),
        // assetsDb.db.assetName,
        '${'changeStatus'.tr()} $nameAssets',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 1)),

        // tz.TZDateTime(tz.local, now.year, now.month, now.day,
        //     hour - offset.inHours, minutes, 00),

        platformChannelSpecifics,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.time);
  }
}
