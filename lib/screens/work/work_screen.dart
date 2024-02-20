import 'package:flutter/material.dart';
import 'package:hapind/screens/work/components/work_form.dart';




class CompleteWorkScreen extends StatelessWidget {
  static String routeName = "/work";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CompleteWorkForm(),     
    );  
  }
}
