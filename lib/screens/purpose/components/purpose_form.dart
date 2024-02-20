import 'package:flutter/material.dart';
import 'package:hapind/components/default_button.dart';
import 'package:hapind/model/choice.dart';
import 'package:hapind/model/purpose.dart';
import 'package:hapind/model/user_register.dart';
import 'package:hapind/screens/finding/finding_screen.dart';
import 'package:hapind/screens/purpose/purpose_screen.dart';
import 'package:hapind/service/choice_service.dart';
import 'package:hapind/ultis/database_helper.dart';
import 'package:quickalert/quickalert.dart';

class CompletePurposeFrom extends StatefulWidget {
  final UserRegister user;

  const CompletePurposeFrom({Key? key, required this.user}) : super(key: key);

  @override
  _CompletePurposeFormState createState() =>
      _CompletePurposeFormState(user: user);
}

class _CompletePurposeFormState extends State<CompletePurposeFrom> {
  var _isSelected = false;
  int? selectedPurpose;
  final _choiceService = ChoiceService();
  final UserRegister user;
  _CompletePurposeFormState({required this.user});
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? work;

  Future<void> _fetchPurposeChoice() async {
    try {
      // Call your API to get purpose choices
      final List<Purpose>? purposes = await _choiceService.getPurposeChoice();

      // Save the data to SQLite
      // if (purposes != null && purposes.isNotEmpty) {
      //   // Assuming you have a function to save to SQLite, e.g., insertPurposeChoice
      //   await DatabaseHelper.instance.insertPurpose(purposes);
      // }
    } catch (error) {
      // Handle API or database errors
      print('Error fetching purpose choices: $error');
    }
  }

  Future<List<Purpose>>? getPurposeChoicesFromSQLite() async {
    // Assuming you have a function to get purpose choices from SQLite
    return await _choiceService.getPurposeChoice();
    ;
  }

  @override
  void initState() {
    super.initState();
    _fetchPurposeChoice();
  }

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
  //     appBar: AppBar(title: const Text('Purpose')),
  //     body: Form(
  //       key: _formKey,
  //       child: Column(
  //         children: <Widget>[
  //           RadioListTile<String>(
  //             title: const Text('Male'),
  //             value: 'Male',
  //             groupValue: selectedPurpose,
  //             onChanged: (value) {
  //               setState(() {
  //                 selectedPurpose = value;
  //               });
  //             },
  //           ),
  //           RadioListTile<String>(
  //             title: const Text('Female'),
  //             value: 'Female',
  //             groupValue: selectedPurpose,
  //             onChanged: (value) {
  //               setState(() {
  //                 selectedPurpose = value;
  //               });
  //             },
  //           ),
  //          DefaultButton(
  //             text: "Continue",
  //             press: () {
  //               if (_formKey.currentState!.validate() && selectedPurpose != null) {
  //                 print("Selected Purpose: $selectedPurpose");
  //                 Navigator.pushNamed(context, CompletePurposeScreen.routeName);
  //               }else{
  //                 QuickAlert.show(
  //                     context: context,
  //                     type: QuickAlertType.warning,
  //                     text: "You must select purpose!",
  //                     confirmBtnText: 'OK',
  //                     confirmBtnColor: Colors.redAccent,
  //                     onConfirmBtnTap: () {
  //                       Navigator.pop(context); // Dismiss the alert
  //                     },
  //                   );
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
      appBar: AppBar(title: const Text('Purpose')),
      body: FutureBuilder<List<Purpose>>(
        future: getPurposeChoicesFromSQLite(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator while fetching data
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Show error message if there's an error
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Show a message when there are no purpose choices
            return Text('No purpose choices available.');
          } else {
            // Display the purpose choices retrieved from SQLite
            final purposeChoices = snapshot.data!;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  // Iterate over purpose choices and create RadioListTile
                  for (var purposeChoice in purposeChoices)
                    RadioListTile<int>(
                      title: Text(purposeChoice.name ?? ""),
                      value: purposeChoice.id ?? 0,
                      groupValue: selectedPurpose,
                      onChanged: (value) {
                        setState(() {
                          selectedPurpose = value;
                        });
                      },
                    ),

                  DefaultButton(
                    text: "Continue",
                    press: () {
                      if (_formKey.currentState!.validate() &&
                          selectedPurpose != null) {
                        print("Selected Purpose: $selectedPurpose");
                        user.purpose = selectedPurpose as int?;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CompleteFindingScreen(user: user),
                            ));
                        //Navigator.pushNamed( context, CompleteFindingScreen.routeName);
                      } else {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.warning,
                          text: "You must select purpose!",
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
            );
          }
        },
      ),
    );
  }
}
