import 'package:flutter/material.dart';

class Should extends StatefulWidget {
  const Should({Key? key}) : super(key: key);

  @override
  State<Should> createState() => _ShouldState();
}

class _ShouldState extends State<Should> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Should and shouldn\'t',
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
                  'Should and shouldn\'t To make a great trip, there are a few things you need to keep in mind.'),
              buildParagraph(
                  'By now you probably already know that traveling without Tinder is similar to when you go out and forget to bring your wallet and end up having to "suffer" from the things that appear. can be lost!'),
              buildParagraph(
                  'Luckily, the app allows you to meet "places" wherever you go - and who knows , they can help you enjoy the best coffee in the world or take you to the most picturesque place. in the city. And where can you refuse the opportunity to know the first pizza restaurant as introduced by Ben, 24 years old, a genuine New Yorker? By the way, Ben is always with the coolest people and can take you to the best bars - it\'s a connection you don\'t want to worry about.'),
              buildParagraph(
                  'But to have a trip of a lifetime with us, there are a few things you need to pay attention to. Follow these tips and don\'t be surprised if you end up impregnating yourself with friends from different regions.'),
              buildSubheading('Update information'),
              buildParagraph(
                  ' What to do first: Capture your history and let everyone know you are moving on the road. You can set the date and city to move to the top of the information you\'ve written. Nhung should stop disclosing too much information. Personal information, such as address, does not violate our Code of Conduct, nor is it safe for you. Detailed information such as your hotel location and people you know are at risk'),
              buildSubheading('I made a connection before leaving'),
              buildParagraph(
                  'Do you have any instructions? Great, but that doesn\'t help your relationship status unless it\'s from Tinder. If you\'re someone who\'s always planning, you should use Hapind Profile to find potential matches in advance and book meetings. This is a great way to create content that includes new people and new perspectives . To begin your deliberation process, consider questions such as: Is this match appealing to the professional? Is it safe and enjoyable to practice going out with them ? The more important question is, is it worth the time spent in a new city? All these questions are for you to find the answer to.. don\'t ignore them'),
              buildSubheading(' Know about black law'),
              buildParagraph(
                  'From small jobs to smoking, you may be surprised at what is considered criminal behavior that can be prosecuted under the laws of different cities. Make sure you have some legal information about where you are going to avoid serious situations that could disrupt your progress. If you belong to the LGBTQ+ community, you need to know which countries can have members of this community. If you travel to one of these locations, we\'ll notify you when you open Hapind and you can choose your own number while you\'re there'),
              buildSubheading(' Meet everyone '),
              buildParagraph(
                  'Opening your options may lead to more connections. Change is not necessarily permanent and it is easy to go back to the way things were before. Go to Settings and tell Tinder to show everyone you can connect with as much as possible . Gap meets friends, meets people who can afford further money and, more importantly, has the opportunity to meet local people.'),
              buildSubheading('  Or so everyone can see you'),
              buildParagraph(
                  'You\'ve made a connection and you\'re ready to meet in real life in a new city. We\'re here for that, but we have one firm request: Always meet in a public place, whether you\'re 50 km or 5,000 km away . We want you to always stand out, be as visible as the stars themselves become faint! Often meet in places such as restaurants, museums, bars or coffee shops and always pay enough money to get to and from the place to go'),
              buildSubheading('  Share them'),
              buildParagraph(
                  'This is something that you would consider worrying too much about the elderly: always put safety first and don\'t keep your relationships a secret . Let any of your companions know where you are going and who you will encounter. If you are going on a trip alone, tell your friends at home and share information about the people you will meet. Or find out what they think about that person and dare to say that at least one person knows who you are with.'),
              buildSubheading('  Let everyone know about your intentions'),
              buildParagraph(
                  ' Let people know how long you\'ll be there, what type of connections you\'re trying to make , and make sure people understand your expectations. Are you here to have fun but not for long? Let them know this so they don\'t accidentally break the hearts of many people on your journey.'),
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
