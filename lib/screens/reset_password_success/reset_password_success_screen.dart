import 'package:flutter/material.dart';

import 'components/body.dart';

class ResetPasswordSuccessScreen extends StatelessWidget {
  static String routeName = "/reset_password_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Reset Password Success"),
      ),
      body: Body(),
    );
  }
}
