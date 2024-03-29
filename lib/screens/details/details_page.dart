import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:hapind/screens/chat/chats_screen.dart';

class DetailsPage extends StatefulWidget {
  final String name, gender, city, state, country, email, age, phone;

  const DetailsPage({
    Key? key,
    required this.name,
    required this.age,
    required this.gender,
    required this.city,
    required this.state,
    required this.country,
    required this.phone,
    required this.email,
    // required this.avatar,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/lpckjnidqulkymh6r1da"),
                fit: BoxFit.cover),
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
                      icon: const Icon(Icons.favorite_border,
                          color: Color.fromARGB(255, 205, 17, 17)),
                      onPressed: () {}),
                  IconButton(
                      icon: const Icon(Icons.share,
                          color: Color.fromARGB(255, 195, 11, 11)),
                      onPressed: () {}),
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
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: const [
                Icon(Icons.search, color: Color.fromARGB(255, 10, 10, 10)),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Search",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 9, 9, 9),
                          fontFamily: "medium",
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Hẹn Hò Với Tín Đêm Nay",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: "medium",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(0.0),
            child: Text(
              widget.name + ", " + widget.age,
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
                    widget.gender == 'male' ? Icons.male : Icons.female,
                    color: widget.gender == 'male' ? Colors.blue : Colors.pink,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  widget.gender == 'male' ? 'Male' : 'Female',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Icon(Icons.place, color: Color.fromARGB(255, 10, 10, 10)),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Place",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 9, 9, 9),
                        fontFamily: "medium",
                      ),
                    ),
                    Text(
                      "1 Km",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontFamily: "medium",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: const [
              Icon(Icons.school, color: Color.fromARGB(255, 10, 10, 10)),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "School",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 9, 9, 9),
                        fontFamily: "medium",
                      ),
                    ),
                    Text(
                      "Developer",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontFamily: "medium",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: const [
              Icon(Icons.category_outlined,
                  color: Color.fromARGB(255, 5, 5, 5)),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Music, Traveling, Netflix",
                  style: TextStyle(
                      fontSize: 16, color: Colors.grey, fontFamily: "medium"),
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
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
          const Text(
              'Hello everyone, this is john and this is details for testing. this is about dummy details. Vivera quies vivamu mi in turple. Sit Bandiya dofa cras semper phasellus sed ulthrieds. no where over the horiiszon. this is dummy text.',
              style: TextStyle(
                  fontSize: 14, color: Colors.grey, fontFamily: "medium")),
        ],
      ),
    );
  }
}
