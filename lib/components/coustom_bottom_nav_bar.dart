import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hapind/screens/home/home_screen.dart';
import 'package:hapind/screens/chat/chats_screen.dart';
import 'package:hapind/screens/like/like.dart';
import 'package:hapind/screens/profile/profile_screen.dart';
import 'package:hapind/screens/search/search_screen.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color.fromARGB(255, 10, 9, 9);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.25),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 247, 247, 247),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                
                 icon: Icon(Icons.home,
                  color: MenuState.home == selectedMenu
                       ? kPrimaryColor
                : inActiveIconColor,),
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              IconButton(
                // icon: SvgPicture.asset("assets/icons/Heart Icon.svg"),
                icon: Icon(Icons.search,color:Colors.orange),
                onPressed: () =>Navigator.pushNamed(context,SearchScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/likes_active_icon.svg",
                  height: 32, // Đặt chiều cao mong muốn
                  width: 32,
                
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, LikesPage.routeName),
              ),
              IconButton(
                icon: Icon(Icons.message, color: Color.fromARGB(255, 201, 141, 226)),
                onPressed: () =>Navigator.pushNamed(context,ChatsScreen.routeName),
              ),
              IconButton(
                // icon: SvgPicture.asset(
                //   "assets/icons/User Icon.svg",
                //   color: MenuState.profile == selectedMenu
                //       ? kPrimaryColor
                //       : inActiveIconColor,
                // ),
                 icon: Icon(Icons.person,
                 color: MenuState.profile == selectedMenu ? kPrimaryColor:inActiveIconColor
                 ),
                onPressed: () =>
                    Navigator.pushNamed(context, ProfileScreen.routeName),
              ),
            ],
          )),
    );
  }
}
