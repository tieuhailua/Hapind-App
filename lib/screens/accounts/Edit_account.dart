import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hapind/model/user_image.dart';
import 'package:hapind/screens/accounts/components/%20family_buttton.dart';
import 'package:hapind/screens/accounts/components/%20purpose_button.dart';
import 'package:hapind/screens/accounts/components/Exercise_button.dart';
import 'package:hapind/screens/accounts/components/Gender_button.dart';
import 'package:hapind/screens/accounts/components/Work_button.dart';
import 'package:hapind/screens/accounts/components/habit_button.dart';
import 'package:hapind/screens/accounts/components/hobby_button.dart';
import 'package:hapind/screens/accounts/components/language_button.dart';
import 'package:hapind/screens/accounts/components/literacy_button.dart';
import 'package:hapind/screens/accounts/components/music_button.dart';
import 'package:hapind/screens/accounts/components/one_to_many.dart';
import 'package:hapind/screens/accounts/components/one_to_one_button.dart';
import 'package:hapind/screens/accounts/components/one_to_one_button2.dart';
import 'package:hapind/screens/accounts/components/pet_button.dart';
import 'package:hapind/screens/accounts/components/singer_button.dart';
import 'package:hapind/screens/accounts/components/smoking_button.dart';
import 'package:hapind/screens/accounts/components/test_button.dart';
import 'package:hapind/service/login_service.dart';
import 'package:hapind/service/token_service.dart';
import 'package:hapind/service/upload_service.dart';
import 'package:image_picker/image_picker.dart';

class MyAccount extends StatefulWidget {
  static String routeName = "/account";
  final String folderName;
  const MyAccount({Key? key, required this.folderName}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccount();
}

class _MyAccount extends State<MyAccount> {
  double availableScreenWidth = 0;
  List<String> imageUrls = List.generate(6, (index) => "");
  int selectedIndex = 0;
  String _gender = "Gender";
  UploadService _uploadService = UploadService();
  TokenService _tokenService = TokenService();
  LoginService _loginService = LoginService();
  List<UserImage>? userImages;
  bool _loading = true;

  callback(key, item) {
    setState(() async {
      print("===== ${item}");
      print(await _tokenService.readUserId());
      _gender = item;
    });
  }

  String _avatarUrl =
      //"https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/e44w6saipufr4qhbtesw";
      "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/lpckjnidqulkymh6r1da";

  // @override
  // void initState() {
  //   super.initState();
  //   print('====== ${widget.folderName}');
  //   Future.delayed(Duration.zero).then((_) {
  //     initializeData();
  //   });
  //   setState(() async {
  //     print(await _tokenService.readUserId());
  //   });
  // }

  // Future<void> initializeData() async {
  //   await getUserImage();
  // }
  @override
  void initState() {
    super.initState();
    print('====== ${widget.folderName}');
    Future.delayed(Duration.zero).then((_) {
      initializeData();
    });

    // Create a FocusNode
    FocusNode textFocusNode = FocusNode();

    // Request focus after a delay
    Future.delayed(Duration.zero).then((_) {
      FocusScope.of(context).requestFocus(textFocusNode);
    });
  }

  Future<void> initializeData() async {
    await getUserImage();
  }

