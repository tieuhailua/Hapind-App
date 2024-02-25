import 'package:flutter/material.dart';
import 'package:hapind/components/default_button.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/model/user_register.dart';
import 'package:hapind/screens/image/image_screen.dart';
import 'package:hapind/screens/otp/otp_screen.dart';
import 'package:hapind/screens/purpose/purpose_screen.dart';
import 'package:hapind/screens/register_success/register_success_screen.dart';
import 'package:hapind/screens/sign_up/sign_up_screen.dart';
import 'package:hapind/screens/status/status_screen.dart';
import 'package:hapind/service/auth/auth_service.dart';
import 'package:hapind/service/signup_service.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:provider/provider.dart';

class CompleteDistanceForm extends StatefulWidget {
  final UserRegister user;

  const CompleteDistanceForm({Key? key, required this.user}) : super(key: key);

  @override
  _CompleteDistanceFormState createState() =>
      _CompleteDistanceFormState(user: user);
}

class _CompleteDistanceFormState extends State<CompleteDistanceForm> {
  var _isSelected = false;
  String? selectedDistance;
  double minSalary = 1;
  double maxSalary = 5;
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String distanceText = 'Distance Radius: 5 KM';
  int? distance = 5;
  SignUpService _signUpService = SignUpService();
  final UserRegister user;
  _CompleteDistanceFormState({required this.user});
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

  void signUp() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailAndPassword(
          user.email ?? "", user.password);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Distance')),
  //     body: Form(
  //       key: _formKey,
  //       child: Column(
  //         children: <Widget>[
  //           FilterChip(
  //             selected: _isSelected,
  //             label: const Text('Male'),
  //             onSelected: (_) {
  //               _isSelected = _;
  //               setState(() {});
  //             },
  //           ),
  //           FilterChip(
  //             selected: _isSelected,
  //             label: const Text('Female'),
  //             onSelected: (_) {
  //               _isSelected = _;
  //               setState(() {});
  //             },
  //           ),
  //           DefaultButton(
  //             text: "Continue",
  //             press: () {
  //               if (_formKey.currentState!.validate()) {
  //                 Navigator.pushNamed(context, CompleteStatusScreen.routeName);
  //               }
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Distance')),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(distanceText),
              ],
            ),
            Slider(
              value: maxSalary,
              min: 1,
              max: 20,
              onChanged: (value) {
                setState(() {
                  distanceText = 'Distance Radius: ${maxSalary.round()} KM';
                  maxSalary = value;
                  distance = value.round();
                  if (value == 20) {
                    distanceText = 'Distance Radius: No matter distance!';
                    distance = 0;
                  }
                  print(distance);
                });
              },
            ),
            DefaultButton(
              text: "Continue",
              press: () async {
                if (_formKey.currentState!.validate() && distance != null) {
                  user.distance = distance;
                  print(user);
                  DateTime now = DateTime.now();
                  user.lastLogin = now;
                  user.createTime = now;
                  user.status = 1;
                  print(user);
                  Future<User?>? newUser = _signUpService.signUp(user);
                  if (newUser != null) {
                    signUp();
                    User? user = await newUser;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompleteImageScreen(user: user),
                        ));
                    // Navigator.pushNamed(
                    //     context, RegisterSuccessScreen.routeName);
                  } else {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.error,
                      text: "Sorry but it seem have problem! Pleaese try again",
                      confirmBtnText: 'OK',
                      confirmBtnColor: Colors.redAccent,
                      onConfirmBtnTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                    );
                  }
                }
                // else {
                //   QuickAlert.show(
                //     context: context,
                //     type: QuickAlertType.warning,
                //     text: "You must select Distance!",
                //     confirmBtnText: 'OK',
                //     confirmBtnColor: Colors.redAccent,
                //     onConfirmBtnTap: () {
                //       Navigator.pop(context); // Dismiss the alert
                //     },
                //   );
                // }
              },
            ),
          ],
        ),
      ),
    );
  }
}
