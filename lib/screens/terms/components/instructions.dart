import 'package:flutter/material.dart';

class Instructions extends StatefulWidget {
  const Instructions({Key? key}) : super(key: key);

  @override
  State<Instructions> createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instruct',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               buildSubheading('Guide to safety when meeting in real life for you Tips to keep you safer ( though we hope you don\'t worry about this)'),
              buildParagraph(
                  'We live in a world where some people have bad intentions. We want to do everything we can to stay safe in the real world, but we also understand that this is not always necessary. You don\'t have to go above and beyond to stay safe, and it\'s unfair for someone to have to take more precautions than someone else because of their gender, gender identity, race, religion, or sexual orientation.'),
              buildParagraph(
                  'If something happens outside of the app, here are some things to keep in mind — you can stop the person from contacting you through the messaging service you\'re using and report the person to us. Even if the person has unmatched you, you can still report the person to us here so we can review it and determine what steps to take. Let me be clear: No one deserves to be put in a dangerous situation regardless of how much they drank or who received the message to get them home. If someone commits an act of violence against you, that is unacceptable. Here are some tips to help you stay safer when meeting in real life, although we hope you don\'t need to worry about this:'),
              buildSubheading('Before meeting'),
              buildBulletPoint([
                'Don\'t rush to leave the app or share your personal information: Only give out your phone number when you feel comfortable and be sure to keep information like your home address and daily habits private when meeting someone . newbie.',
                'Keep everyone in the loop: Let your friends and family know about your plans - it\'s best to let someone you trust know where you are.',
                'Always take the initiative: Take care of your own transportation to the meeting place even if someone offers to pick you up.',
                'lways choose (and stay in) a public place when meeting someone you don\'t really know.'
              ]),
              buildSubheading('During the appointment:'),
              buildBulletPoint([
                'If you are using drugs or alcohol, understand how they affect you. Unfortunately, sometimes there are people out there who try to take advantage of that with bad intentions.',
                'Always keep your belongings with you: handbag, phone, keys, wallet, drinks? Please keep your hobbies with you',
                'Tell someone close to you where you are going.',
                'If you feel uncomfortable, leave the tick.',
              ]),
              buildSubheading('After the appointment:'),
              buildBulletPoint([
                'Take the initiative: Take care of your own transportation when returning home ',
                'Did you have a funny unfortunate experience ? Huy is compatible with them - and informs them if changes are necessary. Don\'t worry!'
              ]),
              buildSubheading('As for COVID::'),
              buildParagraph(
                  'We are all anxious to meet outdoors again , but it is everyone\'s responsibility at this time to keep each other safe. When the local health authority agrees to have people gather in small groups and you are ready to expand your regular group practice, follow the local health authority\'s recommendations or refer to the guidelines. of the World Health Organization. When you have asthma, talk about what makes you feel comfortable - and uncomfortable -. It\'s very important to set clear limits and scales about what you\'re comfortable with in your current relationships. Remember: your safety and peace of mind should always be your top priority. To assist you in this process, we also consulted with Peter Pitts, President of the Center for Medicine in the Public Interest, to develop tips to help you. Let\'s return to meeting outdoors safely'),
              buildBulletPoint([
                '1. Or seriously wear makeup: Every time you meet a new person, cover your hood and mouth. That way, you will keep your body and work safe and show off more strongly. Remember: the virus is said to be contagious even when you don\'t have any symptoms.',
                '2. Avoid touching or being shy: Don\'t hold hands, hug or kiss someone until you know that person\'s personality - and also complain in the same way when meeting that person\'s friends. Or connect online if you\'re sure you can\'t brag: This virus affects each person in different ways, so if you\'re 100% sure you can\'t brag, try dating via Zoom, FaceTime or using video chat. your favorite. It\'s not worth taking the risk and making yourself or someone else sick - you can have a shimmering tower or call to eat at home.',
                '3. Be careful while choosing a date spot: If you feel comfortable meeting in person, make sure you choose a location that implements safety and social distancing measures. Remember to bring wipes, hand sanitizer, and wipe off anything you might touch or stand on. And don\'t forget to wave your hands often!'
              ]),
              buildParagraph(
                  'If you start to feel unwell, follow the advice of local health authorities and let anyone you know know as soon as possible.'),
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
