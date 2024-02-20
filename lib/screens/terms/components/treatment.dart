import 'package:flutter/material.dart';

class Treatment extends StatefulWidget {
  const Treatment({Key? key}) : super(key: key);

  @override
  State<Treatment> createState() => _TreatmentState();
}

class _TreatmentState extends State<Treatment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'How to handle ',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildParagraph('If you see something wrong. Please speak up'),
              buildParagraph(
                  'You know what\'s over the limit, and when it happens—we want to know, because we want to make Hapind the safest place to meet new people. You can report anyone in the app if they make you uncomfortable or violate our rules, if they commit serious crimes , or if you know they have behaved like this before. strictly personal. Below is an easy way to let us know when someone is behaving inappropriately , and it\'s completely confidential.'),
              buildSubheading(
                  'We are always ready to support you. We We take harassment as a serious matter and honestly we don\'t want to replace this type of behavior on Hapind. Below are some examples of why we delete accounts:'),
              buildBulletPoint([
                'There are false, delicious words from grapes or insults about us',
                'Guiding messages that insult or threaten anyone inside and outside the application',
                'Harass compatible friends inside and outside the app',
                ' Guri posts pornographic content inside and outside the app without your consent',
                'Garbage collection or solicitation, including links to commercial sites or attempting to sell products or services'
              ]),
             buildParagraphs('Thank you for reading'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildParagraph(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 5, 5, 5),
          fontStyle: FontStyle.italic,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget buildParagraphs(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 220, 5, 5),
          fontStyle: FontStyle.italic,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget buildBulletPoint(List<String> items) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map(
              (item) => buildParagraph('• $item'),
            )
            .toList(),
      ),
    );
  }

  Widget buildSubheading(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 0, 128, 255),
        ),
      ),
    );
  }
}
