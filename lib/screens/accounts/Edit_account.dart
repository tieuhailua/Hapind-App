import 'package:flutter/material.dart';
import 'package:hapind/screens/accounts/components/%20family_buttton.dart';
import 'package:hapind/screens/accounts/components/%20purpose_button.dart';
import 'package:hapind/screens/accounts/components/Exercise_button.dart';
import 'package:hapind/screens/accounts/components/Gender_button.dart';
import 'package:hapind/screens/accounts/components/Work_button.dart';
import 'package:hapind/screens/accounts/components/habit_button.dart';
import 'package:hapind/screens/accounts/components/hobby_button.dart';
import 'package:hapind/screens/accounts/components/language_button.dart';
import 'package:hapind/screens/accounts/components/literacy_button.dart';
import 'package:hapind/screens/accounts/components/music_button.dart';
import 'package:hapind/screens/accounts/components/pet_button.dart';
import 'package:hapind/screens/accounts/components/singer_button.dart';
import 'package:hapind/screens/accounts/components/smoking_button.dart';
import 'package:hapind/screens/accounts/components/test_button.dart';

class MyAccount extends StatefulWidget {
  static String routeName = "/account";
  final String folderName;
  const MyAccount({Key? key, required this.folderName}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccount();
}

class _MyAccount extends State<MyAccount> {
  double availableScreenWidth = 0;
  int selectedIndex = 0;
  String _gender = "Gender";
  callback(key, item) {
    setState(() {
      print("===== ${item}");
      _gender = item;
    });
  }

  String _avatarUrl =
      //"https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/e44w6saipufr4qhbtesw";
      "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/lpckjnidqulkymh6r1da";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('====== ${widget.folderName}');
  }

  @override
  Widget build(BuildContext context) {
    availableScreenWidth = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile", style: TextStyle(color: Colors.orange)),
      ),
      backgroundColor: Colors.grey[100],
      body: Column(children: [
        // Header Section
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(25),
            children: [
              const Text(
                "Images Uploads",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  buildFileColumn(),
                  SizedBox(
                    width: availableScreenWidth * .03,
                  ),
                  buildFileColumn(),
                  SizedBox(
                    width: availableScreenWidth * .03,
                  ),
                  buildFileColumn(),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  buildFileColumn(),
                  SizedBox(
                    width: availableScreenWidth * .03,
                  ),
                  buildFileColumn(),
                  SizedBox(
                    width: availableScreenWidth * .03,
                  ),
                  buildFileColumn(),
                ],
              ),
              const Divider(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "My preference ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // ... Other widgets ...
              SizedBox(height: 10),
              // Folder List
              Flexible(child: TestButton(folderName: "Test")),
              SizedBox(height: 10),
              Flexible(
                  child:
                      GenderButton(folderName: "Gender", callback: callback)),
              SizedBox(height: 10),
              Flexible(child: WorkButton(folderName: "Work")),
              SizedBox(height: 10),
              Flexible(child: SmokingButton(folderName: "Smoking")),
              SizedBox(height: 10),
              Flexible(child: PurposeButton(folderName: 'Purpose')),
              SizedBox(height: 10),
              Flexible(child: LiteracyButton(folderName: 'Literacy')),
              SizedBox(height: 10),
              Flexible(child: HabitButton(folderName: 'Habit')),
              SizedBox(height: 10),
              Flexible(child: FamilyButton(folderName: ' Family ')),
              SizedBox(height: 10),
              // ... Other widgets ...
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "My preference số nhiều ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Flexible(child: MusicButton(folderName: "Music")),
              SizedBox(height: 10),
              Flexible(child: SingerButton(folderName: "SinGer")),
              SizedBox(height: 10),
              Flexible(child: PetButton(folderName: 'Pet')),
              SizedBox(height: 10),
              Flexible(child: LanguageButton(folderName: "Language")),
              SizedBox(height: 10),
              Flexible(child: HobbyButton(folderName: "Hobby")),
              SizedBox(height: 10),
              Flexible(child: ExerciseButton(folderName: "Exercise")),
            ],
          ),
        )
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Column buildFileColumn() {
    return Column(
      children: [
        Container(
            width: availableScreenWidth * .31,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(38),
            height: 150,
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(Icons.add_circle),
                color: Theme.of(context).primaryColor,
                onPressed: () async {},
              ),
            )),
      ],
    );
  }
}
