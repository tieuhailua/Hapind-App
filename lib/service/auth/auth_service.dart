import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  //instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //instance of firestor
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // sign user in
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      //sign in
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      _fireStore.collection("users").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        "email": email,
      });
     
      print(userCredential);
      return userCredential;

    }
    //catch error
    on FirebaseAuthException catch (e) {
      
      throw Exception(e.code);
    }
  }

  //create a new user
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // after creating user, create new document for the user in the user's collections
      _fireStore.collection("users").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        "email": email,
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // update password
  Future<void> updatePassword(String email, String newPassword) async {
  try {
    // Sign in the user with the provided email and a temporary password
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: 'temporaryPassword',
    );

    // Update the password
    await userCredential.user!.updatePassword(newPassword);
    print("Password updated successfully");
  } on FirebaseAuthException catch (e) {
    // Handle specific exceptions
    if (e.code == 'user-not-found') {
      // Handle the case when the user does not exist
      print("User not found");
    } else {
      // Handle other FirebaseAuth exceptions
      throw Exception(e.code);
    }
  }
}


  // sign out
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
