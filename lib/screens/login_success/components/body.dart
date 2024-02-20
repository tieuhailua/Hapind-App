import 'package:flutter/material.dart';
import 'package:hapind/components/default_button.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/screens/home/home_screen.dart';
import 'package:hapind/screens/register_success/register_success_screen.dart';
import 'package:hapind/screens/login_success/login_success_screen.dart';
import 'package:hapind/service/login_service.dart';
import 'package:hapind/service/token_service.dart';
import 'package:hapind/size_config.dart';

class Body extends StatelessWidget {
  final _loginService = LoginService();
  TokenService _tokenService = TokenService();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to home",
            press: () async {
              // //khuc nay goi api cai nua de check ne :)))
              // User? user = await _loginService.checkUser();
              // if (user != null) {
              //   Navigator.pushNamed(context, HomeScreen.routeName);
              // } else {
              //   Navigator.pushNamed(context, LoginFailScreen.routeName);
              // }      
              
              // User? user = await _loginService.getUser(_tokenService.readUserId());
              // _tokenService.saveUserData(user);

              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
