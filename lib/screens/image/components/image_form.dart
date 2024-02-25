import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hapind/components/default_button.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/model/user_image.dart';
import 'package:hapind/model/user_register.dart';
import 'package:hapind/screens/distance/distance_screen.dart';
import 'package:hapind/screens/purpose/purpose_screen.dart';
import 'package:hapind/screens/register_success/register_success_screen.dart';
import 'package:hapind/screens/status/status_screen.dart';
import 'package:hapind/service/token_service.dart';
import 'package:hapind/service/upload_service.dart';
import 'package:quickalert/quickalert.dart';
import 'package:image_picker/image_picker.dart';

class CompleteImageForm extends StatefulWidget {
  final User? user;

  const CompleteImageForm({Key? key, required this.user}) : super(key: key);

  @override
  _CompleteImageFormState createState() => _CompleteImageFormState(user: user);
}

class _CompleteImageFormState extends State<CompleteImageForm> {
  var _isSelected = false;
  double availableScreenWidth = 0;
  List<String> imageUrls = List.generate(6, (index) => "");
  String? selectedImage;
  final User? user;
  _CompleteImageFormState({required this.user});
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? image;
  List<String> evidens = [];
  List<UserImage>? userImages;
  TokenService _tokenService = TokenService();
  UploadService _uploadService = UploadService();
  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    await getUserImage();
  }

  Future<void> getUserImage() async {
    userImages = await _uploadService.getUserImage(user?.id);
    setState(() {
      for (int i = 0; i <= imageUrls.length; i++) {
        imageUrls[i] = userImages != null && i <= userImages!.length
            ? userImages![i].imagePath ?? ''
            : '';
        print(imageUrls[i]);
        //imageUrls =List.generate(userImages!.length?);
      }
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Image')),
  //     body: Form(
  //       key: _formKey,
  //       child: Column(
  //         children: <Widget>[
  //           FilterChip(
  //             selected: _isSelected,
  //             label: const Text('Male'),
  //             onSelected: (_) {
  //               _isSelected = _;
  //               setState(() {});
  //             },
  //           ),
  //           FilterChip(
  //             selected: _isSelected,
  //             label: const Text('Female'),
  //             onSelected: (_) {
  //               _isSelected = _;
  //               setState(() {});
  //             },
  //           ),
  //           DefaultButton(
  //             text: "Continue",
  //             press: () {
  //               if (_formKey.currentState!.validate()) {
  //                 Navigator.pushNamed(context, CompleteStatusScreen.routeName);
  //               }
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    availableScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text('Images Upload')),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
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
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  // Do something with the selected Image
                  print("Selected Image: $selectedImage");
                  Navigator.pushNamed(context, RegisterSuccessScreen.routeName);
                  //user.image=selectedImage;
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) =>
                  //           CompleteDistanceScreen(user: user),
                  //     ));
                  //Navigator.pushNamed(context, CompleteDistanceScreen.routeName);
                } else {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.warning,
                    text: "You must select Image!",
                    confirmBtnText: 'OK',
                    confirmBtnColor: Colors.redAccent,
                    onConfirmBtnTap: () {
                      Navigator.pop(context); // Dismiss the alert
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Column buildFileColumn(int index) {
    if (index < 0 || index >= imageUrls.length) {
      return Column(); // Return an empty column if index is out of bounds
    }

    String imageUrl = imageUrls[index];
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
              if (imageUrl != null && imageUrl.isNotEmpty)
                Positioned.fill(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                )
              else
                Positioned.fill(
                  child: Image.network(
                    "https://res.cloudinary.com/dmkw4f8iw/image/upload/v1708590938/Screenshot_2024-02-22_153511_zm3nse.png",
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
                      // int? userId = await _tokenService.getStoredUserId();

                      // print("is $userImageId");
                      // await _uploadService.addOrUpdateUserImage(
                      //   UserImage(
                      //     id: userImageId,
                      //     user: null,
                      //     imagePath: uploadedImageUrl,
                      //   ),
                      //   user?.id,
                      // );
                      // setState(() {
                      //   if (index < imageUrls.length) {
                      //     imageUrls[index] = uploadedImageUrl;
                      //   }
                      // });
                      // setState(() async {
                      //   if (index < imageUrls.length) {
                      //      imageUrls[index] = uploadedImageUrl;
                      //     if (!evidens.contains(uploadedImageUrl)) {
                      //       evidens.add(uploadedImageUrl);
                      //     }
                      //   }
                      // });
                      setState(() {
                        // Find the first empty slot in the imageUrls list
                        int emptyIndex =
                            imageUrls.indexWhere((url) => url.isEmpty);
                        if (emptyIndex != -1) {
                          imageUrls[emptyIndex] = uploadedImageUrl;
                          if (!evidens.contains(uploadedImageUrl)) {
                            evidens.add(uploadedImageUrl);
                          }
                        }
                      });
                      await _uploadService.addOrUpdateUserImage(
                        UserImage(
                          id: 0, // Assuming 0 for a new UserImage
                          user: null,
                          imagePath: uploadedImageUrl,
                        ),
                        user?.id,
                      );
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
