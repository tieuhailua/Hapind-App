import 'package:flutter/widgets.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/model/user_register.dart';
import 'package:hapind/screens/accounts/Edit_account.dart';
import 'package:hapind/screens/blog/blog_instructions.dart';
import 'package:hapind/screens/blog_success/block_success_screen.dart';
import 'package:hapind/screens/cart/cart_screen.dart';
import 'package:hapind/screens/change_password/change_password_screen.dart';
import 'package:hapind/screens/change_password_success/change_password_success_screen.dart';
import 'package:hapind/screens/chat/chats_screen.dart';
import 'package:hapind/screens/complete_profile/complete_profile_screen.dart';
import 'package:hapind/screens/details/details_screen.dart';
import 'package:hapind/screens/distance/distance_screen.dart';
import 'package:hapind/screens/finding/finding_screen.dart';
import 'package:hapind/screens/forgot_password/forgot_password_screen.dart';
import 'package:hapind/screens/gender/gender_screen.dart';
import 'package:hapind/screens/geo/geolocator_map.dart';
import 'package:hapind/screens/geo/geolocator_widget.dart';
import 'package:hapind/screens/home/home_screen.dart';
import 'package:hapind/screens/image/image_screen.dart';
import 'package:hapind/screens/like/Like.dart';
import 'package:hapind/screens/like/components/like_button.dart';
//import 'package:hapind/screens/login_fail/login_fail_screen.dart';
import 'package:hapind/screens/login_success/login_success_screen.dart';
// ignore: unused_import
import 'package:hapind/screens/messages/components/message.dart';
import 'package:hapind/screens/messages/message_screen.dart';
import 'package:hapind/screens/new_password/new_password_screen.dart';
import 'package:hapind/screens/otp/otp_screen.dart';
import 'package:hapind/screens/profile/profile_screen.dart';
import 'package:hapind/screens/purpose/purpose_screen.dart';
import 'package:hapind/screens/register_success/register_success_screen.dart';
import 'package:hapind/screens/report_list/report_instructions.dart';
import 'package:hapind/screens/report_success/report_success_screen.dart';
import 'package:hapind/screens/reset_password_success/reset_password_success_screen.dart';
import 'package:hapind/screens/search/search_screen.dart';
import 'package:hapind/screens/searchlove/searchlove.dart';
import 'package:hapind/screens/setting/setting.dart';
import 'package:hapind/screens/sign_in/sign_in_screen.dart';
import 'package:hapind/screens/smoking/smoking_screen.dart';
import 'package:hapind/screens/splash/splash_screen.dart';
import 'package:hapind/screens/status/status_screen.dart';
import 'package:hapind/screens/terms/TermsInstructions.dart';
import 'package:hapind/service/auth/auth_gate.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  // test case, need to delte after test
  SearchScreen.routeName: (context) => SearchScreen(),
  // test case, need to delte after test

  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  RegisterSuccessScreen.routeName: (context) => RegisterSuccessScreen(),
  ResetPasswordSuccessScreen.routeName: (context) =>
      ResetPasswordSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  //OtpScreen.routeName: (context) => OtpScreen(),
  OtpScreen.routeName: (context) {
    // Extract the user instance from the arguments passed to the route
    final UserRegister user =
        ModalRoute.of(context)!.settings.arguments as UserRegister;
    return OtpScreen(user: user);
  },
  NewPasswordScreen.routeName: (context) {
    // Extract the user instance from the arguments passed to the route
    final UserRegister user =
        ModalRoute.of(context)!.settings.arguments as UserRegister;
    return NewPasswordScreen(user: user);
  },
  CompleteProfileScreen.routeName: (context) {
    // Extract the user instance from the arguments passed to the route
    final UserRegister user =
        ModalRoute.of(context)!.settings.arguments as UserRegister;
    return CompleteProfileScreen(user: user);
  },
  //CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  //CompleteGenderScreen.routeName: (context) => CompleteGenderScreen(),
  CompleteGenderScreen.routeName: (context) {
    // Extract the user instance from the arguments passed to the route
    final UserRegister user =
        ModalRoute.of(context)!.settings.arguments as UserRegister;
    return CompleteGenderScreen(user: user);
  },
  //CompletePurposeScreen.routeName: (context) => CompletePurposeScreen(),
  CompletePurposeScreen.routeName: (context) {
    // Extract the user instance from the arguments passed to the route
    final UserRegister user =
        ModalRoute.of(context)!.settings.arguments as UserRegister;
    return CompletePurposeScreen(user: user);
  },
  //CompleteFindingScreen.routeName: (context) => CompleteFindingScreen(),
  CompleteFindingScreen.routeName: (context) {
    // Extract the user instance from the arguments passed to the route
    final UserRegister user =
        ModalRoute.of(context)!.settings.arguments as UserRegister;
    return CompleteFindingScreen(user: user);
  },
  //CompleteDistanceScreen.routeName: (context) => CompleteDistanceScreen(),
  CompleteDistanceScreen.routeName: (context) {
    // Extract the user instance from the arguments passed to the route
    final UserRegister user =
        ModalRoute.of(context)!.settings.arguments as UserRegister;
    return CompleteDistanceScreen(user: user);
  },
  CompleteImageScreen.routeName: (context) {
    // Extract the user instance from the arguments passed to the route
    final User? user = ModalRoute.of(context)!.settings.arguments as User?;
    return CompleteImageScreen(user: user);
  },
  //CompleteStatusScreen.routeName:(context) => CompleteStatusScreen(),
  //CompleteSmokingScreen.routeName:(context) => CompleteSmokingScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  MapsDemo.routeName: (context) => MapsDemo(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),
  SearchLoveScreen.routeName: (context) {
    // Extract the user instance from the arguments passed to the route
    final filter = ModalRoute.of(context)!.settings.arguments;
    return SearchLoveScreen(filter: filter);
  },
  LikesPage.routeName: (context) => LikesPage(),
  LikePage.routeName: (context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;
    return LikePage(user: user);
  },
  MyAccount.routeName: (context) => MyAccount(folderName: ""),
  AuthGate.routeName: (context) => AuthGate(),
  ChatsScreen.routeName: (context) => ChatsScreen(),
  //MessagesScreen.routeName: (context) => MessagesScreen(),
  MessagesScreen.routeName: (context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;
    return MessagesScreen(user: user);
  },
  BlockSuccessScreen.routeName: (context) => BlockSuccessScreen(),
  ReportSuccessScreen.routeName: (context) => ReportSuccessScreen(),

  TermsInstrucstions.routeName: (context) => TermsInstrucstions(),
  ReportInstrucstions.routeName: (context) => ReportInstrucstions(),
  BlogInstrucstions.routeName: (context) => BlogInstrucstions(),
  ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),
  ChangePasswordSuccessScreen.routeName: (context) =>
      ChangePasswordSuccessScreen(),

  Setting.routeName: (context) => Setting(),
};
