import 'package:flutter/material.dart';
import 'package:hapind/model/block.dart';
import 'package:hapind/model/user_exercise.dart';
import 'package:hapind/model/user_music.dart';
import 'package:hapind/model/user_pet.dart';
import 'package:hapind/model/user_singer.dart';
import 'package:hapind/screens/blog_success/block_success_screen.dart';
import 'dart:ui';

import 'package:hapind/screens/chat/chats_screen.dart';
import 'package:hapind/screens/report/report_form_screen.dart';
import 'package:hapind/screens/report_list/components/block_menu.dart';
import 'package:hapind/service/token_service.dart';
import 'package:hapind/service/user_service.dart';

class DetailsPage extends StatefulWidget {
  final String name,
      gender,
      city,
      state,
      country,
      email,
      age,
      phone,
      avatar,
      DOB,
      purpose,
      description,
      weight,
      height,
      drinking,
      family,
      habit,
      literacy,
      smoking,
      work;
  final int id;
  final Set<UserExercise>? sport;
  final Set<UserMusic>? music;
  final Set<UserPet>? pet;
  final Set<UserSinger>? singer;

  const DetailsPage({
    Key? key,
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.city,
    required this.state,
    required this.country,
    required this.phone,
    required this.email,
    required this.avatar,
    required this.DOB,
    required this.purpose,
    required this.description,
    required this.weight,
    required this.height,
    required this.drinking,
    required this.family,
    required this.habit,
    required this.literacy,
    required this.smoking,
    required this.work,
    required this.sport,
    required this.music,
    required this.pet,
    required this.singer,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<String>? love = [];
  TokenService _tokenService = TokenService();
  UserService _userService = UserService();
  @override
  void initState() {
    super.initState();
    if (widget.sport != null) {
      widget.sport?.forEach((exercise) {
        // Check your condition for sport, e.g., exercise.isActive or any other property
        if (exercise.choose == true) {
          love?.add('Sport');
        }
      });
    }
    if (widget.music != null) {
      widget.music?.forEach((exercise) {
        // Check your condition for sport, e.g., exercise.isActive or any other property
        if (exercise.choose == true) {
          love?.add('Music');
        }
      });
    }
    if (widget.pet != null) {
      widget.pet?.forEach((exercise) {
        // Check your condition for sport, e.g., exercise.isActive or any other property
        if (exercise.choose == true) {
          love?.add('Pet');
        }
      });
    }
    if (widget.singer != null) {
      widget.singer?.forEach((exercise) {
        // Check your condition for sport, e.g., exercise.isActive or any other property
        if (exercise.choose == true) {
          love?.add('Singer');
        }
      });
    }
    // if (widget.sport == true) {
    //   love.add('sport');
    // }
    // if (widget.music == true) {
    //   love.add('music');
    // }
    //   if (widget.music == true) {
    //   love.add('music');
    // } else if (widget.music != null &&
    //     widget.music.any((music) => music['choose'] == true)) {
    //   love.add('music');
    // }
    // if (widget.pet == true) {
    //   love.add('pet');
    // }
    // if (widget.singer == true) {
    //   love.add('singer');
    // }
    print(love);
  }

  @override
  Widget build(BuildContext context) {
    String _avatarUrl =
        //"https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/e44w6saipufr4qhbtesw";
        "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/lpckjnidqulkymh6r1da";
    return Scaffold(
      // body: Container(
      //   margin: const EdgeInsets.only(top: kToolbarHeight - 22),
      //   color: Color.fromARGB(255, 248, 246, 248),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,

      //     children: <Widget>[

      //       SizedBox(
      //         height: MediaQuery.of(context).size.height * 0.6,
      //         child: Stack(
      //           fit: StackFit.expand,
      //           children: <Widget>[
      //             Card(
      //               shadowColor: Colors.deepPurpleAccent,
      //               elevation: 16.0,
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(24.0),
      //               ),
      //               color: Color.fromARGB(255, 249, 248, 250),
      //               child: Padding(
      //                 padding: const EdgeInsets.all(4.0),

      //                 // backgroundImage: NetworkImage(_avatarUrl),
      //                 child: ClipRRect(
      //                   borderRadius: BorderRadius.circular(24.0),
      //                   child: Image.network(
      //                     _avatarUrl,
      //                     width: double.infinity,
      //                     fit: BoxFit.cover,
      //                   ),
      //                 ),

      //                 // child: ClipRRect(
      //                 //   borderRadius: BorderRadius.circular(24.0),
      //                 //   child: Image.network(
      //                 //    NetworkImage(_avatarUrl),
      //                 //     height: 1000,
      //                 //     width: double.infinity,

      //                 //     fit: BoxFit.cover,
      //                 //   ),
      //                 // ),
      //               ),
      //             ),
      //             Container(
      //               margin: const EdgeInsets.all(4.0),
      //               decoration: const BoxDecoration(
      //                   borderRadius: BorderRadius.all(Radius.circular(24.0)),
      //                   color: Colors.black12),
      //             ),
      //             Align(
      //               alignment: Alignment.topCenter,
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: <Widget>[
      //                   Container(
      //                     width: 48,
      //                     height: 48,
      //                     margin: const EdgeInsets.all(32.0),
      //                     decoration: const BoxDecoration(
      //                         borderRadius:
      //                             BorderRadius.all(Radius.circular(8.0)),
      //                         color: Colors.white24),
      //                     child: IconButton(
      //                       onPressed: () {
      //                         Navigator.pop(context);
      //                       },
      //                       icon: const Icon(
      //                         Icons.arrow_back_ios,
      //                         color: Colors.white70,
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Align(
      //               alignment: Alignment.bottomCenter,
      //               child: Row(
      //                 children: <Widget>[
      //                   Flexible(
      //                     child: Container(
      //                       width: MediaQuery.of(context).size.width,
      //                       height: 72,
      //                       margin: const EdgeInsets.fromLTRB(8, 0, 8, 8.0),
      //                       decoration: const BoxDecoration(
      //                         borderRadius: BorderRadius.only(
      //                           bottomLeft: Radius.circular(24.0),
      //                           bottomRight: Radius.circular(24.0),
      //                         ),
      //                       ),
      //                       child: ClipRRect(
      //                         borderRadius: const BorderRadius.only(
      //                           bottomLeft: Radius.circular(24.0),
      //                           bottomRight: Radius.circular(24.0),
      //                         ),
      //                         // Clip it cleanly.
      //                         child: BackdropFilter(
      //                           filter:
      //                               ImageFilter.blur(sigmaX: 12, sigmaY: 12),
      //                           child: Container(
      //                             color: Colors.grey.withOpacity(0.1),
      //                             alignment: Alignment.center,
      //                             child: Row(
      //                               mainAxisAlignment:
      //                                   MainAxisAlignment.spaceBetween,
      //                               children: <Widget>[
      //                                 Container(
      //                                   margin: const EdgeInsets.all(24.0),
      //                                   child: const Text(
      //                                     'It can be a match !',
      //                                     style: TextStyle(
      //                                       color: Colors.white70,
      //                                       fontWeight: FontWeight.bold,
      //                                       fontSize: 16.0,
      //                                     ),
      //                                   ),
      //                                 ),
      //                                 Container(
      //                                   margin: const EdgeInsets.fromLTRB(
      //                                       0, 0, 24, 0),
      //                                   child: Padding(
      //                                     padding: const EdgeInsets.all(0.0),
      //                                     child: ElevatedButton.icon(
      //                                       onPressed: () =>
      //                                           Navigator.pushNamed(context,
      //                                               ChatsScreen.routeName),
      //                                       // chổ này nhấn qua trang chat message
      //                                       icon: const Icon(
      //                                         Icons.mark_chat_read_rounded,
      //                                         color: Color.fromARGB(
      //                                             255, 12, 13, 12),
      //                                       ),
      //                                       label: const Text(
      //                                         "Say Hi",
      //                                         style: TextStyle(
      //                                           color: Color.fromARGB(
      //                                               255, 214, 43, 211),
      //                                           fontSize: 16.0,
      //                                           overflow: TextOverflow.ellipsis,
      //                                           fontWeight: FontWeight.bold,
      //                                         ),
      //                                       ),
      //                                       style: ElevatedButton.styleFrom(
      //                                         padding:
      //                                             const EdgeInsets.all(12.0),
      //                                         shape: RoundedRectangleBorder(
      //                                           borderRadius:
      //                                               BorderRadius.circular(16.0),
      //                                         ),
      //                                         elevation: 8.0,
      //                                         shadowColor: Colors.white,
      //                                       ),
      //                                     ),
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: <Widget>[
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Container(
      //                   margin: const EdgeInsets.all(0.0),
      //                   child: Text(
      //                     widget.name + ", " + widget.age,
      //                     style: const TextStyle(
      //                       color: Colors.black87,
      //                       fontSize: 24.0,
      //                       fontWeight: FontWeight.bold,
      //                       overflow: TextOverflow.ellipsis,
      //                     ),
      //                     overflow: TextOverflow.ellipsis,
      //                   ),
      //                 ),
      //                 Container(
      //                   margin: const EdgeInsets.all(0.0),
      //                   child: Text(
      //                     widget.city +
      //                         " " +
      //                         widget.state +
      //                         " ," +
      //                         widget.country,
      //                     style: const TextStyle(
      //                       color: Colors.grey,
      //                       fontSize: 14.0,
      //                       fontWeight: FontWeight.normal,
      //                       overflow: TextOverflow.ellipsis,
      //                     ),
      //                     overflow: TextOverflow.ellipsis,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             Container(
      //               height: 36,
      //               width: 48,
      //               alignment: Alignment.center,
      //               margin: const EdgeInsets.only(right: 30),
      //               decoration: const BoxDecoration(
      //                   borderRadius: BorderRadius.all(Radius.circular(24.0)),
      //                   color: Colors.black12),
      //               child: Icon(
      //                 widget.gender == 'male' ? Icons.male : Icons.female,
      //                 color: Color.fromARGB(255, 247, 32, 8),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.fromLTRB(24, 4, 24, 0),
      //         child: SizedBox(
      //           height: 150,
      //           child: Card(
      //             color: Colors.white,
      //             shadowColor: Colors.deepPurple[300],
      //             elevation: 8.0,
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(30.0),
      //             ),
      //             child: Column(
      //               children: <Widget>[
      //                 Container(
      //                   margin: const EdgeInsets.all(16),
      //                   child: const Text(
      //                       'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
      //                       style: TextStyle(
      //                         color: Colors.black54,
      //                         fontSize: 14.0,
      //                         fontWeight: FontWeight.normal,
      //                       ),
      //                       maxLines: 2,
      //                       textAlign: TextAlign.justify,
      //                       overflow: TextOverflow.fade),
      //                 ),
      //                 const Divider(
      //                   height: 1,
      //                   color: Colors.grey,
      //                 ),
      //                 Row(
      //                   crossAxisAlignment: CrossAxisAlignment.center,
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: <Widget>[
      //                     Container(
      //                       margin: const EdgeInsets.fromLTRB(24, 12, 0, 12),
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: <Widget>[
      //                           const Icon(
      //                             Icons.phone,
      //                             color: Colors.deepPurple,
      //                           ),
      //                           Text(
      //                             widget.phone,
      //                             style: const TextStyle(
      //                               color: Colors.black54,
      //                               fontSize: 12.0,
      //                             ),
      //                             textAlign: TextAlign.center,
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                     Container(
      //                       margin: const EdgeInsets.fromLTRB(0, 12, 24, 12),
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: <Widget>[
      //                           const Icon(
      //                             Icons.email_rounded,
      //                             color: Colors.deepPurple,
      //                           ),
      //                           Text(
      //                             widget.email,
      //                             style: const TextStyle(
      //                               color: Colors.black54,
      //                               overflow: TextOverflow.fade,
      //                               fontSize: 12.0,
      //                             ),
      //                             overflow: TextOverflow.fade,
      //                             textAlign: TextAlign.center,
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ],
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      backgroundColor: Colors.grey[200],
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCarousel(),
          _hotelDesc(),
        ],
      ),
    );
  }

  Widget _buildCarousel() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.avatar), fit: BoxFit.cover),
          ),
        ),
        Positioned(
            child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 48,
                height: 48,
                margin: const EdgeInsets.all(32.0),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.white24),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromARGB(179, 7, 7, 7),
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                      icon: const Icon(Icons.block,
                          color: Color.fromARGB(255, 205, 17, 17)),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirm"),
                              content:
                                  Text("Are you sure to block ${widget.name}?"),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    int? id =
                                        await _tokenService.getStoredUserId();
                                    print(id);
                                    print(widget.id);
                                    //_userService.block(id, widget.id, -5);
                                    Navigator.of(context).pop();
                                   // List<Block>? blocks =
                                     await _userService.block(id, widget.id, -5);
                                     Navigator.pushNamed(context, BlockSuccessScreen.routeName);
                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             BlockMenu(blocks: blocks!)));
                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //   SnackBar(
                                    //     content: Text(
                                    //       ("You have been block " +
                                    //           widget.name),
                                    //     ),
                                    //   ),
                                    // );
                                  },
                                  child: Text("Agree"),
                                ),
                                // Nút "Không đồng ý"
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Disagree"),
                                ),
                              ],
                            );
                          },
                        );
                      }),
                  IconButton(
                      icon: const Icon(Icons.report,
                          color: Color.fromARGB(255, 195, 11, 11)),
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReportFormScreen(reported: widget.id),
                        ));
                      }),
                ],
              ),
            ],
          ),
        )),
      ],
    );
  }

  Widget _hotelDesc() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   padding: const EdgeInsets.all(10),
          //   child: Row(
          //     children: const [
          //       Icon(Icons.search, color: Color.fromARGB(255, 10, 10, 10)),
          //       SizedBox(width: 10),
          //       Expanded(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               "Search",
          //               style: TextStyle(
          //                 fontSize: 16,
          //                 color: Color.fromARGB(255, 9, 9, 9),
          //                 fontFamily: "medium",
          //               ),
          //             ),
          //             SizedBox(height: 8),
          //             Text(
          //               "Hẹn Hò Với Tín Đêm Nay",
          //               style: TextStyle(
          //                 fontSize: 12,
          //                 color: Colors.grey,
          //                 fontFamily: "medium",
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            margin: const EdgeInsets.all(0.0),
            child: Text(
              widget.name + ", " + widget.age + " ",
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(0.0),
            child: Text(
              widget.city + " " + widget.state + " ," + widget.country,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                overflow: TextOverflow.ellipsis,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            height: 36,
            margin: const EdgeInsets.only(right: 30),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.black12,
                  ),
                  child: Icon(
                    widget.gender == 'Male' ? Icons.male : Icons.female,
                    color: widget.gender == 'Male' ? Colors.blue : Colors.pink,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  widget.gender == 'Male' ? 'Male' : 'Female',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          //const SizedBox(height: 16),
          // Row(
          //   children: [
          //     Icon(Icons.heart_broken, color: Color.fromARGB(255, 10, 10, 10)),
          //     Padding(
          //       padding: EdgeInsets.only(left: 10),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             "DOB",
          //             style: TextStyle(
          //               fontSize: 16,
          //               color: Color.fromARGB(255, 9, 9, 9),
          //               fontFamily: "medium",
          //             ),
          //           ),
          //           Text(
          //             widget.DOB,
          //             style: TextStyle(
          //               fontSize: 14,
          //               color: Colors.grey,
          //               fontFamily: "medium",
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          Row(
            children: [
              Icon(Icons.heart_broken, color: Color.fromARGB(255, 10, 10, 10)),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Looking",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 9, 9, 9),
                        fontFamily: "medium",
                      ),
                    ),
                    Text(
                      widget.purpose,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontFamily: "medium",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (widget.height != "null")
            Row(
              children: [
                Icon(Icons.height, color: Color.fromARGB(255, 10, 10, 10)),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Height",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 9, 9, 9),
                          fontFamily: "medium",
                        ),
                      ),
                      Text(
                        widget.height + " cm",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: "medium",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          if (widget.weight != "null")
            Row(
              children: [
                Icon(Icons.line_weight, color: Color.fromARGB(255, 10, 10, 10)),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Weight",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 9, 9, 9),
                          fontFamily: "medium",
                        ),
                      ),
                      Text(
                        widget.weight + " Kg",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: "medium",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          if (widget.literacy != "")
            Row(
              children: [
                Icon(Icons.school, color: Color.fromARGB(255, 10, 10, 10)),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Literacy",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 9, 9, 9),
                          fontFamily: "medium",
                        ),
                      ),
                      Text(
                        widget.literacy,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: "medium",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          if (widget.work != "")
            Row(
              children: [
                Icon(Icons.work, color: Color.fromARGB(255, 10, 10, 10)),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Work",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 9, 9, 9),
                          fontFamily: "medium",
                        ),
                      ),
                      Text(
                        widget.work,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: "medium",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          if (widget.family != "")
            Row(
              children: [
                Icon(Icons.family_restroom,
                    color: Color.fromARGB(255, 10, 10, 10)),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Family",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 9, 9, 9),
                          fontFamily: "medium",
                        ),
                      ),
                      Text(
                        widget.family,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: "medium",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          if (widget.habit != "")
            Row(
              children: [
                Icon(Icons.hourglass_bottom_outlined,
                    color: Color.fromARGB(255, 10, 10, 10)),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Habit",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 9, 9, 9),
                          fontFamily: "medium",
                        ),
                      ),
                      Text(
                        widget.habit,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: "medium",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          if (widget.smoking != "")
            Row(
              children: [
                Icon(Icons.smoking_rooms,
                    color: Color.fromARGB(255, 10, 10, 10)),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Smoking",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 9, 9, 9),
                          fontFamily: "medium",
                        ),
                      ),
                      Text(
                        widget.smoking,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: "medium",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          if (widget.drinking != "")
            Row(
              children: [
                Icon(Icons.local_drink_outlined,
                    color: Color.fromARGB(255, 10, 10, 10)),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Drinking",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 9, 9, 9),
                          fontFamily: "medium",
                        ),
                      ),
                      Text(
                        widget.drinking,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: "medium",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          if (love != null && love!.isNotEmpty)
            Row(
              children: [
                Icon(Icons.category, color: Color.fromARGB(255, 10, 10, 10)),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Love",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 9, 9, 9),
                          fontFamily: "medium",
                        ),
                      ),
                      Text(
                        love!.join(
                            ', '), // Use a comma and space as the delimiter
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: "medium",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          const SizedBox(height: 16),
          if (widget.description != "")
            InkWell(
              onTap: () {
                // Xử lý khi InkWell được nhấn
              },
              child: Row(
                children: const [
                  Icon(Icons.format_quote,
                      color: Color.fromARGB(255, 10, 10, 10)),
                  SizedBox(width: 10),
                  Text(
                    'About',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 5),
          Text(widget.description,
              style: TextStyle(
                  fontSize: 14, color: Colors.grey, fontFamily: "medium")),
        ],
      ),
    );
  }
}
