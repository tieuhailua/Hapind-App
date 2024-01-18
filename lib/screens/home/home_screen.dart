import 'package:flutter/material.dart';
import 'package:hapind/components/coustom_bottom_nav_bar.dart';
import 'package:hapind/enums.dart';
import 'package:hapind/screens/home/components/story_pages.dart';


//import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:MainPage(),
      
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      
    );
  }
}
