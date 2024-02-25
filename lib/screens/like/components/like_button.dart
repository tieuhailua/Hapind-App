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
import 'package:hapind/screens/home/components/slider.dart';
import 'package:hapind/screens/like/like.dart';
import 'package:hapind/screens/search/search_screen.dart';
import 'package:hapind/service/token_service.dart';
import 'package:hapind/service/upload_service.dart';
import 'package:hapind/service/user_service.dart';
import 'package:path/path.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class LikePage extends StatefulWidget {
  static String routeName = "/like_button";

  final User user;
  const LikePage({Key? key, required this.user}) : super(key: key);

  @override
  State<LikePage> createState() => _LikeState(user: user);
}

class _LikeState extends State<LikePage> {
  User user;
  _LikeState({required this.user});
  List<SwipeItem> swipeItems = <SwipeItem>[];
  List<int> imageIndexList = List.generate(10, (index) => 0);
  MatchEngine matchEngine = MatchEngine();
  List<String?> items = [];
  bool isNope = false;
  bool isLike = false;
  bool isSuperLike = false;
  int status = -99;
  late List usersData;
  final String url = "https://randomuser.me/api/?results=50";
  TokenService _tokenService = TokenService();
  UploadService _uploadService = UploadService();
  UserService _userService = UserService();

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

  String _avatarUr =
      "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/e44w6saipufr4qhbtesw";
  Future getData() async {
    setState(() {
      items = user.userImages?.map((image) => image.imagePath).toList() ?? [];
    });
    print(items);
  }

