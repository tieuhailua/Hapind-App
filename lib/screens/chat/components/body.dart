import 'package:flutter/material.dart';
import 'package:hapind/constants.dart';
import 'package:hapind/screens/messages/message_screen.dart';

import '../../../models/chat.dart';
import 'chat_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
         //color: kPrimaryColor,
          // child: Row(
          //   children: [
          //     FilledButton( onPressed: () {  },
          //     child: null,),
          //     const SizedBox(width: kDefaultPadding),
          //     ElevatedButton(
          //       onPressed: () {  }, child: null,
          //     ),
          //   ],
          // ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  MessagesScreen(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}