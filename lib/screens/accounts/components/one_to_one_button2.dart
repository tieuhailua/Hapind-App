import 'package:flutter/material.dart';
import 'package:hapind/components/form_error.dart';
import 'package:hapind/model/drinking.dart';
import 'package:hapind/model/family.dart';
import 'package:hapind/model/habit.dart';
import 'package:hapind/model/literacy.dart';
import 'package:hapind/model/purpose.dart';
import 'package:hapind/model/smoking.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/model/work.dart';
import 'package:hapind/service/choice_service.dart';
import 'package:hapind/service/login_service.dart';
import 'package:hapind/service/token_service.dart';
import 'package:hapind/service/user_service.dart';
import 'package:quickalert/quickalert.dart';

class OneToOne2 extends StatefulWidget {
  const OneToOne2({Key? key, required this.folderName}) : super(key: key);
  final String folderName;

  @override
  State<OneToOne2> createState() =>
      _OneToOne2ButtonState(folderName: folderName);
}

class _OneToOne2ButtonState extends State<OneToOne2> {
  _OneToOne2ButtonState({required this.folderName});
  String folderName;
  ChoiceService _choiceService = ChoiceService();
  List<String?> filters = [];
  LoginService _loginService = LoginService();
  TokenService _tokenService = TokenService();
  UserService _userService = UserService();
  List<String> selectedFilters = [];
  User? user;
  TextEditingController addressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  List<String> errorMessage = [];
  //FocusNode _heightFocus = FocusNode();

