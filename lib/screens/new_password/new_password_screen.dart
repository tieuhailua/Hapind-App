import 'package:flutter/material.dart';
import 'package:hapind/model/user_register.dart';

import 'components/body.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({required this.user});
   final UserRegister user;
  static String routeName = "/new_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Password"),
      ),
      body: Body(user:user),
    );
  }
}
