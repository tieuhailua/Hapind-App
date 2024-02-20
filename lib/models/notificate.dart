import 'package:cloud_firestore/cloud_firestore.dart';

class Noti {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  late String pushToken;
  final Timestamp timestamp;

  Noti({
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.pushToken,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'message': pushToken,
      'timestamp': timestamp,
    };
  }
}

