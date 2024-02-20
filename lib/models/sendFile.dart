import 'package:cloud_firestore/cloud_firestore.dart';

class sendFile {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String imageUrl;
  final Timestamp timestamp;

  sendFile({
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.imageUrl,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'imageUrl': imageUrl,
      'timestamp': timestamp,
    };
  }
}
