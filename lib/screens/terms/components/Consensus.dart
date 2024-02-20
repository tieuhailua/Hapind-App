import 'package:flutter/material.dart';

class Consensus extends StatefulWidget {
  const Consensus({Key? key}) : super(key: key);

  @override
  State<Consensus> createState() => _ConsensusState();
}

class _ConsensusState extends State<Consensus> {
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
              buildParagraph(
                  'This is an essential element for any connection and we are here to provide you with a quick course. Dissolved sex work'),
              buildParagraph(
                  'Dating and sex have different boundaries and do not always go together. Every person you meet will have their own limitations and expectations, and communication is the key. Consistency is vital to any connection, and we\'re here to give you a crash course. '),
              buildParagraph(
                  'In fact, negotiating is a fairly simple task. It just means asking permission for any activity What intimate dong? Sometimes harmony is expressed through words, other times through actions. The bottom line is that if you meet someone directly , you are responsible for respecting their boundaries, and they are also responsible for respecting your boundaries. If you\'re not completely bored with what\'s comfortable, just keep doing it'),
              buildParagraph(
                  'If you\'re in a relationship with someone, remember: You need to be comfortable and give consent to any sexual activity that occurs. And if you\'re going to take the extra step with them, you have to make sure you have their buy-in at every step of the way.'),
              buildSubheading('Please note :'),
              buildBulletPoint([
                'Sexual assault refers to any sexual activity or contact that occurs without the victim\'s consent . Sexual assault includes rape , unwanted sexual advances, or compulsive acts such as performing or receiving oral sex.',
                ' There is no consent if someone is incapacitated or physically or mentally impaired by the effects of drugs or alcohol because they are unable to understand the physical situation',
                'substance or cause of the situation. Consent is given freely without pressure, fear or hesitation. People who abuse me don\'t always use it; They can persuade, entice or coerce.',
                'You always have the right to say "no". Not saying "no" doesn\'t mean agreeing . If someone feels like they can\'t change their mind or are alone, ask them how they feel and try to give them some space . "Yes the" always means "no".',
                '"Yes" to one type of sexual activity does not mean "yes" to another type of sexual activity. Agreement is not a variable income, it is a continuous review throughout the time you are together. Even if you first agree , the other person always has the right to discuss the matter later and you can also do it.'
              ]),
               buildSubheading('Oblivious to consent'),
               buildParagraph('Agreement doesn\'t always have to be verbal , but verbal agreement about different sexual activities can help you and your partner respect each other\'s boundaries. Verbal agreement can include saying "yes", "don\'t stop", or telling your partner what you want. Some examples of non-verbal consent include touching someone\'s head, pulling someone closer, or engaging in physical activity, such as touching each other.'),
               buildParagraph('Keep in mind that nonverbal signals are less obvious when you\'re with someone new , so it\'s best to stick to verbal agreements until you know someone better. Moreover, asking for consent can become quite a "sexy" act. Dong thuan fade is always clear, enthusiastic and continuous throughout sexual activity. For everyone , what\'s really important in a relationship is that each party feels comfortable with what\'s going on and communicates that comfort every step of the way.'),
               buildParagraph('Please note that consent is not limited to sexual activity — feel free to express mutual preferences about physical activities to ensure you clearly understand each other\'s comfort levels and that You have created clear boundaries when possible . Remember that people who have lost consciousness due to drugs or alcohol will not be able to recover.'),
               buildSubheading('Race to agree '),
               buildParagraph('If you don\'t feel comfortable participating in any activity, you don\'t have to and no one has the right to force you to participate . Be clear about your intentions and understand that no date (or anyone) has the right to force you to exceed your own boundaries, and you shouldn\'t force anyone else to do so either'),
               buildParagraph('If you\'re considering engaging in any sexual activity, let your partner know what\'s right for you — find ways to motivate both of you so you can communicate about continued consent, such as constantly checking in. verbally as the story progresses. If you\'re not sure whether your partner is enthusiastic about a particular sexual activity, ask them. Remember , not saying "no" does not mean "yes".'),
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
