import 'package:flutter/material.dart';
import 'package:hapind/screens/status/components/status_form.dart';

class CompleteStatusScreen extends StatelessWidget{
  static String routeName= "/status";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CompleteStatusFrom(),
    );
  }
}