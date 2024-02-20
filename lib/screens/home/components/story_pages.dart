import 'dart:convert';
import 'dart:math';

import 'package:faker/faker.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/model/user_image.dart';
import 'package:hapind/models/home.dart';
import 'package:hapind/screens/details/details_page.dart';
import 'package:hapind/service/matching_service.dart';
import 'package:hapind/service/token_service.dart';
import 'package:hapind/service/upload_service.dart';
import 'package:hapind/service/user_service.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hapind/screens/home/components/filter.dart';
import 'package:hapind/screens/home/home_screen.dart';

import 'slider.dart';

class MainPage extends StatefulWidget {
  final User? user;

  const MainPage({Key? key, required this.user}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<SwipeItem> swipeItems = <SwipeItem>[];
  List<int> imageIndexList = List.generate(10, (index) => 0);
  MatchEngine matchEngine = MatchEngine();
  bool isNope = false;
  bool isLike = false;
  bool isSuperLike = false;
  int status = -99;
  User? usersData;
  UploadService _uploadService = UploadService();
  UserService _userService = UserService();
  List<String?> items = [];
  DateTime currentDate = DateTime.now();
  TokenService _tokenService = TokenService();
  MatchingService _matchingService = MatchingService();
  final String url = "https://randomuser.me/api/?results=50";
  String _avatarUr =
      "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/e44w6saipufr4qhbtesw";

  void loadImagePaths() async {
    int? id = await _tokenService.getStoredUserId();
    List<UserImage>? userImages = await _uploadService.getUserImage(id);

    if (userImages != null && userImages.isNotEmpty) {
      List<String?> imagePaths = await Future.wait(
        userImages.map((userImage) => userImage.getImagePath()),
      );

      // Now imagePaths contains the list of image paths for the user
      // Use it in your UI accordingly
      // For example, update your image widgets with the paths from imagePaths
      setState(() {
        for (int i = 0; i < imagePaths.length; i++) {
          swipeItems[i].content.photos[imageIndexList[i]] = imagePaths[i] ?? "";
        }
        matchEngine = MatchEngine(swipeItems: swipeItems);
      });
    }
  }

  Future getData() async {
    // var response = await http.get(
    //   Uri.parse(url),
    //   headers: {"Accept": "application/json"},
    // );
    //List data = jsonDecode(response.body)['results'];
    int? id = await _tokenService.getStoredUserId();
    User? user =
        await _matchingService.getUserForMatching(id, 16, 80, 100) ?? null;
    setState(() {
      usersData = user;
      items = user?.userImages?.map((image) => image.imagePath).toList() ?? [];
    });
    print(items);
  }

  @override
  void initState() {
    super.initState();
    getData().then((_) {
      print(items);
      print(usersData?.dob);

      //loadImagePaths();
      swipeItems = List.generate(
        2,
        (index) => SwipeItem(
          content: TinderCard(
            name: usersData?.fullname ?? "",
            photos: items,
            text: usersData?.email ?? '',
            age: (currentDate.year - (usersData?.dob?.year ?? 0)),
            km: Random().nextInt(30) + 1,
          ),
          onSlideUpdate: (SlideRegion? region) async {
            if (region == SlideRegion.inLikeRegion) {
              setState(() {
                isLike = true;
                status = -3;
                //Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                // Navigator.pushReplacement(
                //     context, HomeScreen.routeName as Route<Object?>);
              });
            } else if (region == SlideRegion.inNopeRegion) {
              setState(() {
                isNope = true;
                status = -2;
                //Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                // Navigator.pushReplacement(
                //     context, HomeScreen.routeName as Route<Object?>);
              });
            } else if (region == SlideRegion.inSuperLikeRegion) {
              setState(() {
                isSuperLike = true;
              });
            } else {
              setState(() {
                isLike = false;
                isNope = false;
                isSuperLike = false;
              });
            }
          },
        ),
      );
      setState(() {
        matchEngine = MatchEngine(swipeItems: swipeItems);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 200,
              height: 180,
              child: Image.asset(
                'assets/icons/logo1.png',
                fit: BoxFit.cover,
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          HomeScreen(),
                      transitionDuration: Duration.zero,
                    ),
                  );
                },
                icon: const Icon(Icons.refresh, size: 25)),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Filter()));
                },
                icon: const Icon(Icons.filter_alt_outlined, size: 25))
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text('I Love You hapind', style: TextStyle(color: const Color.fromARGB(255, 255, 0, 0)),),
                  // const Icon(
                  //   CupertinoIcons.bell_fill,
                  //   color: Color(0xFF7E858F),
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Expanded(
              child: items.isNotEmpty
                  ? Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 10,
                          ),
                          child: Expanded(
                            child: SwipeCards(
                              matchEngine: matchEngine,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTapDown: (details) {
                                    var position = details.globalPosition;
                                    if (position.dx <
                                        MediaQuery.of(context).size.width / 2) {
                                      if (imageIndexList[index] > 0) {
                                        setState(() {
                                          imageIndexList[index]--;
                                        });
                                      }
                                    } else {
                                      if (imageIndexList[index] <
                                          swipeItems[index]
                                                  .content
                                                  .photos
                                                  .length -
                                              1) {
                                        setState(() {
                                          imageIndexList[index]++;
                                        });
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        // image: DecorationImage(
                                        //     image: NetworkImage(items as String)),
                                        image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                            //getData(),
                                            // items[index]??"",
                                            swipeItems[index]
                                                .content
                                                .photos[imageIndexList[index]],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.7),
                                            blurRadius: 5,
                                            spreadRadius: 5,
                                            offset: const Offset(0, 2),
                                          ),
                                        ]),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Row(
                                            children: List.generate(
                                              swipeItems[index]
                                                  .content
                                                  .photos
                                                  .length,
                                              (stepIndex) => Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 4),
                                                  child: Container(
                                                    height:
                                                        imageIndexList[index] ==
                                                                stepIndex
                                                            ? 2.5
                                                            : 2,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2),
                                                      color: imageIndexList[
                                                                  index] ==
                                                              stepIndex
                                                          ? Colors.white
                                                          : Colors.black
                                                              .withOpacity(0.2),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Colors.transparent,
                                                  Colors.black
                                                ],
                                                stops: [
                                                  0.5,
                                                  1.0,
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Text(
                                                      usersData?.fullname ??
                                                          "Default Name" +
                                                              ", " +
                                                              (currentDate.year -
                                                                      (usersData
                                                                              ?.dob
                                                                              ?.year ??
                                                                          0))
                                                                  .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      softWrap: false,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(20, 10, 0, 0),
                                                    child: Text(
                                                      usersData?.address ??
                                                          "" + ", ",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      softWrap: false,
                                                      textAlign: TextAlign.left,
                                                      style: const TextStyle(
                                                        color: Colors.white70,
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                // Padding(
                                                //   padding:
                                                //       const EdgeInsets.only(left: 18),
                                                //   // child: RichText(
                                                //   //   text: TextSpan(
                                                //   //       text: swipeItems[index]
                                                //   //               .content
                                                //   //               .name +
                                                //   //           " ",
                                                //   //       style: TextStyle(
                                                //   //         color: Colors.white,
                                                //   //         fontWeight: FontWeight.bold,
                                                //   //         fontSize: 28,
                                                //   //       ),
                                                //   //       children: [
                                                //   //         TextSpan(
                                                //   //           text: swipeItems[index]
                                                //   //               .content
                                                //   //               .age
                                                //   //               .toString(),
                                                //   //           style: TextStyle(
                                                //   //             color: Colors.white,
                                                //   //             fontWeight:
                                                //   //                 FontWeight.w400,
                                                //   //             fontSize: 20,
                                                //   //           ),
                                                //   //         )
                                                //   //       ]),
                                                //   // ),
                                                // ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 12,
                                                    left: 18,
                                                    right: 10,
                                                    bottom: 10,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .location_on_outlined,
                                                            color: Colors.white,
                                                            size: 14,
                                                          ),
                                                          Text(
                                                            " ${swipeItems[index].content.km} km away",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            ElevatedButton.icon(
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        DetailsPage(
                                                                  name: usersData
                                                                          ?.fullname ??
                                                                      "Default Name",
                                                                  age: (currentDate
                                                                              .year -
                                                                          (usersData?.dob?.year ??
                                                                              0))
                                                                      .toString(),
                                                                  // usersData
                                                                  //         ?.dob
                                                                  //         ?.toString() ??
                                                                  //     "Default Name",
                                                                  gender: usersData
                                                                          ?.gender ??
                                                                      "Default gender",
                                                                  city: usersData
                                                                          ?.address ??
                                                                      "Default address",
                                                                  state: usersData
                                                                          ?.address ??
                                                                      "Default address",
                                                                  country: usersData
                                                                          ?.address ??
                                                                      "Default address",
                                                                  phone: usersData
                                                                          ?.phone ??
                                                                      "Default phone",
                                                                  email: usersData
                                                                          ?.email ??
                                                                      "Default email",
                                                                  avatar: usersData
                                                                          ?.userImages
                                                                          ?.first
                                                                          .imagePath ??
                                                                      "",
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          icon: const Icon(
                                                            Icons
                                                                .directions_sharp,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    189,
                                                                    81,
                                                                    225),
                                                          ),
                                                          label: const Text(
                                                            "Profile",
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      219,
                                                                      64,
                                                                      64),
                                                              fontSize: 10.0,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30.0),
                                                            ),
                                                            elevation: 8.0,
                                                            shadowColor: Colors
                                                                .deepPurple,
                                                          ),
                                                        ),
                                                      ),

                                                      // const CircleAvatar(
                                                      //   radius: 12,
                                                      //   backgroundColor: Color.fromARGB(255, 243, 238, 238),
                                                      //   // child: Icon(
                                                      //   //   FontAwesomeIcons.arrowUp,
                                                      //   //   color: Colors.black,
                                                      //   //   size: 16,
                                                      //     child: ElevatedButton(onPressed: (){
                                                      //       Navigator.push(context, MaterialPageRoute);
                                                      //     }, child:Text("data"))
                                                      //   ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 70,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              onStackFinished: () {
                                scaffoldKey.currentState!
                                    .showSnackBar(const SnackBar(
                                  content: Text("Stack Finished"),
                                  duration: Duration(milliseconds: 500),
                                ));
                              },
                              itemChanged: (SwipeItem item, int index) async {
                                await getData();

                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        HomeScreen(),
                                    transitionDuration: Duration.zero,
                                  ),
                                );
                                //Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                                // Navigator.pushReplacement(
                                //   context,
                                //   PageRouteBuilder(
                                //     pageBuilder: (context, animation,
                                //             secondaryAnimation) =>
                                //         HomeScreen(),
                                //     transitionsBuilder: (context, animation,
                                //         secondaryAnimation, child) {
                                //       const begin = Offset(0.0, 1.0);
                                //       const end = Offset.zero;
                                //       const curve = Curves.easeInOut;

                                //       var tween = Tween(begin: begin, end: end)
                                //           .chain(CurveTween(curve: curve));
                                //       var offsetAnimation =
                                //           animation.drive(tween);

                                //       return SlideTransition(
                                //           position: offsetAnimation,
                                //           child: child);
                                //     },
                                //     transitionDuration: Duration(
                                //         milliseconds:
                                //             500), // You can adjust the duration
                                //   ),
                                // );

                                //loadImagePaths();
                                // print(isLike);
                                // print(isNope);
                                // print(status);
                                int? id = await _tokenService.getStoredUserId();
                                _userService.matching(
                                    id, item.content.text, status);
                                print(
                                    "item: ${item.content.text}, index: $index");
                                //Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                                setState(
                                  () {
                                    imageIndexList[index] = 0;
                                    //Navigator.pushReplacementNamed( context, HomeScreen.routeName);
                                    // Navigator.pushReplacement(context,
                                    //     HomeScreen.routeName as Route<Object?>);
                                  },
                                );
                              },
                              likeTag: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: const Color(0xFF6EE6BA),
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "LIKE",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF6EE6BA),
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                              nopeTag: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: const Color(0xFFEC5E6A),
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "NOPE",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFFEC5E6A),
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                              superLikeTag: Transform.rotate(
                                angle: -15 * pi / 180,
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 70),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: const Color(0xFF66C4F2),
                                      width: 4,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    "SUPER\nLIKE",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF66C4F2),
                                      fontSize: 40,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              upSwipeAllowed: true,
                              fillSpace: true,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 18,
                              ),
                              child: Row(
                                children: [
                                  // Expanded(
                                  //   child: Container(
                                  //     decoration: BoxDecoration(
                                  //       shape: BoxShape.circle,
                                  //       border: Border.all(
                                  //         color: Colors.white,
                                  //       ),
                                  //     ),
                                  //     padding: const EdgeInsets.all(12),
                                  //     child: SvgPicture.asset(
                                  //       'assets/icons/return.svg',
                                  //       color: Colors.white,
                                  //       width: 14,
                                  //     ),
                                  //   ),
                                  // ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(0xFFEC5E6A),
                                        ),
                                        color: isNope
                                            ? const Color(0xFFEC5E6A)
                                            : Colors.transparent,
                                      ),
                                      padding: const EdgeInsets.all(1),
                                      child: IconButton(
                                        icon: SvgPicture.asset(
                                          'assets/icons/cross.svg',
                                          width: 20,
                                          color: isNope ? Colors.white : null,
                                        ),
                                        onPressed: () {
                                          status = -2;
                                          matchEngine.currentItem?.nope();
                                          // Navigator.pushReplacementNamed(
                                          //     context, HomeScreen.routeName);
                                          // Navigator.pushReplacement(
                                          //     context,
                                          //     HomeScreen.routeName
                                          //         as Route<Object?>);
                                        },
                                      ),
                                    ),
                                  ),
                                  // Expanded(
                                  //   child: Container(
                                  //     decoration: BoxDecoration(
                                  //       shape: BoxShape.circle,
                                  //       border: Border.all(
                                  //         color: const Color(0xFF66C4F2),
                                  //       ),
                                  //       color: isNope
                                  //           ? const Color(0xFF66C4F2)
                                  //           : Colors.transparent,
                                  //     ),
                                  //     padding: const EdgeInsets.all(1),
                                  //     child: IconButton(
                                  //       icon: SvgPicture.asset(
                                  //         'assets/icons/star.svg',
                                  //         width: 20,
                                  //         color: isNope ? Colors.white : null,
                                  //       ),
                                  //       onPressed: () {
                                  //         status = -3;
                                  //         matchEngine.currentItem?.superLike();
                                  //       },
                                  //     ),
                                  //   ),
                                  // ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(0xFF6EE6BA),
                                        ),
                                        color: isNope
                                            ? const Color(0xFF6EE6BA)
                                            : Colors.transparent,
                                      ),
                                      padding: const EdgeInsets.all(1),
                                      child: IconButton(
                                        icon: SvgPicture.asset(
                                          'assets/icons/heart.svg',
                                          width: 20,
                                          color: isNope ? Colors.white : null,
                                        ),
                                        onPressed: () {
                                          status = -3;
                                          matchEngine.currentItem?.like();
                                          // Navigator.pushReplacementNamed(
                                          //     context, HomeScreen.routeName);
                                          // Navigator.pushReplacement(
                                          //     context,
                                          //     HomeScreen.routeName
                                          //         as Route<Object?>);
                                        },
                                      ),
                                    ),
                                  ),
                                  // Expanded(
                                  //   child: Container(
                                  //     decoration: BoxDecoration(
                                  //       shape: BoxShape.circle,
                                  //       border: Border.all(
                                  //         color: const Color(0xFFA64AE9),
                                  //       ),
                                  //     ),
                                  //     padding: const EdgeInsets.all(12),
                                  //     child: SvgPicture.asset(
                                  //       'assets/icons/thunder.svg',
                                  //       width: 10,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 14),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xFFD0D2D8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
