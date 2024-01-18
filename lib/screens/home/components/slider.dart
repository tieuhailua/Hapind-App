import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hapind/models/user_story.dart';
import 'package:hapind/screens/details/details_page.dart';
import 'package:story/story_page_view.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:http/http.dart' as http;

class SliderHome extends StatefulWidget {
  const SliderHome(
      {super.key,
      this.items = const [
        "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/e44w6saipufr4qhbtesw",
        "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/lpckjnidqulkymh6r1da",
        // "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/jy124fhdttag8qbdpeus",
        "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/ilr7v5wikdxcla8odvr1",
        "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/k4etvr7nmwerdgd3fals",
        "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/m3gung4bdlzc3fsh0bb5",
      ]});

  final List<String> items;

  @override
  State<SliderHome> createState() => _SliederState();
}

int currentIndex = 0;
late CarouselController controller;
final String url = "https://randomuser.me/api/?results=50";

List<SwipeItem> swipeItems = <SwipeItem>[];
List<int> imageIndexList = List.generate(10, (index) => 0);
MatchEngine matchEngine = MatchEngine();
bool isNope = false;
bool isLike = false;
bool isSuperLike = false;
late List usersData;
bool isLoading = true;
final GlobalKey<ScaffoldMessengerState> scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();

class _SliederState extends State<SliderHome> {
  Future getData() async {
    var response = await http.get(
      Uri.parse(url),
      headers: {"Accept": "application/json"},
    );

    List data = jsonDecode(response.body)['results'];
    setState(() {
      usersData = data;

      if (usersData.isNotEmpty) {
        for (int i = 0; i < usersData.length; i++) {
          swipeItems.add(SwipeItem(
              // content: Content(text: _names[i], color: _colors[i]),
              content: Content(text: usersData[i]['name']['first']),
              likeAction: () {
                scaffoldKey.currentState?.showSnackBar(const SnackBar(
                  content: Text("Liked "),
                  // content: Text("Liked ${_names[i]}"),
                  duration: Duration(milliseconds: 500),
                ));
              },
              nopeAction: () {
                scaffoldKey.currentState?.showSnackBar(SnackBar(
                  content: Text("Nope ${usersData[i]['name']['first']}"),
                  duration: const Duration(milliseconds: 500),
                ));
              },
              superlikeAction: () {
                scaffoldKey.currentState?.showSnackBar(SnackBar(
                  content: Text("Superliked ${usersData[i]['name']['first']}"),
                  duration: const Duration(milliseconds: 500),
                ));
              },
              onSlideUpdate: (SlideRegion? region) async {
                print("Region $region");
              }));
        } //for loop
        matchEngine = MatchEngine(swipeItems: swipeItems);
        isLoading = false;
      } //if
    }); // setState
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false, 
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
                              StoryPageView(
                                itemBuilder: (context, pageIndex, storyIndex) {
                                  final user = users[pageIndex];
                                  final story = user.stories[storyIndex];

                                  return Stack(children: [
                                    Positioned.fill(
                                      child: Container(
                                          color: Color.fromARGB(
                                              255, 232, 229, 229)),
                                    ),
                                    Positioned.fill(
                                      top: 1,
                                      bottom: 1,
                                      child: Image.network(
                                        story.imageUrl,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ]);
                                },
                                initialStoryIndex: (pageIndex) {
                                  if (pageIndex == 0) {
                                    return 0;
                                  }
                                  return 0;
                                },
                                pageLength: users.length,
                                storyLength: (int pageIndex) {
                                  return users[pageIndex].stories.length;
                                },
                                onPageLimitReached: () {
                                  // Navigator.pop(context);
                                },
                                // items: widget.items
                                //     .map(
                                //       (item) => Image.network(
                                //         item,
                                //         fit: BoxFit.cover,
                                //         width: double.infinity,
                                //       ),
                                //     )
                                //     .toList(),
                                // options: CarouselOptions(
                                //     height: 900,
                                //     viewportFraction: 1.0,
                                //     aspectRatio: 3.0,
                                //     initialPage: 3,
                                //     enlargeCenterPage: false,
                                //     autoPlay: true,
                                //     onPageChanged: (index, reason) {
                                //       setState(() {
                                //         currentIndex = index;
                                //       }
                                //       );
                                //     }
                              ),
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
                                                usersData[index]['name']
                                                        ['first'] +
                                                    ", " +
                                                    usersData[index]['dob']
                                                            ['age']
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
                                                usersData[index]['location']
                                                        ['city'] +
                                                    ", " +
                                                    usersData[index]['location']
                                                        ['country'],
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
                                                  name: usersData[index]['name']
                                                      ['first'],
                                                  age: usersData[index]['dob']
                                                          ['age']
                                                      .toString(),
                                                  gender: usersData[index]
                                                      ['gender'],
                                                  city: usersData[index]
                                                      ['location']['city'],
                                                  state: usersData[index]
                                                      ['location']['state'],
                                                  country: usersData[index]
                                                      ['location']['country'],
                                                  phone: usersData[index]
                                                          ['phone']
                                                      .toString(),
                                                  email: usersData[index]
                                                      ['email'],
                                                  //  _avatarUr: usersData[index]
                                                  //       ['picture']['large'],
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
                                              fontSize: 10.0,
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
                          )
                          );
                        },
                        itemChanged: (SwipeItem item, int index) {
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
}

class Content {
  final String? text;

  Content({this.text});
}
