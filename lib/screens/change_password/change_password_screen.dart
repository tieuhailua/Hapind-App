import 'package:flutter/material.dart';
import 'package:hapind/model/user_register.dart';

import 'components/body.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen();
  static String routeName = "/change_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
      ),
      body: Body(),
    );
  }
}