  Future<void> getUserImage() async {
    int? userId = await _tokenService.getStoredUserId();
    ;
    print(userId);
    userImages = await _uploadService.getUserImage(userId);
    setState(() async {
      for (int i = 0; i <= imageUrls.length; i++) {
        imageUrls[i] = userImages != null && i <= userImages!.length
            ? userImages![i].imagePath ?? ''
            : '';
        print(imageUrls[i]);
        _loading = false;
        //imageUrls =List.generate(userImages!.length?);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    availableScreenWidth = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile", style: TextStyle(color: Colors.orange)),
      ),
      backgroundColor: Colors.grey[100],
      body: Column(children: [
        // Header Section
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(25),
            children: [
              const Text(
                "Images Uploads",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  buildFileColumn(0),
                  SizedBox(
                    width: availableScreenWidth * .03,
                  ),
                  buildFileColumn(1),
                  SizedBox(
                    width: availableScreenWidth * .03,
                  ),
                  buildFileColumn(2),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  buildFileColumn(3),
                  SizedBox(
                    width: availableScreenWidth * .03,
                  ),
                  buildFileColumn(4),
                  SizedBox(
                    width: availableScreenWidth * .03,
                  ),
                  buildFileColumn(5),
                ],
              ),
              const Divider(
                height: 60,
              ),
              // số ít
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "My preference ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              OneToOne2(
                folderName: "Description",
              ),
              const SizedBox(
                height: 10,
              ),
              OneToOne2(
                folderName: "Address",
              ),
              SizedBox(
                height: 10,
              ),
              OneToOne2(
                folderName: "Height",
              ),
              SizedBox(
                height: 10,
              ),
              OneToOne2(
                folderName: "Weight",
              ),
              SizedBox(
                height: 10,
              ),
              OneToOne2(
                folderName: "Gender",
              ),
              SizedBox(
                height: 10,
              ),
              OneToOne2(
                folderName: "Finding",
              ),
              SizedBox(
                height: 10,
              ),
              OneToOne2(
                folderName: "Purpose",
              ),
              SizedBox(
                height: 10,
              ),
              OneToOne2(
                folderName: "Drinking",
              ),
              SizedBox(
                height: 10,
              ),
              OneToOne2(
                folderName: "Smoking",
              ),
              SizedBox(
                height: 10,
              ),
              OneToOne2(
                folderName: "Habit",
              ),
              SizedBox(
                height: 10,
              ),
              OneToOne2(
                folderName: "Family",
              ),
              SizedBox(
                height: 10,
              ),
              OneToOne2(
                folderName: "Literacy",
              ),
              SizedBox(
                height: 10,
              ),
              OneToOne2(
                folderName: "Work",
              ),
              SizedBox(
                height: 10,
              ),
              OneToOne2(
                folderName: "Zodiac",
              ),
              //số nhiều
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "My preference số nhiều ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              OneToMany(
                folderName: "Music",
              ),
              SizedBox(
                height: 10,
              ),
              OneToMany(
                folderName: "Singer",
              ),
              SizedBox(
                height: 10,
              ),
              OneToMany(folderName: 'Pet'),
              SizedBox(
                height: 10,
              ),
              OneToMany(folderName: "Language"),
              SizedBox(
                height: 10,
              ),
              OneToMany(folderName: "Hobby"),
              SizedBox(
                height: 10,
              ),
              OneToMany(folderName: "Exercise"),
              SizedBox(
                height: 10,
              ),
              OneToMany(folderName: "Expecting"),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        )
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildProjectRow(String folderName) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 200,
              color: const Color.fromARGB(255, 244, 243, 240),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Modal BottomSheet'),
                    ElevatedButton(
                      child: const Text('Close BottomSheet'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 65,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Text(
                folderName,
                style: const TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 224, 224, 223)),
              )
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
            ),
          )
        ]),
      ),
    );
  }

  // Column buildFileColumn() {
  //   return Column(
  //     children: [
  //       Container(
  //           width: availableScreenWidth * .31,
  //           decoration: BoxDecoration(
  //               color: Colors.grey.shade200,
  //               borderRadius: BorderRadius.circular(20)),
  //           padding: const EdgeInsets.all(38),
  //           height: 150,
  //           child: Align(
  //             alignment: Alignment.bottomRight,
  //             child: IconButton(
  //               icon: Icon(Icons.add_circle),
  //               color: Theme.of(context).primaryColor,
  //               onPressed: () async {
  //                 final pickedFile =
  //                     await ImagePicker().pickImage(source: ImageSource.gallery);
  //                 if (pickedFile != null) {
  //                   // You have the picked image file, now upload it to Cloudinary
  //                   _uploadService.uploadToCloudinary(File(pickedFile.path));
  //                 }
  //               },
  //             ),
  //           )),
  //     ],
  //   );
  // }

  // Column buildFileColumn(int index) {
  //   if (index < 0 || index >= imageUrls.length) {
  //     return Column(); // Return an empty column if index is out of bounds
  //   }

  //   String imageUrl = imageUrls[index];
  //   int userImageId = userImages != null && index <= userImages!.length
  //       ? userImages![index].id ?? 0
  //       : 0;
  //   return Column(
  //     children: [
  //       Container(
  //         width: availableScreenWidth * .31,
  //         decoration: BoxDecoration(
  //           color: Colors.grey.shade200,
  //           borderRadius: BorderRadius.circular(20),
  //         ),
  //         padding:
  //             const EdgeInsets.all(8), // Reduced padding for image visibility
  //         height: 150,
  //         child: Stack(
  //           children: [
  //             // Display the uploaded image if available
  //             if (imageUrl != null)
  //               Positioned.fill(
  //                 child: Image.network(
  //                   imageUrl,
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),

  //             Align(
  //               alignment: Alignment.bottomRight,
  //               child: IconButton(
  //                 icon: Icon(Icons.add_circle),
  //                 color: Theme.of(context).primaryColor,
  //                 onPressed: () async {
  //                   final pickedFile = await ImagePicker()
  //                       .pickImage(source: ImageSource.gallery);
  //                   if (pickedFile != null) {
  //                     String uploadedImageUrl = await _uploadService
  //                         .uploadToCloudinary(File(pickedFile.path));
  //                     int? userId = await _tokenService.getStoredUserId();
  //                     print("is $userImageId");
  //                     await _uploadService.addOrUpdateUserImage(
  //                         UserImage(
  //                           id: userImageId,
  //                           user: null,
  //                           imagePath: uploadedImageUrl,
  //                         ),
  //                         userId);
  //                     setState(() {
  //                       imageUrls[index] = uploadedImageUrl;
  //                     });
  //                   }
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
  Column buildFileColumn(int index) {
    if (index < 0 || index >= imageUrls.length) {
      return Column(); // Return an empty column if index is out of bounds
    }

    //String imageUrl = imageUrls[index];
    String? imageUrl = imageUrls[index];

    int userImageId = userImages != null && index < userImages!.length
        ? userImages![index].id ?? 0
        : 0;

    return Column(
      children: [
        Container(
          width: availableScreenWidth * .31,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(8),
          height: 150,
          child: Stack(
            children: [
              if (_loading)
                Positioned.fill(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/loading.jpg'),
                  ),
                )
              else
                Positioned.fill(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(Icons.add_circle),
                  color: Theme.of(context).primaryColor,
                  onPressed: () async {
                    final pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      String uploadedImageUrl = await _uploadService
                          .uploadToCloudinary(File(pickedFile.path));
                      int? userId = await _tokenService.getStoredUserId();
                      print("is $userImageId");
                      await _uploadService.addOrUpdateUserImage(
                        UserImage(
                          id: userImageId,
                          user: null,
                          imagePath: uploadedImageUrl,
                        ),
                        userId,
                      );
                      initializeData();
                      setState(() {
                        if (index < imageUrls.length) {
                          imageUrls[index] = uploadedImageUrl;
                        }
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
