// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:hapind/service/login_service.dart';
// import 'package:hapind/service/token_service.dart';

// class ProfilePic extends StatelessWidget {
//   const ProfilePic({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String _avatarUrl =
//         //"https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/e44w6saipufr4qhbtesw";
//         "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/lpckjnidqulkymh6r1da";

//     return SizedBox(
//       height: 115,
//       width: 115,
//       child: Stack(
//         fit: StackFit.expand,
//         clipBehavior: Clip.none,
//         children: [
//           CircleAvatar(
//             backgroundImage: NetworkImage(_avatarUrl),
//           ),
//           Positioned(
//             right: -16,
//             bottom: 0,
//             child: SizedBox(
//               height: 46,
//               width: 46,
//               // child: TextButton(
//               //   style: TextButton.styleFrom(
//               //     shape: RoundedRectangleBorder(
//               //       borderRadius: BorderRadius.circular(50),
//               //       side: BorderSide(color: Colors.white),
//               //     ),
//               //     primary: Colors.white,
//               //     backgroundColor: Color(0xFFF5F6F9),
//               //   ),
//               //   onPressed: () {},
//               //   child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
//               // ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/service/login_service.dart';
import 'package:hapind/service/token_service.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  LoginService _loginService = LoginService();
  TokenService _tokenService = TokenService();
  late String _avatarUrl;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    int? userId = await _tokenService.getStoredUserId();
    User? user = await _loginService.getUser(userId);
    setState(() {
      _avatarUrl = user?.userImages?.first.imagePath ?? "";
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: _loading
                ? AssetImage('assets/images/loading.jpg') // Placeholder loading image
                : NetworkImage(_avatarUrl) as ImageProvider<Object>?,
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              // child: TextButton(
              //   style: TextButton.styleFrom(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(50),
              //       side: BorderSide(color: Colors.white),
              //     ),
              //     primary: Colors.white,
              //     backgroundColor: Color(0xFFF5F6F9),
              //   ),
              //   onPressed: () {},
              //   child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              // ),
            ),
          )
        ],
      ),
    );
  }
}

