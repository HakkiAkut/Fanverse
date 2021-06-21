import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationInitializer {

  static Future<void> backgroundNotification(RemoteMessage message) async {}

  static Future<void> foregroundNotification() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    var token = await messaging.getToken();
    messaging.getInitialMessage();
    messaging.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (message.notification != null) {
        await showNotification(title: message.notification.title,body: message.notification.body);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
  }

  static void showNotification({String title, String body}) async {
    FlutterLocalNotificationsPlugin fln = FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = IOSInitializationSettings();
    var initSettings = InitializationSettings(android: android, iOS: iOS);
    fln.initialize(initSettings);
    var android1 = AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.high, importance: Importance.max);
    var iOS1 = IOSNotificationDetails();
    var platform = NotificationDetails(android: android1, iOS: iOS1);
    await fln.show(0, '$title', '$body', platform, payload: 'VIS \n $body');
  }
}
