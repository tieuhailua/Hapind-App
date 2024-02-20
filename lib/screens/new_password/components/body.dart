import 'package:flutter/material.dart';
import 'package:hapind/components/custom_surfix_icon.dart';
import 'package:hapind/components/default_button.dart';
import 'package:hapind/components/form_error.dart';
import 'package:hapind/components/no_account_text.dart';
import 'package:hapind/model/user_register.dart';
import 'package:hapind/screens/otp/otp_screen.dart';
import 'package:hapind/screens/register_success/register_success_screen.dart';
import 'package:hapind/screens/reset_password_success/reset_password_success_screen.dart';
import 'package:hapind/service/auth/auth_service.dart';
import 'package:hapind/service/login_service.dart';
import 'package:hapind/size_config.dart';
import 'package:quickalert/quickalert.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  final UserRegister user;

  Body({required this.user});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Reset Password",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Please enter your new password",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ForgotPassForm(user: user),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  final UserRegister user;

  ForgotPassForm({required this.user});
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState(user: user);
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  LoginService _loginService = LoginService();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final UserRegister user;
  AuthService _authService = AuthService();
  _ForgotPassFormState({required this.user});
  List<String> errors = [];
  String? password;
  String? confirmPassword;

  // Validate the password field
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return kPassNullError;
    } else if (!passwordValidatorRegExp.hasMatch(value)) {
      return kMatchPassFormError2;
    } else if (value.length < 8) {
      return "Password is too short";
    }
    return null;
  }

  // Validate the confirmation password field
  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return kPassNullError;
    } else if (!passwordValidatorRegExp.hasMatch(value)) {
      return kMatchPassFormError2;
    } else if (value.length < 8) {
      return "Password is too short";
    } else if (value != passwordController.text) {
      return "Passwords don't match";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          //new-password
          TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            onSaved: (newValue) => password = newValue,
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
            validator: validatePassword,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter your new password",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          //confirm-password
          TextFormField(
            controller: confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            onSaved: (newValue) => confirmPassword = newValue,
            onChanged: (value) {
              setState(() {
                confirmPassword = value;
              });
            },
            validator: validateConfirmPassword,
            decoration: InputDecoration(
              labelText: "Confirm Password",
              hintText: "Re-enter your password",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          //SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
              text: "Continue",
              press: () async {
                if (_formKey.currentState!.validate()) {
                  if (await _loginService.resetPassword(
                          user.email, confirmPassword) ==
                      true) {
                    void resetPassword() async {
                      final authService =
                          Provider.of<AuthService>(context, listen: false);
                      await authService.updatePassword(
                          user.email ?? "", confirmPassword ?? "");
                    }
                    resetPassword();
                    Navigator.pushNamed(
                        context, ResetPasswordSuccessScreen.routeName);
                  }
                }
                ;
              }),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          //NoAccountText(),
        ],
      ),
    );
  }
}
