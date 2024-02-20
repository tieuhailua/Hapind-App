import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationService extends ChangeNotifier {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  late Notification noti;
}
