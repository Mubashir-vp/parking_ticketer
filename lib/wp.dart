
// import 'package:geolocator/geolocator.dart';




// // Initialize the plugin
// void initLocalNotifications() {
//   var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
//   var initializationSettingsIOS = IOSInitializationSettings();
//   var initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//     iOS: initializationSettingsIOS,
//   );
//   flutterLocalNotificationsPlugin.initialize(initializationSettings);
// }

// // Send a local push notification
// void sendLocalNotification() async {
//   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//     'channel_id',
//     'channel_name',
//     'channel_description',
//     importance: Importance.high,
//     priority: Priority.high,
//   );
//   var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//   var platformChannelSpecifics = NotificationDetails(
//     android: androidPlatformChannelSpecifics,
//     iOS: iOSPlatformChannelSpecifics,
//   );
//   await flutterLocalNotificationsPlugin.show(
//     0,
//     'Speed Warning',
//     'You are driving above the speed limit',
//     platformChannelSpecifics,
//   );
// }
