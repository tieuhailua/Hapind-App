import 'package:flutter/material.dart';
import 'package:hapind/model/user_register.dart';
import 'package:hapind/screens/distance/components/distance_form.dart';



class CompleteDistanceScreen extends StatelessWidget {
   CompleteDistanceScreen({required this.user});
   final UserRegister user;
  static String routeName = "/distance";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CompleteDistanceForm(user:user),     
    );  
  }
}