  void createFilters(String? name) async {
    int? id = await _tokenService.getStoredUserId();
    user = await _loginService.getUser(id);
    switch (folderName) {
      case 'Finding':
        if (name == null) {
          filters = ["Male", "Female", "Everyone"];
          selectedFilters.add(user!.finding!);
        } else {
          _userService.updateUserPurpose(id, name);
        }
        break;
      case 'Description':
        if (name == null) {
          filters = [""];
          descriptionController.text = user!.description!;
          selectedFilters.add(user!.description!);
        } else {
          // Change the format to "des" + Value
          String updatedName = "des" + Uri.encodeComponent(name);
          _userService.updateUserPurpose(id, updatedName);
          print(updatedName);
        }
        break;
      case 'Address':
        if (name == null) {
          filters = [""];
          addressController.text = user!.address!;
          selectedFilters.add(user!.address!);
        } else {
          // Change the format to "adr" + Value
          String updatedName = "des" + Uri.encodeComponent(name);
          _userService.updateUserPurpose(id, updatedName);
          print(updatedName);
        }
        break;
      case 'Height':
        if (name == null ||
            int.parse(heightController.text) <= 50 ||
            int.parse(heightController.text) >= 300) {
          //errorMessage.add("Height must be between 50 and 300.");
          filters = [""];
          heightController.text = user!.height.toString();
          selectedFilters.add(user!.height!.toString());
          if (int.parse(heightController.text) <= 50 ||
              int.parse(heightController.text) >= 300) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  ("Cannot update Height must be between 50 and 300."),
                ),
              ),
            );
          }
        } else {
          errorMessage.remove("Height must be between 50 and 300.");
          errorMessage.remove("Weight must be between 30 and 250.");
          String updatedName = "$folderName is: $name";
          _userService.updateUserPurpose(id, updatedName);
        }
        break;
      case 'Weight':
        if (name == null ||
            int.parse(weightController.text) <= 30 ||
            int.parse(weightController.text) >= 250) {
          ///errorMessage.add("Weight must be between 30 and 250.");
          filters = [""];
          weightController.text = user!.weight.toString();
          selectedFilters.add(user!.weight!.toString());
          if (int.parse(weightController.text) <= 30 ||
              int.parse(weightController.text) >= 250) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  ("Cannot update Weight must be between 30 and 250."),
                ),
              ),
            );
          }
        } else {
          errorMessage.remove("Height must be between 50 and 300.");
          errorMessage.remove("Weight must be between 30 and 250.");
          String updatedName = "$folderName is: $name";
          _userService.updateUserPurpose(id, updatedName);
        }
        break;
      // case 'Weight':
      //   int? enteredWeight = int.tryParse(name!);
      //   if (enteredWeight == null ||
      //       enteredWeight <= 30 ||
      //       enteredWeight >= 250) {
      //     errorMessage.add("Weight must be between 30 and 250.");
      //     filters = [""];
      //     weightController.text = user!.weight.toString();
      //     selectedFilters.add(user!.weight!.toString());
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(
      //         content: Text(
      //           ("Cannot update Weight must be between 30 and 250."),
      //         ),
      //       ),
      //     );
      //   } else {
      //     errorMessage.add("Weight must be between 30 and 250.");

      //     String updatedName = "$folderName is: $enteredWeight";
      //     _userService.updateUserPurpose(id, updatedName);
      //   }
      //   break;
      case 'Gender':
        if (name == null) {
          filters = ["Male", "Female"];
          selectedFilters.add(user!.gender!);
        } else {
          print(name);
          _userService.updateUserPurpose(id, name);
        }
        break;
      case 'Drinking':
        if (name == null) {
          //List<Drinking> purposes = await _choiceService.getChoice(folderName);
          List<Drinking> drinkingList =
              (await _choiceService.getChoice(folderName)).cast<Drinking>();
          filters = drinkingList.map((purpose) => purpose.name).toList();
          selectedFilters.add(user!.drinking!.name!);
        } else {
          int? id = await _tokenService.getStoredUserId();
          _userService.updateUserPurpose(id, name);
        }
        break;
      case 'Smoking':
        if (name == null) {
          List<Smoking> purposes =
              (await _choiceService.getChoice(folderName)).cast<Smoking>();
          filters = purposes.map((purpose) => purpose.name).toList();
          selectedFilters.add(user!.smoking!.name!);
        } else {
          int? id = await _tokenService.getStoredUserId();
          _userService.updateUserPurpose(id, name);
        }
        break;
      case 'Habit':
        if (name == null) {
          List<Habit> purposes =
              (await _choiceService.getChoice(folderName)).cast<Habit>();
          filters = purposes.map((purpose) => purpose.name).toList();
          selectedFilters.add(user!.habit!.name!);
        } else {
          int? id = await _tokenService.getStoredUserId();
          _userService.updateUserPurpose(id, name);
        }
        break;
      case 'Literacy':
        if (name == null) {
          List<Literacy> purposes =
              (await _choiceService.getChoice(folderName)).cast<Literacy>();
          filters = purposes.map((purpose) => purpose.name).toList();
          selectedFilters.add(user!.literacy!.name!);
        } else {
          int? id = await _tokenService.getStoredUserId();
          _userService.updateUserPurpose(id, name);
        }
        break;
      case 'Work':
        if (name == null) {
          List<Work> purposes =
              (await _choiceService.getChoice(folderName)).cast<Work>();
          filters = purposes.map((purpose) => purpose.name).toList();
          selectedFilters.add(user!.work!.name!);
        } else {
          int? id = await _tokenService.getStoredUserId();
          _userService.updateUserPurpose(id, name);
        }
        break;
      case 'Family':
        if (name == null) {
          List<Family> purposes =
              (await _choiceService.getChoice(folderName)).cast<Family>();
          filters = purposes.map((purpose) => purpose.name).toList();
          selectedFilters.add(user!.family!.name!);
        } else {
          int? id = await _tokenService.getStoredUserId();
          _userService.updateUserPurpose(id, name);
        }
        break;
      case 'Purpose':
        if (name == null) {
          List<Purpose> purposes = await _choiceService.getPurposeChoice();
          filters = purposes.map((purpose) => purpose.name).toList();
          selectedFilters.add(user!.purpose!.name!);
        } else {
          int? id = await _tokenService.getStoredUserId();
          _userService.updateUserPurpose(id, name);
        }
        break;
      case 'Zodiac':
        if (name == null) {
          filters = [
            "Aries",
            "Taurus",
            "Gemini",
            "Cancer",
            "Leo",
            "Virgo",
            "Libra",
            "Scorpio",
            "Sagittarius",
            "Capricorn",
            "Aquarius",
            "Pisces"
          ];
          selectedFilters.add(user!.zodiac!);
        } else {
          _userService.updateUserPurpose(id, name);
        }
        break;

      default:
        filters = [];
    }
  }

  @override
  void initState() {
    super.initState();
    createFilters(null);
  }

  void clearErrorMessages() {
    setState(() {
      errorMessage.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final TextTheme textTheme = Theme.of(context).textTheme;

    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          builder: (BuildContext context) {
            return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: 400,
                width: 500,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        folderName,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      if (folderName == 'Description')
                        TextFormField(
                          controller: descriptionController,
                          onChanged: (value) {
                            setState(() {
                              selectedFilters.clear();
                              selectedFilters.add(value);
                            });
                          },
                          maxLines: 3, // Set the desired number of lines
                          decoration: InputDecoration(
                            hintText: 'Enter description...',
                            border: OutlineInputBorder(),
                          ),
                        )
                      else if (folderName == 'Address')
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: addressController,
                              onChanged: (value) {
                                setState(() {
                                  selectedFilters.clear();
                                  selectedFilters.add(value);
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter address...',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Address cannot be empty.";
                                }
                                return null; // Return null for no error
                              },
                            ),
                            FormError(errors: errorMessage),
                          ],
                        )
                      // else if (folderName == 'Address')
                      //   Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       TextFormField(
                      //         controller: addressController,
                      //         onChanged: (value) {
                      //           setState(() {
                      //             selectedFilters.clear();
                      //             selectedFilters.add(value);
                      //           });
                      //         },
                      //         decoration: InputDecoration(
                      //           hintText: 'Enter address...',
                      //           border: OutlineInputBorder(),
                      //         ),
                      //       ),
                      //       FormError(errors: errorMessage),
                      //     ],
                      //   )
                      else if (folderName == 'Height')
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: heightController,
                                onChanged: (value) {
                                  setState(() {
                                    selectedFilters.clear();
                                    selectedFilters.add(value);
                                  });
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Enter Height...',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              'cm',
                              style: TextStyle(
                                fontSize: 16.0,
                                color:
                                    Colors.grey, // You can customize the color
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      // else if (folderName == 'Height')
                      //   Row(
                      //     children: [
                      //       Expanded(
                      //         child: TextFormField(
                      //           controller: heightController,
                      //           onChanged: (value) {
                      //             setState(() {
                      //               selectedFilters.clear();
                      //               selectedFilters.add(value);
                      //             });
                      //           },
                      //           keyboardType: TextInputType.number,
                      //           decoration: InputDecoration(
                      //             hintText: 'Enter Height...',
                      //             border: OutlineInputBorder(),
                      //           ),
                      //           validator: (value) {
                      //             int? enteredHeight =
                      //                 int.tryParse(value ?? "");
                      //             if (enteredHeight == null ||
                      //                 enteredHeight <= 50 ||
                      //                 enteredHeight >= 300) {
                      //               return "Height must be between 50 and 300.";
                      //             }
                      //             return null; // Return null for no error
                      //           },
                      //         ),
                      //       ),
                      //       SizedBox(width: 10.0),
                      //       Text(
                      //         'cm',
                      //         style: TextStyle(
                      //           fontSize: 16.0,
                      //           color: Colors.grey,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ],
                      //   )
                      else if (folderName == 'Weight')
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: weightController,
                                onChanged: (value) {
                                  setState(() {
                                    selectedFilters.clear();
                                    selectedFilters.add(value);
                                  });
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Enter Weight...',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              'Kg',
                              style: TextStyle(
                                fontSize: 16.0,
                                color:
                                    Colors.grey, // You can customize the color
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      else
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: filters.map((filter) {
                            return FilterChip(
                              label: Text(filter!),
                              selected: selectedFilters.contains(filter),
                              onSelected: (bool selected) {
                                setState(() {
                                  if (selected && selectedFilters.length >= 1) {
                                    selectedFilters.clear();
                                    selectedFilters.add(filter);
                                  } else {
                                    selectedFilters.clear();
                                    selectedFilters.add(filter);
                                  }
                                });
                              },
                            );
                          }).toList(),
                        ),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        child: const Text('OK'),
                        onPressed: () {
                          // int? enteredWeight =
                          //     int.tryParse(weightController.text ?? "");
                          // int? enteredHeight =
                          //     int.tryParse(heightController.text ?? "");
                          // String? enteredAddress = addressController.text ?? "";
                          // if (enteredWeight == null ||
                          //     enteredWeight <= 30 ||
                          //     enteredWeight >= 250) {
                          //   QuickAlert.show(
                          //     context: context,
                          //     type: QuickAlertType.error,
                          //     text: "Weight must be between 30 and 250",
                          //     confirmBtnText: 'OK',
                          //     confirmBtnColor: Colors.redAccent,
                          //     onConfirmBtnTap: () {
                          //       Navigator.pop(context); // Dismiss the alert
                          //     },
                          //   );
                          // }
                          // if (enteredHeight == null ||
                          //     enteredHeight <= 50 ||
                          //     enteredHeight >= 300) {
                          //   QuickAlert.show(
                          //     context: context,
                          //     type: QuickAlertType.error,
                          //     text: "Height must be between 50 and 300.",
                          //     confirmBtnText: 'OK',
                          //     confirmBtnColor: Colors.redAccent,
                          //     onConfirmBtnTap: () {
                          //       Navigator.pop(context); // Dismiss the alert
                          //     },
                          //   );
                          // }
                          // if (enteredAddress == null) {
                          //   QuickAlert.show(
                          //     context: context,
                          //     type: QuickAlertType.error,
                          //     text: "Addres must not be null.",
                          //     confirmBtnText: 'OK',
                          //     confirmBtnColor: Colors.redAccent,
                          //     onConfirmBtnTap: () {
                          //       Navigator.pop(context);
                          //        // Dismiss the alert
                          //     },
                          //   );
                          // }
                          createFilters(selectedFilters[0]);
                          Navigator.pop(context);
                        },
                      ),
                    ]),
              );
            });
          },
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 238, 239, 239)),
        side: MaterialStateProperty.all<BorderSide>(
          // Đường viền của button
          BorderSide(
            color: Color.fromARGB(255, 215, 213, 213),
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 65,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                folderName,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 236, 82, 5)),
              )
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Color.fromARGB(255, 6, 6, 6),
            ),
          )
        ]),
      ),
    );
  }
}
