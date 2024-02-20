import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/model/user_string.dart';
import 'package:hapind/screens/details/details_page.dart';
import 'package:hapind/service/matching_service.dart';
import 'package:hapind/service/token_service.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:http/http.dart' as http;

class SliderHome extends StatefulWidget {
  // const SliderHome(
  //     {super.key, this.items= user.userImages.
  //     this.items = const [
  //       "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/e44w6saipufr4qhbtesw",
  //       "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/lpckjnidqulkymh6r1da",
  //       "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/jy124fhdttag8qbdpeus",
  //       "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/ilr7v5wikdxcla8odvr1",
  //       "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/k4etvr7nmwerdgd3fals",
  //       "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/m3gung4bdlzc3fsh0bb5",
  //     ]
  //     });
  // User? user = await _matchingService.getUserForMatching(Future.value(
  //           "eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6InVzZXIiLCJzdWIiOiJ1c2VyMUBleGFtcGxlLmNvbSIsImF1ZCI6IlVzZXIgMSIsImlhdCI6MTcwNDk3NjQxMCwiZXhwIjoxNzA1MDYyODEwfQ.rTJtCfYh6IWPSLfCWNjui_fQyQMU7Zgk3zzaR1NpitkvpBGXBYoSdMgUzWip6dfKaARSY5mh3AFof62feEw48A")) ??
  //       null;

