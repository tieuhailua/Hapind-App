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
import 'package:hapind/screens/search/search_screen.dart';
import 'package:hapind/screens/searchlove/searchlove.dart';
import 'package:hapind/service/matching_service.dart';
import 'package:hapind/service/token_service.dart';
import 'package:hapind/service/upload_service.dart';
import 'package:hapind/service/user_service.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.filter}) : super(key: key);
  final filter;

  @override
  State<MainPage> createState() => _MainPageState(filter: filter);
}

class _MainPageState extends State<MainPage> {
  final filter;
  _MainPageState({required this.filter});
  List<SwipeItem> swipeItems = <SwipeItem>[];
  List<int> imageIndexList = List.generate(10, (index) => 0);
  MatchEngine matchEngine = MatchEngine();
  bool isNope = false;
  bool isLike = false;
  bool isSuperLike = false;
  User? usersData;
  MatchingService _matchingService = MatchingService();
  List<String?> items = [];
  TokenService _tokenService = TokenService();
  UploadService _uploadService = UploadService();
  UserService _userService = UserService();
  int status = -99;

  String url =
      "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/e44w6saipufr4qhbtesw";
  String _avatarUr =
      "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/e44w6saipufr4qhbtesw";

  Future getData() async {
    int? id = await _tokenService.getStoredUserId();
    if (filter == "Dating" || filter == "Friendship") {
      User? user = await _matchingService.getUserForMatchingByPurpose(
          id,
          await _tokenService.getStoredMinAge() ?? 20,
          await _tokenService.getStoredMaxAge() ?? 80,
          await _tokenService.getStoredDistance() ?? 100,
          filter);
      setState(() {
        usersData = user;
        items =
            user?.userImages?.map((image) => image.imagePath).toList() ?? [];
      });
    }
    if (filter == "Pet") {
      User? user =
          await _matchingService.getUserForMatchingByPet(id, await _tokenService.getStoredMinAge() ?? 20,
          await _tokenService.getStoredMaxAge() ?? 80,
          await _tokenService.getStoredDistance() ?? 100);
      setState(() {
        usersData = user;
        items =
            user?.userImages?.map((image) => image.imagePath).toList() ?? [];
      });
    }
    if (filter == "Sport") {
      User? user =
          await _matchingService.getUserForMatchingByExercise(id, await _tokenService.getStoredMinAge() ?? 20,
          await _tokenService.getStoredMaxAge() ?? 80,
          await _tokenService.getStoredDistance() ?? 100);
      setState(() {
        usersData = user;
        items =
            user?.userImages?.map((image) => image.imagePath).toList() ?? [];
      });
    }
    if (filter == "Music") {
      User? user =
          await _matchingService.getUserForMatchingByMusic(id, await _tokenService.getStoredMinAge() ?? 20,
          await _tokenService.getStoredMaxAge() ?? 80,
          await _tokenService.getStoredDistance() ?? 100);
      setState(() {
        usersData = user;
        items =
            user?.userImages?.map((image) => image.imagePath).toList() ?? [];
      });
    }
    if (filter == "Online") {
      User? user =
          await _matchingService.getUserForMatchingByOnline(id, await _tokenService.getStoredMinAge() ?? 20,
          await _tokenService.getStoredMaxAge() ?? 80,
          await _tokenService.getStoredDistance() ?? 100);
      setState(() {
        usersData = user;
        items =
            user?.userImages?.map((image) => image.imagePath).toList() ?? [];
      });
    }
    print(items);
  }

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

  @override
  void initState() {
    super.initState();
    getData().then((_) {
      print(items);
      print(usersData?.dob);
      //loadImagePaths();
      swipeItems = List.generate(
        10,
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
                status = -3;
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
                    'Looking for ' + filter,
                    style: DefaultTextStyle.of(context)
                        .style
                        .apply(fontSizeFactor: 2.0),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchScreen()));
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
                                                padding: const EdgeInsets.only(
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
                                                    color:
                                                        imageIndexList[index] ==
                                                                stepIndex
                                                            ? Colors.white
                                                            : Colors.black
                                                                .withOpacity(
                                                                    0.2),
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
                                                      const EdgeInsets.all(4.0),
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
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          20, 10, 0, 0),
                                                  child: Text(
                                                    usersData?.address ?? "",
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
                                                padding: const EdgeInsets.only(
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
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child:
                                                          ElevatedButton.icon(
                                                        onPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      DetailsPage(
                                                                id: usersData
                                                                        ?.id ??
                                                                    0,
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
                                                                state:
                                                                    //  usersData
                                                                    //         ?.address ??
                                                                    //     "Default address",
                                                                    "",
                                                                country: "",
                                                                //  usersData
                                                                //         ?.address ??
                                                                //     "Default address",
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
                                                                DOB: usersData
                                                                        ?.dob
                                                                        .toString() ??
                                                                    "",
                                                                purpose: usersData
                                                                        ?.purpose
                                                                        ?.name ??
                                                                    "",
                                                                description:
                                                                    usersData
                                                                            ?.description ??
                                                                        "",
                                                                weight: usersData
                                                                        ?.weight
                                                                        .toString() ??
                                                                    "",
                                                                height: usersData
                                                                        ?.height
                                                                        .toString() ??
                                                                    "",
                                                                drinking: usersData
                                                                        ?.drinking
                                                                        ?.name ??
                                                                    "",
                                                                family: usersData
                                                                        ?.family
                                                                        ?.name ??
                                                                    "",
                                                                habit: usersData
                                                                        ?.habit
                                                                        ?.name ??
                                                                    "",
                                                                literacy: usersData
                                                                        ?.literacy
                                                                        ?.name ??
                                                                    "",
                                                                smoking: usersData
                                                                        ?.smoking
                                                                        ?.name ??
                                                                    "",
                                                                work: usersData
                                                                        ?.work
                                                                        ?.name ??
                                                                    "",
                                                                sport: usersData
                                                                    ?.userExercises,
                                                                music: usersData
                                                                    ?.userMusics,
                                                                pet: usersData
                                                                    ?.userPets,
                                                                singer: usersData
                                                                    ?.userSingers,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        icon: const Icon(
                                                          Icons
                                                              .directions_sharp,
                                                          color: Color.fromARGB(
                                                              255,
                                                              189,
                                                              81,
                                                              225),
                                                        ),
                                                        label: const Text(
                                                          "Profile",
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    219,
                                                                    64,
                                                                    64),
                                                            fontSize: 10.0,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                          shadowColor:
                                                              Colors.deepPurple,
                                                        ),
                                                      ),
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
                                      SearchLoveScreen(filter: filter),
                                  transitionDuration: Duration.zero,
                                ),
                              );
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
                                        color: isLike
                                            ? Color.fromARGB(255, 201, 239, 225)
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
