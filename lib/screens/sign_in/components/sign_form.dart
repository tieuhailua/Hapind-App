import 'package:flutter/material.dart';
import 'package:hapind/components/custom_surfix_icon.dart';
import 'package:hapind/components/form_error.dart';
import 'package:hapind/helper/keyboard.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/model/user_token.dart';
import 'package:hapind/screens/forgot_password/forgot_password_screen.dart';
import 'package:hapind/screens/login_success/login_success_screen.dart';
import 'package:hapind/service/auth/auth_service.dart';
import 'package:hapind/service/login_service.dart';
import 'package:hapind/service/token_service.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:provider/provider.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  late UserToken? userToken;
  late String? isBan;
  final _loginService = LoginService();
  final _formKey = GlobalKey<FormState>();
  bool? remember = false;
  TokenService _tokenService = TokenService();
  bool online = false;

  @override
  void initState() {
    super.initState();
    loadSavedCredentials();
    loadOnlineAndLastLoginStatus();
  }

  void loadOnlineAndLastLoginStatus() async {
    bool isOnline = await loadOnlineStatus();
    DateTime lastLogin = await loadLastLogin();
    //_loginService.isOnline(0, 0);
    setState(() {
      // Use the loaded values
      online = isOnline;
      lastLogin = lastLogin;
    });
  }

  void loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      emailController.text = prefs.getString('email') ?? '';
      remember = prefs.getBool('remember') ?? false;

      if (remember!) {
        passwordController.text = prefs.getString('password') ?? '';
      }
    });
  }

  void _updateOnlineStatus(bool isOnline) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('online', isOnline);
  }

  void _updateLastLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('lastLogin', DateTime.now().toIso8601String());
  }

  void saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', emailController.text);
    prefs.setString('password', remember! ? passwordController.text : '');
    prefs.setBool('remember', remember!);
  }

  void saveOnlineStatus(bool isOnline) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('online', isOnline);
  }

  Future<bool> loadOnlineStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('online') ?? false;
  }

  void saveLastLogin(DateTime lastLogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lastLogin', lastLogin.toIso8601String());
  }

  Future<DateTime> loadLastLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lastLoginString = prefs.getString('lastLogin');
    return lastLoginString != null
        ? DateTime.parse(lastLoginString)
        : DateTime.now();
  }

  void clearCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', '');
    prefs.setString('password', '');
    prefs.setBool('remember', false);
  }

// Write value
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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

  void showLoginError(String errorMessage) {
    setState(() {
      errors.clear(); // Clear existing errors
      errors.add(errorMessage); // Add the new error message
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
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      remember = value;
                    });
                  }
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Sign in",
            press: () async {
              if (_formKey.currentState!.validate()) {
                userToken = await _loginService.loginByEmail(
                    emailController.text, passwordController.text);
                if (userToken != null) {
                  isBan = await _loginService.checkUser(
                      userToken?.id, userToken?.accessToken);
                  if (isBan == "Succ") {
                    _formKey.currentState!.save();
                    _tokenService.clearUserId();
                    _tokenService.clearUserData();
                    _tokenService.storeUserId(userToken?.id ?? 0);
                    _tokenService.saveUserTokenData(userToken ??
                        UserToken(
                            id: 0,
                            username: '',
                            roles: '',
                            tokenType: '',
                            accessToken: ''));
                    KeyboardUtil.hideKeyboard(context);
                    void signIn() async {
                      // get the auth service
                      final authService =
                          Provider.of<AuthService>(context, listen: false);
                      await authService.signInWithEmailAndPassword(
                          emailController.text, passwordController.text);
                      // try {
                      // await authService.signInWithEmailAndPassword(
                      //     emailController.text, passwordController.text);
                      // } catch (e) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: Text(
                      //         e.toString(),
                      //       ),
                      //     ),
                      //   );
                      // }
                    }

                    signIn();
                    if (remember!) {
                      saveCredentials();
                    } else {
                      clearCredentials();
                    }
                    _loginService.isOnline(userToken?.id ?? 0, 1);
                    Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                  } else {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.warning,
                      text: "You have been ban for $isBan",
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
                    text: 'Invalid account, Please try again!',
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

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      onSaved: (newValue) => passwordController.text = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (String? value) {
        // ignore: unnecessary_null_comparison
        if (value!.isEmpty || value == null) {
          //  addError(error: kPassNullError);
          return "Please Enter your password";
        } else if (value.length < 8) {
          // addError(error: kShortPassError);
          return "Password is too short";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
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
      onSaved: (newValue) => emailController.text = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (String? value) {
        // if (value == null || value.isEmpty) {
        //   //  addError(error: kEmailNullError);
        //   return "Please Enter your email";
        // } else if (!emailValidatorRegExp.hasMatch(value)) {
        //   //  addError(error: kInvalidEmailError);
        //   return "Please Enter Valid Email ";
        // }
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
}
