import 'package:flutter/material.dart';
import 'package:hapind/components/coustom_bottom_nav_bar.dart';
import 'package:hapind/enums.dart';
import 'package:hapind/service/token_service.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false, 
         title:Image.asset('assets/icons/logo1.png', width: 200,),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
