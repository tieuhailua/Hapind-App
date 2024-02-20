import 'package:flutter/material.dart';
import 'package:hapind/components/default_button.dart';
import 'package:hapind/screens/status/status_screen.dart';

class CompleteWorkForm extends StatefulWidget {
  @override
  _CompleteWorkFormState createState() => _CompleteWorkFormState();
}

class _CompleteWorkFormState extends State<CompleteWorkForm> {
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
      appBar: AppBar(title: const Text('Work')),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            FilterChip(
              selected: _isSelected,
              label: const Text('Filter'),
              onSelected: (_) {
                _isSelected = _;
                setState(() {});
              },
            ),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, CompleteStatusScreen.routeName);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
