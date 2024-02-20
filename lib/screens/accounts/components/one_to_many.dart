import 'package:flutter/material.dart';
import 'package:hapind/model/drinking.dart';
import 'package:hapind/model/exercise.dart';
import 'package:hapind/model/expecting.dart';
import 'package:hapind/model/family.dart';
import 'package:hapind/model/habit.dart';
import 'package:hapind/model/hobby.dart';
import 'package:hapind/model/language.dart';
import 'package:hapind/model/literacy.dart';
import 'package:hapind/model/music.dart';
import 'package:hapind/model/pet.dart';
import 'package:hapind/model/singer.dart';
import 'package:hapind/model/purpose.dart';
import 'package:hapind/model/smoking.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/model/user_exercise.dart';
import 'package:hapind/model/user_expecting.dart';
import 'package:hapind/model/user_hobby.dart';
import 'package:hapind/model/user_language.dart';
import 'package:hapind/model/user_music.dart';
import 'package:hapind/model/user_pet.dart';
import 'package:hapind/model/user_singer.dart';
import 'package:hapind/model/work.dart';
import 'package:hapind/service/choice_service.dart';
import 'package:hapind/service/login_service.dart';
import 'package:hapind/service/token_service.dart';
import 'package:hapind/service/user_service.dart';

class OneToMany extends StatefulWidget {
  const OneToMany({Key? key, required this.folderName}) : super(key: key);
  final String folderName;

  @override
  State<OneToMany> createState() =>
      _OneToManyButtonState(folderName: folderName);
}

class _OneToManyButtonState extends State<OneToMany> {
  _OneToManyButtonState({required this.folderName});
  String folderName;
  ChoiceService _choiceService = ChoiceService();
  List<String?> filters = [];
  LoginService _loginService = LoginService();
  TokenService _tokenService = TokenService();
  UserService _userService = UserService();
  List<String> selectedFilters = [];
  User? user;

  void createFilters(List<String>? name) async {
    int? id = await _tokenService.getStoredUserId();
    user = await _loginService.getUser(id);
    switch (folderName) {
      case 'Music':
        if (name == null) {
          List<Music> drinkingList =
              (await _choiceService.getChoice(folderName)).cast<Music>();

          List<UserMusic> selectedMusics =
              (await _choiceService.getMultiChoice(id, folderName))
                  .cast<UserMusic>();

          filters = drinkingList.map((purpose) => purpose.name).toList();

          selectedFilters.addAll(
              selectedMusics.map((userMusic) => userMusic.music!.name!));
          print("selectedMusics+ $selectedMusics");
          print("drinkingList+ $drinkingList");
        } else {
          int? id = await _tokenService.getStoredUserId();
          _userService.updateMutlchoice(id, folderName.toLowerCase(), name);
        }
        break;
      case 'Singer':
        if (name == null) {
          List<Singer> drinkingList =
              (await _choiceService.getChoice(folderName)).cast<Singer>();

          List<UserSinger> selectedMusics =
              (await _choiceService.getMultiChoice(id, folderName))
                  .cast<UserSinger>();

          filters = drinkingList.map((purpose) => purpose.name).toList();

          selectedFilters.addAll(
              selectedMusics.map((userMusic) => userMusic.singer!.name!));
          print("selectedMusics+ $selectedMusics");
          print("drinkingList+ $drinkingList");
        } else {
          int? id = await _tokenService.getStoredUserId();
          _userService.updateMutlchoice(id, folderName.toLowerCase(), name);
        }
        break;
      case 'Pet':
        if (name == null) {
          List<Pet> drinkingList =
              (await _choiceService.getChoice(folderName)).cast<Pet>();

          List<UserPet> selectedMusics =
              (await _choiceService.getMultiChoice(id, folderName))
                  .cast<UserPet>();

          filters = drinkingList.map((purpose) => purpose.name).toList();

          selectedFilters
              .addAll(selectedMusics.map((userMusic) => userMusic.pet!.name!));
        } else {
          int? id = await _tokenService.getStoredUserId();
          _userService.updateMutlchoice(id, folderName.toLowerCase(), name);
        }
        break;
      case 'Language':
        if (name == null) {
          List<Language> drinkingList =
              (await _choiceService.getChoice(folderName)).cast<Language>();

          List<UserLanguage> selectedMusics =
              (await _choiceService.getMultiChoice(id, folderName))
                  .cast<UserLanguage>();

          filters = drinkingList.map((purpose) => purpose.name).toList();

          selectedFilters.addAll(
              selectedMusics.map((userMusic) => userMusic.language!.name!));
        } else {
          int? id = await _tokenService.getStoredUserId();
          _userService.updateMutlchoice(id, folderName.toLowerCase(), name);
        }
        break;
      case 'Hobby':
        if (name == null) {
          List<Hobby> drinkingList =
              (await _choiceService.getChoice(folderName)).cast<Hobby>();

          List<UserHobby> selectedMusics =
              (await _choiceService.getMultiChoice(id, folderName))
                  .cast<UserHobby>();

          filters = drinkingList.map((purpose) => purpose.name).toList();

          selectedFilters.addAll(
              selectedMusics.map((userMusic) => userMusic.hobby!.name!));
        } else {
          int? id = await _tokenService.getStoredUserId();
          _userService.updateMutlchoice(id, folderName.toLowerCase(), name);
        }
        break;
      case 'Exercise':
        if (name == null) {
          List<Exercise> drinkingList =
              (await _choiceService.getChoice(folderName)).cast<Exercise>();

          List<UserExercise> selectedMusics =
              (await _choiceService.getMultiChoice(id, folderName))
                  .cast<UserExercise>();

          filters = drinkingList.map((purpose) => purpose.name).toList();

          selectedFilters.addAll(
              selectedMusics.map((userMusic) => userMusic.exercise!.name!));
        } else {
          int? id = await _tokenService.getStoredUserId();
          _userService.updateMutlchoice(id, folderName.toLowerCase(), name);
        }
        break;
      case 'Expecting':
        if (name == null) {
          List<Expecting> drinkingList =
              (await _choiceService.getChoice(folderName)).cast<Expecting>();

          List<UserExpecting> selectedMusics =
              (await _choiceService.getMultiChoice(id, folderName))
                  .cast<UserExpecting>();

          filters = drinkingList.map((purpose) => purpose.name).toList();

          selectedFilters.addAll(
              selectedMusics.map((userMusic) => userMusic.expecting!.name!));
        } else {
          int? id = await _tokenService.getStoredUserId();
          _userService.updateMutlchoice(id, folderName.toLowerCase(), name);
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
                        'Select Filters',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: filters.map((filter) {
                          return FilterChip(
                            label: Text(filter!),
                            selected: selectedFilters.contains(filter),
                            onSelected: (bool selected) {
                              setState(() {
                                if (selected) {
                                  selectedFilters.add(filter);
                                } else {
                                  selectedFilters.remove(filter);
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
                          createFilters(selectedFilters);
                          print(selectedFilters);
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
