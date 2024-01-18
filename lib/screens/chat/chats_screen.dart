import 'package:flutter/material.dart';
import 'package:hapind/constants.dart';

import 'components/body.dart';


class ChatsScreen extends StatefulWidget {
  static String routeName = "/chat";

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title:  Image.asset('assets/icons/logo1.png', width: 200,height: 150, ),),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColors,
        child: const Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
       
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      
      items:  [
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
       //BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
         BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
        // BottomNavigationBarItem(
        //   icon: CircleAvatar(
        //     radius: 14,
        //     backgroundImage: AssetImage("assets/images/splash.png"),
        //   ),
        //   label: "Profile",
        // ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColors,
      automaticallyImplyLeading: false,
      title: const Text("Chats"),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }
}