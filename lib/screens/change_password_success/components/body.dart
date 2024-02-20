import 'package:flutter/material.dart';
import 'package:hapind/components/default_button.dart';
import 'package:hapind/screens/sign_in/sign_in_screen.dart';
import 'package:hapind/service/auth/auth_service.dart';
import 'package:hapind/service/login_service.dart';
import 'package:hapind/service/token_service.dart';
import 'package:hapind/size_config.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
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
          "Change Password Success",
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
            text: "Continue",
            press: () async {

              void signOut() {
                final authService =
                    Provider.of<AuthService>(context, listen: false);
                authService.signOut();
              }

              Navigator.of(context).pop();
              _tokenService.clearUserId();
              signOut();
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
