import 'package:flutter/material.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/screens/setting/setting.dart';
import 'package:hapind/screens/terms/TermsInstructions.dart';
import 'package:hapind/screens/accounts/Edit_account.dart';
import 'package:hapind/screens/sign_in/sign_in_screen.dart';
import 'package:hapind/service/auth/auth_service.dart';
import 'package:hapind/service/login_service.dart';
import 'package:hapind/service/token_service.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  TokenService _tokenService = TokenService();
  LoginService _loginService = LoginService();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () {
                Navigator.pushNamed(context, MyAccount.routeName);
              }),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Blog",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Terms & Instructions",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.pushNamed(context, TermsInstrucstions.routeName);
            },
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () async {
              Navigator.pushNamed(context, Setting.routeName);
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              // Hiển thị hộp thoại xác nhận
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Confirm"),
                    content: Text("Are you sure you want to sign out?"),
                    actions: [
                      // Nút "Đồng ý"
                      TextButton(
                        onPressed: () async {
                          void signOut() {
                            final authService = Provider.of<AuthService>(
                                context,
                                listen: false);
                            authService.signOut();
                          }

                          _loginService.isOnline(
                              await _tokenService.getStoredUserId(), 0);

                          // Sau khi đăng xuất thành công, đóng hộp thoại
                          Navigator.of(context).pop();
                          _tokenService.clearUserId();
                          signOut();
                          // Chuyển hướng đến màn hình đăng nhập
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                        child: Text("Agree"),
                      ),
                      // Nút "Không đồng ý"
                      TextButton(
                        onPressed: () {
                          // Đóng hộp thoại nếu người dùng không muốn đăng xuất
                          Navigator.of(context).pop();
                        },
                        child: Text("Disagree"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
