import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:hapind/models/sendFile.dart';
import 'package:image_picker/image_picker.dart';

class ImageService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  late String chatRoomId;
  final _picker = ImagePicker();

  Future<File?> getImage() async {
    try {
      // Use the image_picker package to pick an image
      final XFile? image = await _picker.pickImage(
        imageQuality: 70,
        maxWidth: 1440,
        source: ImageSource.gallery,
      );

      if (image != null) {
        return File(image.path);
      } else {
        // User canceled image picking
        return null;
      }
    } catch (e) {
      // Handle exceptions if any
      print("Error picking image: $e");
      return null;
    }
  }

 Future<void> sendImage(String receiverId, File? imageFile) async {
  try {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    // Upload image to Firebase Storage
    String? imageUrl = await uploadImage(imageFile!);

    // Store image URL in Firestore
    if (imageUrl != null) {
      sendFile newFile = sendFile(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: receiverId,
        imageUrl: imageUrl,
        timestamp: timestamp,
      );

      // Constructor chat room id from current user id and receiver id
      List<String> ids = [currentUserId, receiverId];
      ids.sort();
      chatRoomId = ids.join("_");

      await _fireStore
          .collection('chat_rooms')
          .doc(chatRoomId)
          .collection('messages')  // Use the 'messages' collection for both text and images
          .add(newFile.toMap());
    }
  } catch (e) {
    print("Error sending image: $e");
  }
}


  Future<String?> uploadImage(File imageFile) async {
  try {
    String userId = _firebaseAuth.currentUser!.uid;
    final ext = imageFile.path.split('.').last;
    final ref = _firebaseStorage
        .ref()
        .child("images/$userId/${DateTime.now().millisecondsSinceEpoch}.$ext");

    await ref.putFile(imageFile);
    String downloadUrl = await ref.getDownloadURL();

    return downloadUrl;
  } catch (e) {
    print("Error uploading image: $e");
    return null;
  }
}

}
