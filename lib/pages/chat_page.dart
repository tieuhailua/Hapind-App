import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hapind/components/chat_bubble.dart';
import 'package:hapind/components/my_text_field.dart';
import 'package:hapind/constants.dart';
import 'package:hapind/model/user.dart' as HapindUser;
import 'package:hapind/service/chat/chat_service.dart';
import 'package:hapind/service/chat/image_service.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserID;
  final HapindUser.User user;
  const ChatPage(
      {super.key,
      required this.receiverUserEmail,
      required this.receiverUserID,
      required this.user});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final ImageService _imageService = ImageService();
  final FirebaseAuth.FirebaseAuth _firebaseAuth =
      FirebaseAuth.FirebaseAuth.instance;

  ScrollController _scrollController = ScrollController();

  void sendMessage() async {
    //only send message if there is something to send
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverUserID, _messageController.text);
      _messageController.clear();
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void sendImageOnly() async {
    // Get the picked image file
    File? pickedImage = await _imageService.getImage();

    // Check if an image was picked before calling sendImageOnly
    if (pickedImage != null) {
      await _imageService.sendImage(widget.receiverUserID, pickedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(widget.user),
      body: Column(children: [
        //message
        Expanded(
          child: _buildMessageList(),
        ),
        // user input
        _buildMessageInput(),

        const SizedBox(height: 25),
      ]),
    );
  }

  AppBar buildAppBar(HapindUser.User user) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          CircleAvatar(
            backgroundImage:
                NetworkImage(user.userImages?.first.imagePath ?? ""),
          ),
          const SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.fullname ?? "",
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

  // build message list
  // Widget _buildMessageList() {
  //   return StreamBuilder(
  //     stream: _chatService.getMessages(
  //         widget.receiverUserID, _firebaseAuth.currentUser!.uid),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasError) {
  //         return Text('Error ${snapshot.error}');
  //       }
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return const Text('Loading ...');
  //       }

  //       return ListView(
  //         children: snapshot.data!.docs
  //             .map((document) => _buildMessageItem(document))
  //             .toList(),
  //       );
  //     },
  //   );
  // }
  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(
        widget.receiverUserID,
        _firebaseAuth.currentUser!.uid,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading ...');
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          // Scroll to the last item when the widget is built
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        });

        return ListView.builder(
          controller: _scrollController,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            return _buildMessageItem(snapshot.data!.docs[index]);
          },
        );
      },
    );
  }

  // build message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    // align the message to the right if the sender is the current user, otherwise to the left
    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          mainAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            if (data['imageUrl'] != null)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      10), // You can set the border radius
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      6.0), // Match the border radius with the one set in the BoxDecoration
                  child: Image.network(
                    data['imageUrl'],
                    width: 200, // Set the width as per your requirement
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              ChatBubble(message: data['message']),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        children: [
          // Textfield
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: MyTextField(
                controller: _messageController,
                hintText: 'Enter message',
                obscureText: false,
              ),
            ),
          ),
          const SizedBox(width: 0),
          // Send button
          IconButton(
            iconSize: 20.0,
            icon: const Icon(Icons.send),
            onPressed: () {
              sendMessage();
              // _chatService.handleBackgroundMessage();
              _messageController.clear();
            },
          ),
          const SizedBox(width: 3.0),
          // Photo button
          IconButton(
            iconSize: 20.0,
            icon: const Icon(Icons.photo),
            onPressed: () async {
              sendImageOnly();
            },
          ),
          IconButton(
            iconSize: 20.0,
            icon: const Icon(Icons.emoji_emotions),
            onPressed: () async {},
          ),
        ],
      ),
    );
  }
}
