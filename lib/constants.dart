import 'package:flutter/material.dart';
import 'package:hapind/service/token_service.dart';
import 'package:hapind/size_config.dart';
 const kPrimaryColors = Color(0xFF00BF6D);
const kSecondaryColors = Color.fromARGB(255, 250, 250, 250);
const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);
TokenService _tokenService = TokenService();
final Future<String?> kUserToken = _tokenService.readAccessToken();
const kDefaultPadding = 20.0;

const kPrimaryColor = Color.fromARGB(255, 234, 110, 2);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color.fromARGB(255, 6, 6, 6);
const kTextColor = Color.fromARGB(255, 2, 2, 2);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    
final RegExp passwordValidatorRegExp =
    RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$');
final  RegExp digitRegex =  RegExp(r'^[0-9]+$');

const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
// Biểu thức chính quy yêu cầu ít nhất 8 ký tự, bao gồm ít nhất một chữ hoa,
// một chữ thường, một số và một ký tự đặc biệt.
//default pass:Aa@123456
const String kMatchPassError = "Passwords don't match";
const String kMatchPassFormError = "Password is 8+ chars, at least one uppercase, one lowercase, one digit, and one special character.Ex:Aa@123456";
const String kMatchPassFormError2 = "Password requirements:\n- 8 or more characters\n- At least one uppercase letter\n- At least one lowercase letter\n- At least one digit\n- At least one special character (e.g., @, #, \$)";

const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
const String kEmailExitsError = "This Email is already taken";
const String kPhoneExitsError = "This Phone is already taken";
const String phoneValidatorRegExp = "Phone number must be between 8-12 number";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
