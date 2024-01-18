import 'package:flutter/material.dart';
import 'package:hapind/components/coustom_bottom_nav_bar.dart';
import 'package:hapind/enums.dart';
import 'package:hapind/screens/searchlove/searchlove.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = "/search";

  @override
  State<SearchScreen> createState() => __SearchScreenState();
}

class __SearchScreenState extends State<SearchScreen> {
  double availableScreenWidth = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false, 
        title:Image.asset('assets/icons/logo1.png', width: 200,),
      ),
      body: Center(
        child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Color.fromARGB(255, 243, 189, 189)),
                        width: double.infinity,
                        height: 250,
                        margin: const EdgeInsets.all(15),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Image.asset(
                              "assets/images/splash9.png",
                              fit: BoxFit.fill,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(bottom: 80, right: 150),
                              child: const Text(
                                "Photo Verified",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 140, right: 125),
                              child: const Text(
                                "Get Verified On Hapind ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 190, right: 230),
                              child: const Text(
                                "Photo Verified",
                                style: TextStyle(
                                  color: Color(0xFF858484),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 190, right: 10),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    primary: Colors.white, // background
                                    onPrimary: Colors.white,
                                  ),
                                  child: const Text(
                                    'TRY NOW',
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  onPressed: () {}),
                            ),
                          ],
                        )),
                    Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: const Text(
                          "For you",
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        )),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.all(8),
                          height: 300,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/splash7.png",
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
                                            builder: (context) =>
                                              SearchLoveScreen()));
                                  },
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 220, left: 10),
                                child: const Text(
                                  "Find Your Perfect Match",
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 270, left: 10),
                                child: const Text(
                                  "Passions",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 228, 225, 225),
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
                                  "assets/images/splash8.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                   child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                               SearchLoveScreen()));
                                  },
                                ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 220, left: 10),
                                  child: const Text(
                                    "Find Your Perfect Match",
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 270, left: 10),
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
                    const SizedBox(
                      height: 20,
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
                                            builder: (context) =>
                                                SearchLoveScreen()));
                                  },
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 220, left: 10),
                                child: const Text(
                                  "Find Your Perfect Match",
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 270, left: 10),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                              SearchLoveScreen()));
                                  },
                                ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 220, left: 10),
                                  child: const Text(
                                    "Find Your Perfect Match",
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 270, left: 10),
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
                    const SizedBox(
                      height: 20,
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
                                "assets/images/splash.png",
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
                                            builder: (context) =>
                                                SearchLoveScreen()));
                                  },
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 220, left: 10),
                                child: const Text(
                                  "Find Your Perfect Match",
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 270, left: 10),
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
                                  "assets/images/splash6.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SearchLoveScreen()));
                                  },
                                ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 220, left: 10),
                                  child: const Text(
                                    "Find Your Perfect Match",
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 270, left: 10),
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
                ),
              )
            ]),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
