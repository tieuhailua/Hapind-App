import 'package:flutter/material.dart';
import 'package:hapind/model/user_register.dart';
import 'package:hapind/screens/gender/components/gender_form.dart';




class CompleteGenderScreen extends StatelessWidget {
  CompleteGenderScreen({required this.user});
   final UserRegister user;
  static String routeName = "/gender";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CompleteGenderForm(user: user),     
    );  
  }
}
