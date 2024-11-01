import 'package:firebase_messaging/firebase_messaging.dart';
import '../services/notification_service.dart';
import 'package:get/get.dart';
import 'package:rentalin_id/app/modules/home/views/home_view.dart';

class FCMHandler {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  static Future<void> initializeFCM() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('Permission denied');
    }

    String? token = await _firebaseMessaging.getToken();
    print('FCM Token: $token');

    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);

    // Handling when app is terminated
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        _handleTerminatedMessage(message);
      }
    });
  }

  static void _handleForegroundMessage(RemoteMessage message) {
    print('Foreground message: ${message.notification?.title}');
    NotificationService.showNotification(message);
  }

  static void _handleBackgroundMessage(RemoteMessage message) {
    print('Background message: ${message.notification?.title}');
    NotificationService.showNotification(message);
    Get.to(() => HomeView()); 
  }

  static void _handleTerminatedMessage(RemoteMessage message) {
    print('Terminated message: ${message.notification?.title}');
    NotificationService.showNotification(message);
    Get.to(() => HomeView()); 
  }
}
