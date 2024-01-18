


import 'package:flutter/widgets.dart';
import 'package:hapind/screens/home/home_screen.dart';
import 'package:hapind/screens/accounts/Edit_account.dart';
import 'package:hapind/screens/cart/cart_screen.dart';
import 'package:hapind/screens/chat/chats_screen.dart';
import 'package:hapind/screens/complete_profile/complete_profile_screen.dart';
import 'package:hapind/screens/details/details_screen.dart';
import 'package:hapind/screens/forgot_password/forgot_password_screen.dart';
import 'package:hapind/screens/like/like.dart';
import 'package:hapind/screens/login_success/login_success_screen.dart';
// ignore: unused_import
import 'package:hapind/screens/messages/components/message.dart';
import 'package:hapind/screens/messages/message_screen.dart';
import 'package:hapind/screens/otp/otp_screen.dart';
import 'package:hapind/screens/profile/profile_screen.dart';
import 'package:hapind/screens/search/search_screen.dart';
import 'package:hapind/screens/searchlove/searchlove.dart';
import 'package:hapind/screens/sign_in/sign_in_screen.dart';
import 'package:hapind/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  SearchScreen.routeName:(context) => SearchScreen(),
  SearchLoveScreen.routeName:(context) => SearchLoveScreen(),
  LikesPage.routeName:(context) =>LikesPage(),
  MyAccount.routeName:(context) => MyAccount(folderName: ""),
  
  ChatsScreen.routeName:(context) => ChatsScreen(),
   MessagesScreen.routeName:(context)=> MessagesScreen(),
  
};