  @override
  void initState() {
    super.initState();
    getData().then((_) {
      //loadImagePaths();
      swipeItems = List.generate(
        10,
        (index) => SwipeItem(
          content: TinderCard(
            name: user.fullname ?? "",
            photos: items,
            text: user.email ?? '',
            age: (currentDate.year - (user.dob?.year ?? 0)),
            km: user.distance ?? 1,
          ),
          onSlideUpdate: (SlideRegion? region) async {
            if (region == SlideRegion.inLikeRegion) {
              setState(() {
                isLike = true;
                status = -1;
              });
            } else if (region == SlideRegion.inNopeRegion) {
              setState(() {
                isNope = true;
                status = -2;
              });
            } else if (region == SlideRegion.inSuperLikeRegion) {
              setState(() {
                isSuperLike = true;
                status = -1;
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Listen to your heart',
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LikesPage()));
                      },
                      icon: Icon(Icons.close))
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
                                        //     image: NetworkImage(_avatarUr)),
                                        // image: DecorationImage(
                                        // image: CachedNetworkImageProvider(
                                        //   swipeItems[index]
                                        //       .content
                                        //       .photos[imageIndexList[index]],
                                        // ),
                                        // fit: BoxFit.cover,
                                        //  ),
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
                                              children: [
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Text(
                                                      user.fullname ??
                                                          "" +
                                                              ", " +
                                                              usersData[index][
                                                                          'dob']
                                                                      ['age']
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
                                                      user.address ?? "" + ", ",
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
                                                      // Padding(
                                                      //   padding:
                                                      //       const EdgeInsets.all(8.0),
                                                      //   child: ElevatedButton.icon(
                                                      //     onPressed: () {
                                                      //       Navigator.push(
                                                      //         context,
                                                      //         MaterialPageRoute(
                                                      //           builder: (context) =>
                                                      //               DetailsPage(
                                                      //             name: usersData[index]
                                                      //                 ['name']['first'],
                                                      //             age: usersData[index]
                                                      //                     ['dob']['age']
                                                      //                 .toString(),
                                                      //             gender:
                                                      //                 usersData[index]
                                                      //                     ['gender'],
                                                      //             city: usersData[index]
                                                      //                     ['location']
                                                      //                 ['city'],
                                                      //             state: usersData[
                                                      //                         index]
                                                      //                     ['location']
                                                      //                 ['state'],
                                                      //             country: usersData[
                                                      //                         index]
                                                      //                     ['location']
                                                      //                 ['country'],
                                                      //             phone:
                                                      //                 usersData[index]
                                                      //                         ['phone']
                                                      //                     .toString(),
                                                      //             email:
                                                      //                 usersData[index]
                                                      //                     ['email'],
                                                      //             //  _avatarUr: usersData[index]
                                                      //             //       ['picture']['large'],
                                                      //           ),
                                                      //         ),
                                                      //       );
                                                      //     },
                                                      //     icon: const Icon(
                                                      //       Icons.directions_sharp,
                                                      //       color: Color.fromARGB(
                                                      //           255, 189, 81, 225),
                                                      //     ),
                                                      //     label: const Text(
                                                      //       "Profile",
                                                      //       style: TextStyle(
                                                      //         color: Color.fromARGB(
                                                      //             255, 219, 64, 64),
                                                      //         fontSize: 10.0,
                                                      //         overflow:
                                                      //             TextOverflow.ellipsis,
                                                      //         fontWeight:
                                                      //             FontWeight.bold,
                                                      //       ),
                                                      //     ),
                                                      //     style:
                                                      //         ElevatedButton.styleFrom(
                                                      //       shape:
                                                      //           RoundedRectangleBorder(
                                                      //         borderRadius:
                                                      //             BorderRadius.circular(
                                                      //                 30.0),
                                                      //       ),
                                                      //       elevation: 8.0,
                                                      //       shadowColor:
                                                      //           Colors.deepPurple,
                                                      //     ),
                                                      //   ),
                                                      // ),

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
                                                                  id: user.id ??
                                                                      0,
                                                                  name: user
                                                                          .fullname ??
                                                                      "Default Name",
                                                                  age: (currentDate
                                                                              .year -
                                                                          (user.dob?.year ??
                                                                              0))
                                                                      .toString(),
                                                                  // usersData
                                                                  //         ?.dob
                                                                  //         ?.toString() ??
                                                                  //     "Default Name",
                                                                  gender: user
                                                                          .gender ??
                                                                      "Default gender",
                                                                  city: user
                                                                          .address ??
                                                                      "Default address",
                                                                  state: "",
                                                                  //  user
                                                                  //         .address ??
                                                                  //     "Default address",
                                                                  country: "",
                                                                  //  user
                                                                  //         .address ??
                                                                  //     "Default address",
                                                                  phone: user
                                                                          .phone ??
                                                                      "Default phone",
                                                                  email: user
                                                                          .email ??
                                                                      "Default email",
                                                                  avatar: user
                                                                          .userImages
                                                                          ?.first
                                                                          .imagePath ??
                                                                      "",
                                                                  DOB: user?.dob
                                                                          .toString() ??
                                                                      "",
                                                                  purpose: user
                                                                          ?.purpose
                                                                          ?.name ??
                                                                      "",
                                                                  description:
                                                                      user?.description ??
                                                                          "",
                                                                  weight: user
                                                                          ?.weight
                                                                          .toString() ??
                                                                      "",
                                                                  height: user
                                                                          ?.height
                                                                          .toString() ??
                                                                      "",
                                                                  drinking: user
                                                                          ?.drinking
                                                                          ?.name ??
                                                                      "",
                                                                  family: user
                                                                          ?.family
                                                                          ?.name ??
                                                                      "",
                                                                  habit: user
                                                                          ?.habit
                                                                          ?.name ??
                                                                      "",
                                                                  literacy: user
                                                                          ?.literacy
                                                                          ?.name ??
                                                                      "",
                                                                  smoking: user
                                                                          ?.smoking
                                                                          ?.name ??
                                                                      "",
                                                                  work: user
                                                                          ?.work
                                                                          ?.name ??
                                                                      "",
                                                                  sport: user
                                                                      ?.userExercises,
                                                                  music: user
                                                                      ?.userMusics,
                                                                  pet: user
                                                                      ?.userPets,
                                                                  singer: user
                                                                      ?.userSingers,
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
                                print(
                                    "item: ${item.content.text}, index: $index");
                                int? firstUserId =
                                    await _tokenService.getStoredUserId();
                                _userService.dating(
                                    user.id, firstUserId, status);
                                print(
                                    "item: ${item.content.text}, index: $index");
                                //Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                                setState(
                                  () {
                                    imageIndexList[index] = 0;
                                    Navigator.pushNamed(
                                        context, LikesPage.routeName);
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
                                  "MATCH",
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
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(0xFF6EE6BA),
                                        ),
                                        color: isLike
                                            ? Color.fromARGB(255, 222, 245, 236)
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
                                          status = -1;
                                          matchEngine.currentItem?.like();
                                        },
                                      ),
                                    ),
                                  ),
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
