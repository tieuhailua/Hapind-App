import 'package:flutter/material.dart';

import 'components/body.dart';

class ReportSuccessScreen extends StatelessWidget {
  static String routeName = "/report_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Report Success"),
      ),
      body: Body(),
    );
  }
}
