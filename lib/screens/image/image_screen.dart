import 'package:flutter/material.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/model/user_register.dart';
import 'package:hapind/screens/image/components/image_form.dart';




class CompleteImageScreen extends StatelessWidget {
   CompleteImageScreen({required this.user});
   final User? user;
  static String routeName = "/image";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CompleteImageForm(user:user),     
    );  
  }
}
