import 'package:flutter/material.dart';
import 'package:hapind/constants.dart';
import 'package:hapind/model/user.dart';

import 'components/body.dart';

class MessagesScreen extends StatelessWidget {
  static String routeName = "/messages";
  final User user;
  MessagesScreen({required this.user});  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          CircleAvatar(
            backgroundImage: NetworkImage(user.userImages?.first.imagePath??""),
          ),
          const SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                user.fullname??"",
                style: TextStyle(fontSize: 16),
              ),
              // Text(
              //   "Active 3m ago",
              //   style: TextStyle(fontSize: 12),
              // )
            ],
          )
        ],
      ),
      // actions: [
      //   IconButton(
      //     icon: const Icon(Icons.local_phone),
      //     onPressed: () {},
      //   ),
      //   IconButton(
      //     icon: const Icon(Icons.videocam),
      //     onPressed: () {},
      //   ),
      //   const SizedBox(width: kDefaultPadding / 2),
      // ],
    );
  }

}