  const SliderHome({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User? user;
  @override
  State<SliderHome> createState() => _SliederState();
}

int currentIndex = 0;
late CarouselController controller;
//final String url = "https://randomuser.me/api/?results=50";

List<SwipeItem> swipeItems = <SwipeItem>[];
MatchingService _matchingService = MatchingService();
TokenService _tokenService = TokenService();

//var user =_matchingService.getUserForMatching(Future.value("eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6InVzZXIiLCJzdWIiOiJ1c2VyMUBleGFtcGxlLmNvbSIsImF1ZCI6IlVzZXIgMSIsImlhdCI6MTcwNDk3NjQxMCwiZXhwIjoxNzA1MDYyODEwfQ.rTJtCfYh6IWPSLfCWNjui_fQyQMU7Zgk3zzaR1NpitkvpBGXBYoSdMgUzWip6dfKaARSY5mh3AFof62feEw48A"));
List<int> imageIndexList = List.generate(10, (index) => 0);
MatchEngine matchEngine = MatchEngine();
bool isNope = false;
bool isLike = false;
bool isSuperLike = false;
late User? usersData;
bool isLoading = true;
final GlobalKey<ScaffoldMessengerState> scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();
DateTime currentDate = DateTime.now();
late List<String?> items;

class _SliederState extends State<SliderHome> {
  Future getData() async {
    int? id = await _tokenService.getStoredUserId();
    User? user =
        await _matchingService.getUserForMatching(id, 16, 80, 20) ?? null;
    //List data = jsonDecode(response.body)['results'];
    setState(() {
      usersData = user;
      items = user?.userImages?.map((image) => image.imagePath).toList() ?? [];
      if (usersData != null) {
        //for (int i = 0; i < usersData!.length; i++) {
        swipeItems.add(SwipeItem(
            // content: Content(text: _names[i], color: _colors[i]),
            content: Content(text: usersData?.fullname),
            likeAction: () {
              scaffoldKey.currentState?.showSnackBar(SnackBar(
                content: Text("Liked ${usersData?.fullname}"),
                //duration: Duration(milliseconds: 500),
              ));
            },
            nopeAction: () {
              scaffoldKey.currentState?.showSnackBar(SnackBar(
                content: Text("Nope ${usersData?.fullname}"),
                //duration: const Duration(milliseconds: 500),
              ));
            },
            superlikeAction: () {
              scaffoldKey.currentState?.showSnackBar(SnackBar(
                content: Text("Superliked ${usersData?.fullname}"),
                //duration: const Duration(milliseconds: 500),
              ));
            },
            onSlideUpdate: (SlideRegion? region) async {
              print("Region $region");
            }));
        //} //for loop
        matchEngine = MatchEngine(swipeItems: swipeItems);
        isLoading = false;
      } //if
    }); // setState
  }

  // Future<void> getData() async {
  //   UserString? user = await _matchingService.getUserForMatching(Future.value(
  //           "eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6InVzZXIiLCJzdWIiOiJ1c2VyMUBleGFtcGxlLmNvbSIsImF1ZCI6IlVzZXIgMSIsImlhdCI6MTcwNDk3NjQxMCwiZXhwIjoxNzA1MDYyODEwfQ.rTJtCfYh6IWPSLfCWNjui_fQyQMU7Zgk3zzaR1NpitkvpBGXBYoSdMgUzWip6dfKaARSY5mh3AFof62feEw48A")) ??
  //       null;
  //   //List data = jsonDecode(response.body)['results'];
  //   setState(() {
  //     usersData = user; // Fix the assignment here
  //     print("User: $usersData");

  // if (usersData != null) {
  //   for (int i = 0; i < usersData.length; i++) {
  //     swipeItems.add(
  //       SwipeItem(
  //         content: Content(text: usersData[i]['name']['first']),
  //         likeAction: () {
  //           scaffoldKey.currentState?.showSnackBar(
  //             const SnackBar(
  //               content: Text("Liked "),
  //               duration: Duration(milliseconds: 500),
  //             ),
  //           );
  //         },
  //         nopeAction: () {
  //           scaffoldKey.currentState?.showSnackBar(
  //             SnackBar(
  //               content: Text("Nope ${usersData[i]['name']['first']}"),
  //               duration: const Duration(milliseconds: 500),
  //             ),
  //           );
  //         },
  //         superlikeAction: () {
  //           scaffoldKey.currentState?.showSnackBar(
  //             SnackBar(
  //               content:
  //                   Text("Superliked ${usersData[i]['name']['first']}"),
  //               duration: const Duration(milliseconds: 500),
  //             ),
  //           );
  //         },
  //         onSlideUpdate: (SlideRegion? region) async {
  //           print("Region $region");
  //         },
  //       ),
  //     );
  //   }
  //   matchEngine = MatchEngine(swipeItems: swipeItems);
  //   isLoading = false;
  // }
  //   });
  // }

  late Future<UserString?>? user;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "I LOVE YOU HAPIND ",
          style: TextStyle(color: Color.fromARGB(255, 44, 39, 3)),
        ),
        backgroundColor: Color.fromARGB(255, 216, 216, 216),
        actions: <Widget>[
          IconButton(
              tooltip: 'Go to the next page',
              onPressed: () {
                // đây sẽ thêm một trang search
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Notification'),
                      ),
                      body: const Center(
                        child: Text(
                          'This is the next page',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ));
              },
              icon: Icon(CupertinoIcons.bell_fill, color: Colors.red)),
          IconButton(
            tooltip: 'Go to the next page',
            onPressed: () {
              // đây sẽ thêm một trang search
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Search Setting'),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
            icon: const Icon(
              Icons.brightness_high,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      //  width: MediaQuery.of(context).size.width * 10.0,
                      child: SwipeCards(
                        matchEngine: matchEngine,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            // fit: StackFit.expand,
                            alignment: AlignmentDirectional.topCenter,
                            children: <Widget>[
                              CarouselSlider(
                                  items: items
                                      .map(
                                        (item) => Image.network(
                                          item ?? "",
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                      )
                                      .toList(),
                                  options: CarouselOptions(
                                      height: 900,
                                      viewportFraction: 1.0,
                                      aspectRatio: 3.0,
                                      initialPage: 3,
                                      enlargeCenterPage: false,
                                      autoPlay: true,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          currentIndex = index;
                                        });
                                      })),
                              Container(
                                margin: const EdgeInsets.all(1.0),
                                decoration: const BoxDecoration(
                                    // borderRadius:
                                    //  BorderRadius.all(Radius.circular(24.0)),
                                    color: Colors.black26),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  // alignment: Alignment.bottomCenter,
                                  height: 72.0,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                      ),
                                      color: Colors.white24),
                                  margin: const EdgeInsets.fromLTRB(
                                      24.0, 40.0, 24.0, 24.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Flexible(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                usersData?.fullname ??
                                                    "Default Name" +
                                                        (currentDate.year -
                                                                (usersData?.dob
                                                                        ?.year ??
                                                                    0))
                                                            .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                softWrap: false,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold,
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
                                                usersData?.address ?? "" + ", ",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                softWrap: false,
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsPage(
                                                  name: usersData?.fullname ??
                                                      "Default Name",
                                                  age: (currentDate.year -
                                                          (usersData
                                                                  ?.dob?.year ??
                                                              0))
                                                      .toString(),
                                                  gender: usersData?.gender ??
                                                      "Default gender",
                                                  city: usersData?.address ??
                                                      "Default address",
                                                  state: usersData?.address ??
                                                      "Default address",
                                                  country: usersData?.address ??
                                                      "Default address",
                                                  phone: usersData?.phone ??
                                                      "Default phone",
                                                  email: usersData?.email ??
                                                      "Default email",
                                                  avatar: usersData?.userImages
                                                          ?.first.imagePath ??
                                                      "",
                                                ),
                                              ),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.directions_sharp,
                                            color: Color.fromARGB(
                                                255, 189, 81, 225),
                                          ),
                                          label: const Text(
                                            "Profile",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 219, 64, 64),
                                              fontSize: 12.0,
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            elevation: 8.0,
                                            shadowColor: Colors.deepPurple,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        onStackFinished: () {
                          scaffoldKey.currentState!.showSnackBar(const SnackBar(
                            content: Text("Stack Finished"),
                            duration: Duration(milliseconds: 500),
                          ));
                        },
                        itemChanged: (SwipeItem item, int index) {
                          getData();
                          print("item: ${item.content.text}, index: $index");
                        },
                        upSwipeAllowed: true,
                        fillSpace: true,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black,
                                spreadRadius: 2)
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(
                              Icons.thumb_down_alt_rounded,
                              color: Color.fromARGB(255, 2, 2, 2),
                            ),
                            onPressed: () {
                              matchEngine.currentItem?.nope();
                            },

                            //  child: const Text("Nope"),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black,
                                spreadRadius: 2)
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 22.0,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Color.fromARGB(255, 245, 6, 6),
                            child: Center(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                onPressed: () {
                                  matchEngine.currentItem?.superLike();
                                  // ignore: unused_label
                                  child:
                                  const Text("Superlike");
                                },
                                //  child:const Text("Superlike"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black,
                                spreadRadius: 2)
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(
                              Icons.thumb_up_alt_rounded,
                              color: Color.fromARGB(255, 244, 177, 54),
                            ),
                            onPressed: () {
                              matchEngine.currentItem?.like();
                            },
                            // child: const Text("Like"),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(
  //         "I LOVE YOU HAPIND ",
  //         style: TextStyle(color: Color.fromARGB(255, 44, 39, 3)),
  //       ),
  //       backgroundColor: Color.fromARGB(255, 216, 216, 216),
  //       actions: <Widget>[
  //         IconButton(
  //             tooltip: 'Go to the next page',
  //             onPressed: () {
  //               // đây sẽ thêm một trang search
  //               Navigator.push(context, MaterialPageRoute<void>(
  //                 builder: (BuildContext context) {
  //                   return Scaffold(
  //                     appBar: AppBar(
  //                       title: const Text('Notification'),
  //                     ),
  //                     body: const Center(
  //                       child: Text(
  //                         'This is the next page',
  //                         style: TextStyle(fontSize: 24),
  //                       ),
  //                     ),
  //                   );
  //                 },
  //               ));
  //             },
  //             icon: Icon(CupertinoIcons.bell_fill, color: Colors.red)),
  //         IconButton(
  //           tooltip: 'Go to the next page',
  //           onPressed: () {
  //             // đây sẽ thêm một trang search
  //             Navigator.push(context, MaterialPageRoute<void>(
  //               builder: (BuildContext context) {
  //                 return Scaffold(
  //                   appBar: AppBar(
  //                     title: const Text('Search Setting'),
  //                   ),
  //                   body: const Center(
  //                     child: Text(
  //                       'This is the next page',
  //                       style: TextStyle(fontSize: 24),
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ));
  //           },
  //           icon: const Icon(
  //             Icons.brightness_high,
  //             color: Color.fromARGB(255, 0, 0, 0),
  //           ),
  //         ),
  //       ],
  //     ),
  //     body: FutureBuilder<UserString?>(
  //       future: user,
  //       builder: (context, snapshot) {
  //         if (snapshot.hasError) {
  //           return const Center(
  //             child: Text('An error has occurred!'),
  //           );
  //         } else if (snapshot.hasData) {
  //           return Center(
  //             child: isLoading
  //                 ? const CircularProgressIndicator()
  //                 : Column(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: <Widget>[
  //                       Center(
  //                         child: SizedBox(
  //                           height: MediaQuery.of(context).size.height * 0.7,
  //                           //  width: MediaQuery.of(context).size.width * 10.0,
  //                           child: SwipeCards(
  //                             matchEngine: matchEngine,
  //                             itemBuilder: (BuildContext context, int index) {
  //                               return Stack(
  //                                 // fit: StackFit.expand,
  //                                 alignment: AlignmentDirectional.topCenter,
  //                                 children: <Widget>[
  //                                   CarouselSlider(
  //                                       items: widget.items
  //                                           .map(
  //                                             (item) => Image.network(
  //                                               item,
  //                                               fit: BoxFit.cover,
  //                                               width: double.infinity,
  //                                             ),
  //                                           )
  //                                           .toList(),
  //                                       options: CarouselOptions(
  //                                           height: 900,
  //                                           viewportFraction: 1.0,
  //                                           aspectRatio: 3.0,
  //                                           initialPage: 3,
  //                                           enlargeCenterPage: false,
  //                                           autoPlay: true,
  //                                           onPageChanged: (index, reason) {
  //                                             setState(() {
  //                                               currentIndex = index;
  //                                             });
  //                                           })),
  //                                   Container(
  //                                     margin: const EdgeInsets.all(1.0),
  //                                     decoration: const BoxDecoration(
  //                                         // borderRadius:
  //                                         //  BorderRadius.all(Radius.circular(24.0)),
  //                                         color: Colors.black26),
  //                                   ),
  //                                   Align(
  //                                     alignment: Alignment.bottomCenter,
  //                                     child: Container(
  //                                       // alignment: Alignment.bottomCenter,
  //                                       height: 72.0,
  //                                       decoration: const BoxDecoration(
  //                                           borderRadius: BorderRadius.only(
  //                                             bottomLeft: Radius.circular(0),
  //                                             bottomRight: Radius.circular(0),
  //                                           ),
  //                                           color: Colors.white24),
  //                                       margin: const EdgeInsets.fromLTRB(
  //                                           24.0, 40.0, 24.0, 24.0),
  //                                       child: Row(
  //                                         mainAxisAlignment:
  //                                             MainAxisAlignment.spaceBetween,
  //                                         crossAxisAlignment:
  //                                             CrossAxisAlignment.center,
  //                                         children: <Widget>[
  //                                           Column(
  //                                             crossAxisAlignment:
  //                                                 CrossAxisAlignment.start,
  //                                             children: <Widget>[
  //                                               Flexible(
  //                                                 child: Padding(
  //                                                   padding:
  //                                                       const EdgeInsets.all(
  //                                                           4.0),
  //                                                   child: Text(
  //                                                     usersData?.fullname ??
  //                                                         "Default Name" +
  //                                                             (currentDate.year -
  //                                                                     (usersData
  //                                                                             ?.dob
  //                                                                             ?.year ??
  //                                                                         0))
  //                                                                 .toString(),
  //                                                     overflow:
  //                                                         TextOverflow.ellipsis,
  //                                                     maxLines: 1,
  //                                                     softWrap: false,
  //                                                     style: const TextStyle(
  //                                                       color: Colors.white,
  //                                                       fontSize: 26,
  //                                                       fontWeight:
  //                                                           FontWeight.bold,
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                               Flexible(
  //                                                 child: Padding(
  //                                                   padding: const EdgeInsets
  //                                                       .fromLTRB(20, 10, 0, 0),
  //                                                   child: Text(
  //                                                     usersData?.address ??
  //                                                         "" + ", ",
  //                                                     overflow:
  //                                                         TextOverflow.ellipsis,
  //                                                     maxLines: 1,
  //                                                     softWrap: false,
  //                                                     textAlign: TextAlign.left,
  //                                                     style: const TextStyle(
  //                                                       color: Colors.white70,
  //                                                       fontSize: 12.0,
  //                                                       fontWeight:
  //                                                           FontWeight.normal,
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ],
  //                                           ),
  //                                           Padding(
  //                                             padding:
  //                                                 const EdgeInsets.all(8.0),
  //                                             child: ElevatedButton.icon(
  //                                               onPressed: () {
  //                                                 Navigator.push(
  //                                                   context,
  //                                                   MaterialPageRoute(
  //                                                     builder: (context) =>
  //                                                         DetailsPage(
  //                                                       name: usersData
  //                                                               ?.fullname ??
  //                                                           "Default Name",
  //                                                       age: (currentDate.year -
  //                                                               (usersData?.dob
  //                                                                       ?.year ??
  //                                                                   0))
  //                                                           .toString(),
  //                                                       gender: usersData
  //                                                               ?.gender ??
  //                                                           "Default gender",
  //                                                       city: usersData
  //                                                               ?.address ??
  //                                                           "Default address",
  //                                                       state: usersData
  //                                                               ?.address ??
  //                                                           "Default address",
  //                                                       country: usersData
  //                                                               ?.address ??
  //                                                           "Default address",
  //                                                       phone:
  //                                                           usersData?.phone ??
  //                                                               "Default phone",
  //                                                       email:
  //                                                           usersData?.email ??
  //                                                               "Default email",
  //                                                       //  _avatarUr: usersData[index]
  //                                                       //       ['picture']['large'],
  //                                                     ),
  //                                                   ),
  //                                                 );
  //                                               },
  //                                               icon: const Icon(
  //                                                 Icons.directions_sharp,
  //                                                 color: Color.fromARGB(
  //                                                     255, 189, 81, 225),
  //                                               ),
  //                                               label: const Text(
  //                                                 "Profile",
  //                                                 style: TextStyle(
  //                                                   color: Color.fromARGB(
  //                                                       255, 219, 64, 64),
  //                                                   fontSize: 12.0,
  //                                                   overflow:
  //                                                       TextOverflow.ellipsis,
  //                                                   fontWeight: FontWeight.bold,
  //                                                 ),
  //                                               ),
  //                                               style: ElevatedButton.styleFrom(
  //                                                 shape: RoundedRectangleBorder(
  //                                                   borderRadius:
  //                                                       BorderRadius.circular(
  //                                                           30.0),
  //                                                 ),
  //                                                 elevation: 8.0,
  //                                                 shadowColor:
  //                                                     Colors.deepPurple,
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ],
  //                               );
  //                             },
  //                             onStackFinished: () {
  //                               scaffoldKey.currentState!
  //                                   .showSnackBar(const SnackBar(
  //                                 content: Text("Stack Finished"),
  //                                 duration: Duration(milliseconds: 500),
  //                               ));
  //                             },
  //                             itemChanged: (SwipeItem item, int index) {
  //                               print(
  //                                   "item: ${item.content.text}, index: $index");
  //                             },
  //                             upSwipeAllowed: true,
  //                             fillSpace: true,
  //                           ),
  //                         ),
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                         children: [
  //                           Container(
  //                             decoration: const BoxDecoration(
  //                               color: Colors.white,
  //                               shape: BoxShape.circle,
  //                               boxShadow: [
  //                                 BoxShadow(
  //                                     blurRadius: 10,
  //                                     color: Colors.black,
  //                                     spreadRadius: 2)
  //                               ],
  //                             ),
  //                             child: CircleAvatar(
  //                               backgroundColor: Colors.white,
  //                               child: IconButton(
  //                                 icon: const Icon(
  //                                   Icons.thumb_down_alt_rounded,
  //                                   color: Color.fromARGB(255, 2, 2, 2),
  //                                 ),
  //                                 onPressed: () {
  //                                   matchEngine.currentItem?.nope();
  //                                 },

  //                                 //  child: const Text("Nope"),
  //                               ),
  //                             ),
  //                           ),
  //                           Container(
  //                             decoration: const BoxDecoration(
  //                               color: Colors.white,
  //                               shape: BoxShape.circle,
  //                               boxShadow: [
  //                                 BoxShadow(
  //                                     blurRadius: 10,
  //                                     color: Colors.black,
  //                                     spreadRadius: 2)
  //                               ],
  //                             ),
  //                             child: CircleAvatar(
  //                               radius: 22.0,
  //                               backgroundColor: Colors.white,
  //                               child: CircleAvatar(
  //                                 radius: 30.0,
  //                                 backgroundColor:
  //                                     Color.fromARGB(255, 245, 6, 6),
  //                                 child: Center(
  //                                   child: IconButton(
  //                                     icon: const Icon(
  //                                       Icons.favorite,
  //                                       color: Colors.white,
  //                                       size: 30.0,
  //                                     ),
  //                                     onPressed: () {
  //                                       matchEngine.currentItem?.superLike();
  //                                       // ignore: unused_label
  //                                       child:
  //                                       const Text("Superlike");
  //                                     },
  //                                     //  child:const Text("Superlike"),
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           Container(
  //                             decoration: const BoxDecoration(
  //                               color: Colors.white,
  //                               shape: BoxShape.circle,
  //                               boxShadow: [
  //                                 BoxShadow(
  //                                     blurRadius: 10,
  //                                     color: Colors.black,
  //                                     spreadRadius: 2)
  //                               ],
  //                             ),
  //                             child: CircleAvatar(
  //                               backgroundColor: Colors.white,
  //                               child: IconButton(
  //                                 icon: const Icon(
  //                                   Icons.thumb_up_alt_rounded,
  //                                   color: Color.fromARGB(255, 244, 177, 54),
  //                                 ),
  //                                 onPressed: () {
  //                                   matchEngine.currentItem?.like();
  //                                 },
  //                                 // child: const Text("Like"),
  //                               ),
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //           );
  //         } else {
  //           return const Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }
}

// class MatchingListView extends StatelessWidget {
//   const MatchingListView({super.key, required this.user});

//   final List<User> user;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: isLoading
//           ? const CircularProgressIndicator()
//           : Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Center(
//                   child: SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.7,
//                     //  width: MediaQuery.of(context).size.width * 10.0,
//                     child: SwipeCards(
//                       matchEngine: matchEngine,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Stack(
//                           // fit: StackFit.expand,
//                           alignment: AlignmentDirectional.topCenter,
//                           children: <Widget>[
//                             CarouselSlider(
//                                 items: widget.items
//                                     .map(
//                                       (item) => Image.network(
//                                         item,
//                                         fit: BoxFit.cover,
//                                         width: double.infinity,
//                                       ),
//                                     )
//                                     .toList(),
//                                 options: CarouselOptions(
//                                     height: 900,
//                                     viewportFraction: 1.0,
//                                     aspectRatio: 3.0,
//                                     initialPage: 3,
//                                     enlargeCenterPage: false,
//                                     autoPlay: true,
//                                     onPageChanged: (index, reason) {
//                                       setState(() {
//                                         currentIndex = index;
//                                       });
//                                     })),
//                             Container(
//                               margin: const EdgeInsets.all(1.0),
//                               decoration: const BoxDecoration(
//                                   // borderRadius:
//                                   //  BorderRadius.all(Radius.circular(24.0)),
//                                   color: Colors.black26),
//                             ),
//                             Align(
//                               alignment: Alignment.bottomCenter,
//                               child: Container(
//                                 // alignment: Alignment.bottomCenter,
//                                 height: 72.0,
//                                 decoration: const BoxDecoration(
//                                     borderRadius: BorderRadius.only(
//                                       bottomLeft: Radius.circular(0),
//                                       bottomRight: Radius.circular(0),
//                                     ),
//                                     color: Colors.white24),
//                                 margin: const EdgeInsets.fromLTRB(
//                                     24.0, 40.0, 24.0, 24.0),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: <Widget>[
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: <Widget>[
//                                         Flexible(
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(4.0),
//                                             child: Text(
//                                               usersData[index]['name']
//                                                       ['first'] +
//                                                   ", " +
//                                                   usersData[index]['dob']['age']
//                                                       .toString(),
//                                               overflow: TextOverflow.ellipsis,
//                                               maxLines: 1,
//                                               softWrap: false,
//                                               style: const TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 26,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Flexible(
//                                           child: Padding(
//                                             padding: const EdgeInsets.fromLTRB(
//                                                 20, 10, 0, 0),
//                                             child: Text(
//                                               usersData[index]['location']
//                                                       ['city'] +
//                                                   ", " +
//                                                   usersData[index]['location']
//                                                       ['country'],
//                                               overflow: TextOverflow.ellipsis,
//                                               maxLines: 1,
//                                               softWrap: false,
//                                               textAlign: TextAlign.left,
//                                               style: const TextStyle(
//                                                 color: Colors.white70,
//                                                 fontSize: 12.0,
//                                                 fontWeight: FontWeight.normal,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: ElevatedButton.icon(
//                                         onPressed: () {
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) => DetailsPage(
//                                                 name: usersData[index]['name']
//                                                     ['first'],
//                                                 age: usersData[index]['dob']
//                                                         ['age']
//                                                     .toString(),
//                                                 gender: usersData[index]
//                                                     ['gender'],
//                                                 city: usersData[index]
//                                                     ['location']['city'],
//                                                 state: usersData[index]
//                                                     ['location']['state'],
//                                                 country: usersData[index]
//                                                     ['location']['country'],
//                                                 phone: usersData[index]['phone']
//                                                     .toString(),
//                                                 email: usersData[index]
//                                                     ['email'],
//                                                 //  _avatarUr: usersData[index]
//                                                 //       ['picture']['large'],
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                         icon: const Icon(
//                                           Icons.directions_sharp,
//                                           color:
//                                               Color.fromARGB(255, 189, 81, 225),
//                                         ),
//                                         label: const Text(
//                                           "Profile",
//                                           style: TextStyle(
//                                             color: Color.fromARGB(
//                                                 255, 219, 64, 64),
//                                             fontSize: 12.0,
//                                             overflow: TextOverflow.ellipsis,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         style: ElevatedButton.styleFrom(
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(30.0),
//                                           ),
//                                           elevation: 8.0,
//                                           shadowColor: Colors.deepPurple,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                       onStackFinished: () {
//                         scaffoldKey.currentState!.showSnackBar(const SnackBar(
//                           content: Text("Stack Finished"),
//                           duration: Duration(milliseconds: 500),
//                         ));
//                       },
//                       itemChanged: (SwipeItem item, int index) {
//                         print("item: ${item.content.text}, index: $index");
//                       },
//                       upSwipeAllowed: true,
//                       fillSpace: true,
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                               blurRadius: 10,
//                               color: Colors.black,
//                               spreadRadius: 2)
//                         ],
//                       ),
//                       child: CircleAvatar(
//                         backgroundColor: Colors.white,
//                         child: IconButton(
//                           icon: const Icon(
//                             Icons.thumb_down_alt_rounded,
//                             color: Color.fromARGB(255, 2, 2, 2),
//                           ),
//                           onPressed: () {
//                             matchEngine.currentItem?.nope();
//                           },

//                           //  child: const Text("Nope"),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                               blurRadius: 10,
//                               color: Colors.black,
//                               spreadRadius: 2)
//                         ],
//                       ),
//                       child: CircleAvatar(
//                         radius: 22.0,
//                         backgroundColor: Colors.white,
//                         child: CircleAvatar(
//                           radius: 30.0,
//                           backgroundColor: Color.fromARGB(255, 245, 6, 6),
//                           child: Center(
//                             child: IconButton(
//                               icon: const Icon(
//                                 Icons.favorite,
//                                 color: Colors.white,
//                                 size: 30.0,
//                               ),
//                               onPressed: () {
//                                 matchEngine.currentItem?.superLike();
//                                 // ignore: unused_label
//                                 child:
//                                 const Text("Superlike");
//                               },
//                               //  child:const Text("Superlike"),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                               blurRadius: 10,
//                               color: Colors.black,
//                               spreadRadius: 2)
//                         ],
//                       ),
//                       child: CircleAvatar(
//                         backgroundColor: Colors.white,
//                         child: IconButton(
//                           icon: const Icon(
//                             Icons.thumb_up_alt_rounded,
//                             color: Color.fromARGB(255, 244, 177, 54),
//                           ),
//                           onPressed: () {
//                             matchEngine.currentItem?.like();
//                           },
//                           // child: const Text("Like"),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//     );
//   }
// }

class Content {
  final String? text;

  Content({this.text});
}
