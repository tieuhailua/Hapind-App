import 'package:flutter/material.dart';
import 'package:hapind/components/coustom_bottom_nav_bar.dart';
import 'package:hapind/enums.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/screens/home/components/slider.dart';
import 'package:hapind/screens/home/components/story_pages.dart';
import 'package:hapind/service/matching_service.dart';

//import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  //MatchingService _matchingService = MatchingService();
  final User? user=  User();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainPage(user:user),
      
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      
    );
  }
}
