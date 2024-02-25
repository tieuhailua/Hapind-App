import 'package:flutter/material.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/model/user_register.dart';
import 'package:hapind/screens/image/components/image_form.dart';
import 'package:hapind/screens/report/components/report_form.dart';




class ReportFormScreen extends StatelessWidget {
   ReportFormScreen({required this.reported});
   final int reported;
  static String routeName = "/report_form";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReportForm(reported:reported),     
    );  
  }
}
