import 'package:flutter/material.dart';
import 'package:hapind/model/user_register.dart';
import 'package:hapind/size_config.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {

   OtpScreen({required this.user});
   final UserRegister user;

  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Body(user: user,),
    );
  }
}
