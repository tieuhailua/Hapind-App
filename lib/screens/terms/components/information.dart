import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Company Information Basic',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildParagraph(
                  'We\'ve created a list of things you can do to stay safer on Hapind and when dating in real life, they\'re all in the same place.'),
              buildParagraph(
                  'Come back anytime you have any questions or concerns Online Never give your personal information, address information or financial information to a match on Hapind.'),
              buildParagraph(
                  'Keep giving me your phone number until you turn it off and change your phone to do so.'),
              buildParagraph(
                  'Spend more time chatting before contacting someone other than Hapind.'),
              buildParagraph(
                  'Immediately report any suspicious and inappropriate behavior.'),
                   buildSubheading('For example::'),
              buildBulletPoint([
                  'Ask for money.',
                  'Rotate or ream.',
                  'Harmful behavior during or after meeting in person.',
                  'Members under 18 years old.',
                  'Spams.',
                  'Unsolicited requests for any nude or sexual images - whether they include you or someone else.']),
              buildSubheading('Encounter in Real Life:'),
              buildBulletPoint([
                 'Meet and chat in public places.',
                  'Take initiative with your means of transportation.',
                  'Tell someone close to you where you are going.',
                  'If you feel uncomfortable, leave the tick.',
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
