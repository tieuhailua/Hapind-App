import 'package:flutter/material.dart';
import 'package:hapind/components/default_button.dart';
import 'package:hapind/screens/purpose/purpose_screen.dart';


class CompleteSmokingFrom extends StatefulWidget {
  @override
  _CompleteSmokingFormState createState() => _CompleteSmokingFormState();
}

class _CompleteSmokingFormState extends State<CompleteSmokingFrom> {
  var _isSelected = false;

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
      appBar: AppBar(title: const Text('Smoking')),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            FilterChip(
              selected: _isSelected,
              label: const Text('Smoking'),
              onSelected: (_) {
                _isSelected = _;
                setState(() {});
              },
            ),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, CompletePurposeScreen.routeName);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
