import 'package:flutter/material.dart';
import 'package:hapind/screens/accounts/Edit_account.dart';
import 'package:hapind/screens/sign_in/sign_in_screen.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
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
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
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
                        onPressed: () {
                          // Sau khi đăng xuất thành công, đóng hộp thoại
                          Navigator.of(context).pop();

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
