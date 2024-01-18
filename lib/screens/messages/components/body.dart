
// ignore_for_file: duplicate_import

import 'package:flutter/material.dart';
import 'package:hapind/screens/messages/components/chat_input_field.dart';
import 'package:hapind/screens/messages/components/message.dart';

import '../../../constants.dart';
import '../../../models/ChatMessage.dart';



class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) =>
                  Message(message: demeChatMessages[index]),
            ),
          ),
        ),
        const ChatInputField(),
      ],
    );
  }
}
