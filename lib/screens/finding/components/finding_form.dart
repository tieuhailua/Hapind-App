import 'package:flutter/material.dart';
import 'package:hapind/components/default_button.dart';
import 'package:hapind/model/user_image.dart';
import 'package:hapind/model/user_register.dart';
import 'package:hapind/screens/distance/distance_screen.dart';
import 'package:hapind/screens/image/image_screen.dart';
import 'package:hapind/screens/purpose/purpose_screen.dart';
import 'package:hapind/screens/status/status_screen.dart';
import 'package:hapind/service/upload_service.dart';
import 'package:quickalert/quickalert.dart';

class CompleteFindingForm extends StatefulWidget {
  final UserRegister user;

  const CompleteFindingForm({Key? key, required this.user}) : super(key: key);

  @override
  _CompleteFindingFormState createState() => _CompleteFindingFormState(user:user);
}

class _CompleteFindingFormState extends State<CompleteFindingForm> {
  var _isSelected = false;
  String? selectedFinding;
  final UserRegister user;
  _CompleteFindingFormState({required this.user});
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? Finding;
  List<UserImage>? userImages;
    UploadService _uploadService = UploadService();

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
  //     appBar: AppBar(title: const Text('Finding')),
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
      appBar: AppBar(title: const Text('Finding')),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            RadioListTile<String>(
              title: const Text('Male'),
              value: 'Male',
              groupValue: selectedFinding,
              onChanged: (value) {
                setState(() {
                  selectedFinding = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Female'),
              value: 'Female',
              groupValue: selectedFinding,
              onChanged: (value) {
                setState(() {
                  selectedFinding = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Everyone'),
              value: 'Everyone',
              groupValue: selectedFinding,
              onChanged: (value) {
                setState(() {
                  selectedFinding = value;
                });
              },
            ),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate() && selectedFinding != null) {
                  // Do something with the selected Finding
                  print("Selected Finding: $selectedFinding");
                  user.finding=selectedFinding;
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompleteDistanceScreen(user: user),
                        ));
                }else{
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.warning,
                      text: "You must select Finding!",
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
