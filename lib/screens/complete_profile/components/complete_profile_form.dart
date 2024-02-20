import 'package:flutter/material.dart';
import 'package:hapind/components/custom_surfix_icon.dart';
import 'package:hapind/components/default_button.dart';
import 'package:hapind/components/form_error.dart';
import 'package:hapind/model/user_register.dart';
import 'package:hapind/screens/gender/gender_screen.dart';
import 'package:hapind/screens/otp/otp_screen.dart';
import 'package:hapind/screens/work/work_screen.dart';
import 'package:hapind/service/timestamp_converter.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  final UserRegister user;

  const CompleteProfileForm({Key? key, required this.user}) : super(key: key);

  @override
  _CompleteProfileFormState createState() =>
      _CompleteProfileFormState(user: user);
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  @TimestampConverter()
  DateTime? selectedDate;
  final List<String> vietnamCities = [
    'Hanoi',
    'Ho Chi Minh City',
    'Da Nang',
    // Add more cities as needed
  ];
  TextEditingController dateController = TextEditingController();
  TextEditingController firstController = TextEditingController();

  TextEditingController lastController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  final UserRegister user;
  _CompleteProfileFormState({required this.user});

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
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildDOBFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                user.fullname =
                    firstController.text + " " + lastController.text;
                user.dob = DateTime.parse(dateController.text);
                user.address = addressController.text;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompleteGenderScreen(user: user),
                    ));
                //Navigator.pushNamed(context, CompleteGenderScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: addressController,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        // if (value.isNotEmpty) {
        //   removeError(error: kAddressNullError);
        // }
        // return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          //addError(error: kAddressNullError);
          return "Enter your phone address";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your phone address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  DateTimeField buildDOBFormField() {
    return DateTimeField(
      format: DateFormat("yyyy-MM-dd"), // You can customize the date format
      decoration: InputDecoration(
        labelText: "Date of Birth",
        hintText: "Choose your date of birth",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.calendar_today),
      ),
      controller: dateController,
      onShowPicker: (context, currentValue) async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2101),
        );

        if (date != null) {
          return date;
        } else {
          return currentValue;
        }
      },
      validator: (value) {
        if (value == null) {
          return "Choose your date of birth";
        }
        DateTime currentDate = DateTime.now();
        int age = currentDate.year - value.year;
        if (age <= 16) {
          return "You must be over 16 year old";
        }
        return null;
      },
      onSaved: (newValue) {
        // You can save the selected date if needed
        // For example, you can save it to a variable or your data model
        // Example: dob = newValue;
      },
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      controller: lastController,
      onSaved: (newValue) => lastName = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter your last name";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      controller: firstController,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter your first name";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
