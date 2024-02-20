import 'package:flutter/material.dart';
import 'package:hapind/components/default_button.dart';
import 'package:hapind/screens/smoking/smoking_screen.dart';


class CompleteStatusFrom extends StatefulWidget {
  @override
  _CompleteStatusFormState createState() => _CompleteStatusFormState();
}

class _CompleteStatusFormState extends State<CompleteStatusFrom> {
  var _isSelected = false;
  bool _isFilterChipSelected = false;
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? work;

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
    return Scaffold(
      appBar: AppBar(title: const Text('Status')),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            FilterChip(
              selected: _isFilterChipSelected,
              label: const Text('Status'),
               onSelected: (bool value) {
                setState(() {
                  _isFilterChipSelected = value;
                });
              },
            ),
             SizedBox(height: 16),
            DefaultButton(
              text: "Continue",
              press: () {
               if (_formKey.currentState!.validate()) {
                  // Do something with the selected state
                  if (_isFilterChipSelected) {
                  Navigator.pushNamed(context, CompleteSmokingScreen.routeName);
                    print('FilterChip is selected');
                  } else {
                    // Chip is not selected
                    print('FilterChip is not selected');
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
