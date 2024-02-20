import 'package:flutter/material.dart';
import 'package:hapind/model/user_register.dart';

import 'components/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  CompleteProfileScreen({required this.user});
   final UserRegister user;
  static String routeName = "/complete_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Body(user: user,),
    );
  }
}
