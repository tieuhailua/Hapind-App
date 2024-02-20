import 'package:flutter/material.dart';
import 'package:hapind/model/user_register.dart';
import 'package:hapind/screens/finding/components/finding_form.dart';




class CompleteFindingScreen extends StatelessWidget {
   CompleteFindingScreen({required this.user});
   final UserRegister user;
  static String routeName = "/finding";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CompleteFindingForm(user:user),     
    );  
  }
}
