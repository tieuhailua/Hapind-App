import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hapind/components/custom_surfix_icon.dart';
import 'package:hapind/components/default_button.dart';
import 'package:hapind/components/form_error.dart';
import 'package:hapind/model/user_register.dart';
import 'package:hapind/screens/complete_profile/complete_profile_screen.dart';
import 'package:hapind/screens/otp/otp_screen.dart';
import 'package:hapind/service/login_service.dart';
import 'package:quickalert/quickalert.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? phone;
  String? password;
  String? conform_password;

  final _loginService = LoginService();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () async {
              //My Value
              if (_formKey.currentState!.validate()) {
                String? errorMessage =
                    await _loginService.checkAccountExits(emailController.text);
                if (errorMessage == null) {
                  String? errorMessage2 = await _loginService
                      .checkAccountExits(phoneController.text);
                  if (errorMessage2 == null) {
                    _formKey.currentState!.save();
                    UserRegister user = UserRegister(
                      email: emailController.text,
                      phone: phoneController.text,
                      password: passwordController.text,
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(user: user),
                        ));
                    //Navigator.pushNamed(context, OtpScreen.routeName);
                  } else {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.error,
                      text: errorMessage2,
                      confirmBtnText: 'OK',
                      confirmBtnColor: Colors.redAccent,
                      onConfirmBtnTap: () {
                        Navigator.pop(context); // Dismiss the alert
                      },
                    );
                  }
                } else {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    text: errorMessage,
                    confirmBtnText: 'OK',
                    confirmBtnColor: Colors.redAccent,
                    onConfirmBtnTap: () {
                      Navigator.pop(context); // Dismiss the alert
                    },
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Passwords don't match";
        } else if ((password != value)) {
          //  addError(error: kMatchPassError);
          return "Passwords don't match";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter your password";
        } else if (!passwordValidatorRegExp.hasMatch(value)) {
          return kMatchPassFormError;
        } else if (value.length < 8) {
          // addError(error: kShortPassError);
          return "Password is too short";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        errorMaxLines: 6,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          // addError(error: kEmailNullError);
          return "Please Enter your email";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          // addError(error: kInvalidEmailError);
          return "Please Enter Valid Email";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phone = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        if (value.length >= 8 && value.length <= 12) {
          removeError(error: phoneValidatorRegExp);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter your phone number";
        }
        if (!digitRegex.hasMatch(value)) {
          return "Please Enter digit";
        }
        if (value.length < 8 || value.length > 12) {
          return phoneValidatorRegExp;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  // TextFormField buildEmailFormField() {
  //   return TextFormField(
  //     keyboardType: TextInputType.emailAddress,
  //     onSaved: (newValue) => email = newValue,
  //     onChanged: (value) {
  //       if (value.isNotEmpty) {
  //         removeError(error: kEmailNullError);
  //       } else if (emailValidatorRegExp.hasMatch(value)) {
  //         removeError(error: kInvalidEmailError);
  //       }
  //     },
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         return "Please Enter your email";
  //       } else if (!emailValidatorRegExp.hasMatch(value)) {
  //         return "Please Enter Valid Email";
  //       }

  //       if (errors.isNotEmpty) {
  //         return errors[0];
  //       }

  //       return null;
  //     },
  //     decoration: InputDecoration(
  //       labelText: "Email",
  //       hintText: "Enter your email",
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
  //     ),
  //   );
  // }
}
