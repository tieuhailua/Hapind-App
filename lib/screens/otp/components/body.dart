import 'package:flutter/material.dart';
import 'package:hapind/constants.dart';
import 'package:hapind/model/user_register.dart';
import 'package:hapind/screens/otp/otp_screen.dart';
import 'package:hapind/service/otp_service.dart';
import 'package:hapind/size_config.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
  final UserRegister user;

  Body({required this.user});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "OTP Verification",
                style: headingStyle,
              ),
              Text("We sent your code to +84 898 860 ***"),
              buildTimer(),
              OtpForm(user: user),
              // OtpForm(
              //   user: user,
              //   onResend: () {
              //     // Handle the OTP resend logic here
              //     print("Resending OTP logic goes here");
              //   },
              // ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  //OtpForm.formKey.currentState?.resendOtp();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpScreen(user: user),
                      ));
                },
                child: Text(
                  "Resend OTP Code",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 60.0, end: 0.0),
          duration: Duration(seconds: 60),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
