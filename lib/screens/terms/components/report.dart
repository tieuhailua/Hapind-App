import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instructions for reporting spam',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSubheading('Report That (when should you or shouldn\'t you report someonee on Hapind)'),
              buildParagraph('We always consider safety a top priority on Hapind and we want you to report any suspicious behavior you see. No one has good intentions. And having tens of millions of users in the app means you\'ll miss a few members. To make our reporting process more efficient, we need everyone to understand when you should and shouldn\'t report someone on Hapind. Our diversity is what sets us apart from other asthma apps - and we really like that. In the future, you will have the opportunity to work at different types of people from different levels. Think of us as a rapidly growing competition with new members coming from all over, like when you\'re in Hanoi or Ho Chi Minh City. Ho Chi Minh received 1000 orchids. And often consider yourself as a responsible citizen: If that expert\'s position is not good, please speak up. You will not only protect other users from falling victim to similar acts but will also be the right hand to support us in blind spots we cannot observe. Keep your community safe by reporting violations of our Code of Conduct. Without further ado, below is what you need to know about reporting violations.'),
               buildSubheading('Online'),
              buildParagraph(
                  'You are here to create a personal connection not to make money. If someone asks for your financial information, you should let them know - and let us know. We want to know if anyone is providing personal information in their email address or your information panel'),
              buildSubheading('Please report whipping behavior in and out of the app'),
              buildParagraph('We take every report of harassment seriously, and you should too. But we don\'t know if someone is stalking you when you meet in real life. If someone sends harassing messages, inside or outside the app, or let us know, we will contact you and handle the matter.'),
              
              buildSubheading('Reports those who don\'t come back to you. '),
              buildParagraph('Sometimes when you don\'t receive a return message from someone who is compatible with you , you wonder why they were compatible with you in the first place. It\'s because they no longer care, it\'s likely because they\'re timid or shy - you\'ll never know. Soothe your ego by going back and looking for new sessions instead of reporting them.'),
             
              buildSubheading('Please report any sexually explicit content posted without your consent'),
              buildParagraph('We will be happy to intervene when we change a message that is not appropriate for the application, but each person has different limits. If someone tells you sexually explicit content that has been approved by you, you can report it to us as soon as you initiate that conversation outside of the app. Or make sure that you are compatible with them and provide them with all the activities they can relate to.'),
              
              buildSubheading('Reported them based on her hair, gender or sexual orientation'),
              buildParagraph(
                  ' Not everyone on your potential matches list is like you or has the same beliefs as you. If you don\'t care about someone because they are different in race, religion, or sexual orientation, what should you do? You can swipe left to pass and move to the next person . Reporting someone using your identity indicates that you are a racist.'),
             
              
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
