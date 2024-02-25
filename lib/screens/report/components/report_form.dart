import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hapind/components/default_button.dart';
import 'package:hapind/model/reason.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/model/user_image.dart';
import 'package:hapind/model/user_register.dart';
import 'package:hapind/screens/distance/distance_screen.dart';
import 'package:hapind/screens/purpose/purpose_screen.dart';
import 'package:hapind/screens/register_success/register_success_screen.dart';
import 'package:hapind/screens/report/report_form_screen.dart';
import 'package:hapind/screens/report_success/report_success_screen.dart';
import 'package:hapind/screens/status/status_screen.dart';
import 'package:hapind/service/choice_service.dart';
import 'package:hapind/service/token_service.dart';
import 'package:hapind/service/upload_service.dart';
import 'package:hapind/service/user_service.dart';
import 'package:quickalert/quickalert.dart';
import 'package:image_picker/image_picker.dart';

class ReportForm extends StatefulWidget {
  final int reported;

  const ReportForm({Key? key, required this.reported}) : super(key: key);

  @override
  _ReportFormState createState() => _ReportFormState(reported: reported);
}

class _ReportFormState extends State<ReportForm> {
  var _isSelected = false;
  double availableScreenWidth = 0;
  List<String> imageUrls = List.generate(3, (index) => "");
  String? selectedImage;
  final int reported;
  _ReportFormState({required this.reported});
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? image;
  List<UserImage>? userImages;
  TokenService _tokenService = TokenService();
  UploadService _uploadService = UploadService();
  ChoiceService _choiceService = ChoiceService();
  UserService _userService = UserService();
  TextEditingController descriptionController = TextEditingController();
  String dropdownValue = 'Inappropriate Behavior';
  int? reasonId;
  List<Reason> reasons = [];
  //List<String>? evidens;
  List<String> evidens = [];

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

  // @override
  // void initState() {
  //   super.initState();
  //   initializeData();
  //   // Future.delayed(Duration.zero).then((_) {
  //   //   initializeData();
  //   // });
  //   //initializeData();
  // }
  @override
  void initState() {
    super.initState();
    initializeData().then((_) {
      setState(() {});
    });
  }

  Future<void> initializeData() async {
    reasons = await _choiceService.getReasonChoice();
    print(reasons);
  }

  // Future<void> getUserImage() async {
  //   userImages = await _uploadService.getUserImage(user?.id);
  //   setState(() {
  //     for (int i = 0; i <= imageUrls.length; i++) {
  //       imageUrls[i] = userImages != null && i <= userImages!.length
  //           ? userImages![i].imagePath ?? ''
  //           : '';
  //       print(imageUrls[i]);
  //       //imageUrls =List.generate(userImages!.length?);
  //     }
  //   });
  // }

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
      appBar: AppBar(title: const Text('Report Form')),
      body: SingleChildScrollView(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Evidence',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
            // const SizedBox(
            //   height: 15,
            // ),
            // Row(
            //   children: [
            //     buildFileColumn(3),
            //     SizedBox(
            //       width: availableScreenWidth * .03,
            //     ),
            //     buildFileColumn(4),
            //     SizedBox(
            //       width: availableScreenWidth * .03,
            //     ),
            //     buildFileColumn(5),
            //   ],
            // ),
            const Divider(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Reason',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildSelect(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     const Text('You want to see',
            //         style: TextStyle(color: Colors.red)),
            //     Center(
            //       child: _buildSelect(),
            //     ),
            //   ],
            // ),
            // DropdownButton<String>(
            //   value: dropdownValue,
            //   icon: const Icon(Icons.arrow_drop_down),
            //   elevation: 16,
            //   style: const TextStyle(color: Colors.black87),
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       dropdownValue = newValue!;
            //     });
            //   },
            //   items: <String>['Male', 'Female', 'Everyone']
            //       .map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),
            const Divider(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextFormField(
              controller: descriptionController,
              onChanged: (value) {
                setState(() {});
              },
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Enter description...',
                border: OutlineInputBorder(),
              ),
            ),
            DefaultButton(
              text: "Continue",
              press: () async {
                if (evidens != null && evidens.isNotEmpty) {
                  // Do something with the selected Image
                  int? reporterId = await _tokenService.getStoredUserId();
                  // print(reasonId);
                  // print(reporterId);
                  // print(reported);
                  // print(descriptionController.text);
                  // print(evidens);
                  _userService.report(reasonId, reported, reporterId,
                      descriptionController.text, evidens);
                  print("Selected Image: $selectedImage");
                  Navigator.pushNamed(context, ReportSuccessScreen.routeName);
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
                    text: "You must select evidens!",
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

  //  Widget _buildSelect() {
  //   return DropdownButton<String>(
  //     value: dropdownValue,
  //     icon: const Icon(Icons.arrow_drop_down),
  //     elevation: 16,
  //     style: const TextStyle(color: Colors.black87),
  //     onChanged: (String? newValue) {
  //       setState(() {
  //         dropdownValue = newValue!;
  //       });
  //     },
  //     items: <String>['Male', 'Female', 'Everyone']
  //         .map<DropdownMenuItem<String>>((String value) {
  //       return DropdownMenuItem<String>(
  //         value: value,
  //         child: Text(value),
  //       );
  //     }).toList(),
  //   );
  // }
  Widget _buildSelect() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: Colors.black87),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
        Reason selectedReason =
            reasons.firstWhere((reason) => reason.name == newValue);
        reasonId = selectedReason.id!;
      },
      items: reasons.map((Reason reason) {
        return DropdownMenuItem<String>(
          value: reason.name,
          child: Text(reason.name ?? ""),
        );
      }).toList(),
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
                      //int? userId = await _tokenService.getStoredUserId();
                      print("is $userImageId");
                      // setState(() {
                      //   if (index < imageUrls.length) {
                      //     imageUrls[index] = uploadedImageUrl;
                      //   }
                      // });
                      // setState(() {
                      //   if (index < imageUrls.length) {
                      //     imageUrls[index] = uploadedImageUrl;
                      //     if (evidens == null) {
                      //       evidens = List.generate(6, (index) => "");
                      //     }
                      //     evidens![index] = uploadedImageUrl;
                      //   }
                      // });
                      setState(() {
                        if (index < imageUrls.length) {
                          imageUrls[index] = uploadedImageUrl;
                          if (!evidens.contains(uploadedImageUrl)) {
                            evidens.add(uploadedImageUrl);
                          }
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
