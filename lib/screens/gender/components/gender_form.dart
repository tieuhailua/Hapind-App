import 'package:flutter/material.dart';
import 'package:hapind/components/default_button.dart';
import 'package:hapind/model/user_register.dart';
import 'package:hapind/screens/purpose/purpose_screen.dart';
import 'package:hapind/screens/status/status_screen.dart';
import 'package:quickalert/quickalert.dart';

class CompleteGenderForm extends StatefulWidget {
  final UserRegister user;

  const CompleteGenderForm({Key? key, required this.user}) : super(key: key);

  @override
  _CompleteGenderFormState createState() => _CompleteGenderFormState(user: user);
}

class _CompleteGenderFormState extends State<CompleteGenderForm> {
  final UserRegister user;
  _CompleteGenderFormState({required this.user});
  var _isSelected = false;
  String? selectedGender;

  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? gender;

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

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Gender')),
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
      appBar: AppBar(title: const Text('Gender')),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            RadioListTile<String>(
              title: const Text('Male'),
              value: 'Male',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Female'),
              value: 'Female',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate() && selectedGender != null) {
                  // Do something with the selected gender
                  print("Selected Gender: $selectedGender");
                  user.gender=selectedGender;
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompletePurposeScreen(user: user),
                        ));
                  //Navigator.pushNamed(context, CompletePurposeScreen.routeName);
                }else{
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.warning,
                      text: "You must select gender!",
                      confirmBtnText: 'OK',
                      confirmBtnColor: Colors.redAccent,
                      onConfirmBtnTap: () {
                        Navigator.pop(context); // Dismiss the alert
                      },
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
