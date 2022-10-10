import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../router/app_router.gr.dart';

class NotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onSelectedNotifications = BehaviorSubject<String?>();

  Future<void> initialize(AppRouter appRouter) async {
    if (kDebugMode) {
      print('INITIALIZING LOCAL NOTIFICATIONS');
    }

    final String locationName = await FlutterNativeTimezone.getLocalTimezone();
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(locationName));

    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOSSettings = DarwinInitializationSettings();
    const settings = InitializationSettings(
      android: androidSettings,
      iOS: iOSSettings,
    );

    //? When App is Closed
    final details = await _notifications.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      onSelectedNotifications.add(details.notificationResponse!.payload);
    }

    _notifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (notificationResponse) async {
        if (notificationResponse.payload != null) {
          onSelectedNotifications.add(notificationResponse.payload);
        }
      },
      onDidReceiveBackgroundNotificationResponse: (notificationResponse) async {
        if (notificationResponse.payload != null) {
          onSelectedNotifications.add(notificationResponse.payload);
        }
      },
    );

    onSelectedNotifications.stream.listen((payload) {
      if (kDebugMode) {
        print(payload);
      }
      appRouter.push(const AppStartRoute());
    });
  }

  static Future<NotificationDetails> _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel Id',
        'channel Name',
        channelDescription: 'channel Description',
        importance: Importance.max,
        ticker: 'ticker',
      ),
    );
  }

  Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payload,
      );

  Future scheduleNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduledDate,
  }) async =>
      _notifications.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduledDate, tz.local),
        await _notificationDetails(),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
      );

  Future scheduleDailyNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    _notifications.zonedSchedule(
      id,
      title,
      body,
      _scheduleDaily(const Time(10)),
      await _notificationDetails(),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static tz.TZDateTime _scheduleDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local);
    final scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
    );

    return scheduledDate.isBefore(now)
        ? scheduledDate.add(const Duration(days: 1))
        : scheduledDate;
  }

  // _notifications.zonedSchedule(
  //   id,
  //   title,
  //   body,
  //   await _notificationDetails(),
  //   scheduledDate:,
  //   payload: payload,
  //   androidAllowWhileIdle: true,
  //   uiLocalNotificationDateInterpretation: null,
  // );
}
