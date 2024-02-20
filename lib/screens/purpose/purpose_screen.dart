import 'package:flutter/material.dart';
import 'package:hapind/model/user_register.dart';
import 'package:hapind/screens/purpose/components/purpose_form.dart';



class CompletePurposeScreen extends StatelessWidget{
  CompletePurposeScreen({required this.user});
   final UserRegister user;
  static String routeName= "/purpose";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CompletePurposeFrom(user:user),
    );
  }
}