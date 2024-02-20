import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hapind/models/message.dart';

class ChatService extends ChangeNotifier {
  // get instance of auth and firsStore
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final _firebaseMessaging = FirebaseMessaging.instance;
  late Message message;
  late String chatRoomId;

  Future<Map<String, dynamic>?> getUserDataByEmail(String? email) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print('Error getting user data: $e');
    }
    return null;
  }

  Future<void> sendMessage(
    String receiverId,
    String message,
  ) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
    );

    // Constructor chat room id from current user id and receiver id
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    chatRoomId = ids.join("_");
    await _fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  //get message
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    //construct chat room id from user ids(sorted to ensure it matches the id used when sending)
    List<String> ids = [userId, otherUserId];
    ids.sort();
    chatRoomId = ids.join("_");
    return _fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token : $fCMToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  // Future<void> initNotification() async {
  //   await _firebaseMessaging.requestPermission();
  //   final fCMToken = await _firebaseMessaging.getToken();
  //   print('Token : $fCMToken');

  //   // Add message handling for when the app is in the foreground
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     print('Got a message whilst in the foreground!');
  //     print('Message data: ${message.data}');
  //     // Add your custom logic to handle the message while the app is in the foreground
  //   });
  //   // Add message handling for when the app is in the background
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     print('A new onMessageOpenedApp event was published!');
  //     print('Message data: ${message.data}');
  //     // Add your custom logic to handle the message when the app is opened from the background
  //   });

  //   // Add background message handling
  //   FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  // }

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    print('Title : ${message.notification?.title}');
    print('Body : ${message.notification?.body}');
    print('Payload : ${message.data}');
  }

}
