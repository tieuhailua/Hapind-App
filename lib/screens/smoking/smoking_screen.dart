import 'package:flutter/material.dart';
import 'package:hapind/screens/smoking/components/smoking_form.dart';


class CompleteSmokingScreen extends StatelessWidget{
  static String routeName= "/smoking";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CompleteSmokingFrom(),
    );
  }
}