import 'package:flutter/material.dart';
import 'package:hapind/screens/login_success/login_success_screen.dart';
import 'package:hapind/screens/sign_in/sign_in_screen.dart';
import 'package:hapind/screens/sign_up/sign_up_screen.dart';

class Setting extends StatefulWidget {
  static String routeName = "/setting";

  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isShow = false;
  bool isShare = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Setting',
          style: TextStyle(color: Colors.orange, fontFamily: "semi-bold"),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black87),
        elevation: 0,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildGreyLabel('Personal Details'),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.mail,
                        color: Colors.orange,
                      ),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: const Text("admin@initappz.com",
                            style: TextStyle(
                                fontFamily: "semi-bold",
                                fontSize: 16,
                                color: Colors.black87)),
                      )),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.phone,
                        color: Colors.orange,
                      ),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: const Text("9876543210",
                            style: TextStyle(
                                fontFamily: "semi-bold",
                                fontSize: 16,
                                color: Colors.black87)),
                      )),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.lock,
                        color: Colors.orange,
                      ),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: const Text("Change Password",
                            style: TextStyle(
                                fontFamily: "semi-bold",
                                fontSize: 16,
                                color: Colors.black87)),
                      )),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildGreyLabel('Connected Account'),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.facebook,
                    color: Colors.orange,
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text("Facebook",
                        style: TextStyle(
                            fontFamily: "semi-bold",
                            fontSize: 16,
                            color: Colors.black87)),
                  )),
                  Switch(
                    activeColor: Colors.orange,
                    value: isShare,
                    onChanged: (value) {
                      setState(() {
                        isShare = value;
                        print(isShare);
                      });
                    },
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.facebook,
                    color: Colors.orange,
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text("Instagram",
                        style: TextStyle(
                            fontFamily: "semi-bold",
                            fontSize: 16,
                            color: Colors.black87)),
                  )),
                  Switch(
                    activeColor: Colors.orange,
                    value: isShare,
                    onChanged: (value) {
                      setState(() {
                        isShare = value;
                        print(isShare);
                      });
                    },
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                    
                children: [
                  Icon(
                    Icons.face, 
                    color: Colors.red, 
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showDeleteAccountDialog(context);
                    },
                    child: Text('Delete the account'),
                  ),
                  Icon(
                    Icons.delete, 
                    color: Colors.red, 
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  myBoxDecoration() {
    return const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)));
  }

  Widget _buildGreyLabel(text) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        '$text',
        style: const TextStyle(color: Colors.grey, fontSize: 16),
      ),
    );
  }

  textButton() {
    return const TextStyle(
        color: Colors.black87, fontFamily: 'semi-bold', fontSize: 12);
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Account Deletion'),
          content: Text('Are you sure you want to delete your account?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng hộp thoại
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Thực hiện xóa tài khoản ở đây
                _deleteAccount();
                Navigator.of(context).pop();
                 Navigator.pushNamed(context, SignInScreen.routeName); // Đóng hộp thoại
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _deleteAccount() {
    print('Account has been deleted!!');
  }

  void _showSnackBarAndNavigate(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

     Navigator.pushNamed(context, SignInScreen.routeName);
  }
}
