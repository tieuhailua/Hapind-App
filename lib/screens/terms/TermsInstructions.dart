import 'package:flutter/material.dart';
import 'package:hapind/screens/terms/components/Consensus.dart';
import 'package:hapind/screens/terms/components/Should.dart';
import 'package:hapind/screens/terms/components/Terms_menu.dart';
import 'package:hapind/screens/terms/components/hapind.dart';
import 'package:hapind/screens/terms/components/information.dart';
import 'package:hapind/screens/terms/components/instructions.dart';
import 'package:hapind/screens/terms/components/quizApp.dart';
import 'package:hapind/screens/terms/components/report.dart';
import 'package:hapind/screens/terms/components/treatment.dart';

class TermsInstrucstions extends StatefulWidget {
  static String routeName = "/terms";

  const TermsInstrucstions({super.key});

  @override
  State<TermsInstrucstions> createState() => _TermsInstrucstionsState();
}

class _TermsInstrucstionsState extends State<TermsInstrucstions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Terms & Instructions",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
           TermsMenu(
              text: "Basic information",
              icon: "assets/icons/User.svg",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Information()));
              }),
               TermsMenu(
              text: "Treatment",
              icon: "assets/icons/thunder.svg",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Treatment()));
              }),
          TermsMenu(
              text: "Safety test when dating online",
              icon: "assets/icons/Question mark.svg",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuizApp()));
              }),
          TermsMenu(
              text: "Quiz about community rules on Hapind",
              icon: "assets/icons/Bill Icon.svg",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HapindApp()));
              }),
              TermsMenu(
              text: "Safety instructions when meeting in real life for you",
              icon: "assets/icons/Mail.svg",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>Instructions()));
              }),
              TermsMenu(
              text: "what to Report",
              icon: "assets/icons/Lock.svg",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Report()));
              }),
              TermsMenu(
              text: "Consensus",
              icon: "assets/icons/like_icon.svg",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Consensus()));
              }),
              TermsMenu(
              text: "Should and Shouldn't",
              icon: "assets/icons/cross.svg",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Should()));
              }),
              
        ],
      ),
    );
  }
}
