// import 'package:flutter/material.dart';
// import 'package:hapind/constants.dart';
// import 'package:hapind/screens/messages/message_screen.dart';

// import '../../../models/chat.dart';
// import 'chat_card.dart';

// class Body extends StatelessWidget {
//   const Body({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.fromLTRB(
//               kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
//          //color: kPrimaryColor,
//           // child: Row(
//           //   children: [
//           //     FilledButton( onPressed: () {  },
//           //     child: null,),
//           //     const SizedBox(width: kDefaultPadding),
//           //     ElevatedButton(
//           //       onPressed: () {  }, child: null,
//           //     ),
//           //   ],
//           // ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: chatsData.length,
//             itemBuilder: (context, index) => ChatCard(
//               chat: chatsData[index],
//               press: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>  MessagesScreen(),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hapind/constants.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/models/chat.dart';
import 'package:hapind/pages/chat_page.dart';
import 'package:hapind/screens/chat/components/chat_card.dart';
import 'package:hapind/screens/messages/message_screen.dart';
import 'package:hapind/service/chat/chat_service.dart';
import 'package:hapind/service/user_service.dart';

class Body extends StatelessWidget {
  final UserService _userService = UserService();
  final ChatService _chatService = ChatService();

  Body({Key? key}) : super(key: key); // Remove the 'const' keyword

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
        ),
        Expanded(
          child: FutureBuilder<List<User>>(
            future: _userService.getUserForChat(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<User> users = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) => ChatCard(
                      chat: Chat(
                        name: users[index].fullname ?? "",
                        lastMessage: "Initial message",
                        image: users[index].userImages?.first.imagePath ?? "",
                        time: "N/A",
                        isActive: users[index].online ?? false,
                      ),
                      press: () async {
                        Map<String, dynamic>? data = await _chatService
                            .getUserDataByEmail(users[index].email);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChatPage(user: users[index],
                              receiverUserEmail: data?['email'],
                              receiverUserID: data?['uid'],
                            ),
                          ),
                        );
                      }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => MessagesScreen(user: users[index]),
                      //   ),
                      // ),

                      ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
