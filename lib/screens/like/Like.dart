import 'package:flutter/material.dart';
import 'package:hapind/components/coustom_bottom_nav_bar.dart';
import 'package:hapind/enums.dart';
import 'package:hapind/models/like_json.dart';
import 'package:hapind/screens/like/components/like_button.dart';

class LikesPage extends StatefulWidget {
  static String routeName = "/like";
  @override
  _LikesPageState createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: Colors.white,
      body: getBody(),
      
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      
      padding: EdgeInsets.only(bottom: 50),
      children: [
         Image.asset('assets/icons/logo1.png', width: 200,height: 170, ),
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             
              Text(
                likes_json.length.toString() + " Likes",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 0.8,
        ),
        Row(
          children: [
            Expanded(
                child: Container(
              margin: const EdgeInsets.all(8),
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/splash1.jpeg",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Stack(
                children: [
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LikePage()));
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 220, left: 10),
                    child: const Text(
                      "Find Your Perfect Match",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 270, left: 10),
                    child: const Text(
                      "Passions",
                      style: TextStyle(
                        color: Color(0xFFA1A1A1),
                        fontSize: 15,
                      ),
                      
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8),
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/splash4.jpeg",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Stack(
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LikePage()));
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 220, left: 10),
                      child: const Text(
                        "Find Your Perfect Match",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 270, left: 10),
                      child: const Text(
                        "Passions",
                        style: TextStyle(
                          color: Color(0xFFA1A1A1),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
         Row(
          children: [
            Expanded(
                child: Container(
              margin: const EdgeInsets.all(8),
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/splash1.jpeg",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Stack(
                children: [
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LikePage()));
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 220, left: 10),
                    child: const Text(
                      "Find Your Perfect Match",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 270, left: 10),
                    child: const Text(
                      "Passions",
                      style: TextStyle(
                        color: Color(0xFFA1A1A1),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8),
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/splash4.jpeg",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Stack(
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LikePage()));
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 220, left: 10),
                      child: const Text(
                        "Find Your Perfect Match",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 270, left: 10),
                      child: const Text(
                        "Passions",
                        style: TextStyle(
                          color: Color(0xFFA1A1A1),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
         Row(
          children: [
            Expanded(
                child: Container(
              margin: const EdgeInsets.all(8),
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/splash1.jpeg",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Stack(
                children: [
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LikePage()));
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 220, left: 10),
                    child: const Text(
                      "Find Your Perfect Match",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 270, left: 10),
                    child: const Text(
                      "Passions",
                      style: TextStyle(
                        color: Color(0xFFA1A1A1),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8),
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/splash4.jpeg",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Stack(
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LikePage()));
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 220, left: 10),
                      child: const Text(
                        "Find Your Perfect Match",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 270, left: 10),
                      child: const Text(
                        "Passions",
                        style: TextStyle(
                          color: Color(0xFFA1A1A1),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Widget getFooter() {
  //   var size = MediaQuery.of(context).size;
  //   return Container(
  //     width: size.width,
  //     height: 90,
  //     child: Padding(
  //       padding: const EdgeInsets.only(top: 10),
  //       child: Column(
  //         children: [
  //           Container(
  //             width: size.width - 70,
  //             height: 50,
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(30),
  //                 gradient: LinearGradient(colors: [])),
  //             child: Center(
  //               child: Text("SEE WHO LIKES YOU",
  //                   style: TextStyle(
  //                       color: Colors.white,
  //                       fontSize: 18,
  //                       fontWeight: FontWeight.bold)),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
