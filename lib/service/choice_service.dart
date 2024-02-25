import 'dart:convert';

import 'package:hapind/model/choice.dart';
import 'package:hapind/model/drinking.dart';
import 'package:hapind/model/family.dart';
import 'package:hapind/model/habit.dart';
import 'package:hapind/model/pet.dart';
import 'package:hapind/model/hobby.dart';
import 'package:hapind/model/language.dart';
import 'package:hapind/model/exercise.dart';
import 'package:hapind/model/expecting.dart';
import 'package:hapind/model/literacy.dart';
import 'package:hapind/model/music.dart';
import 'package:hapind/model/purpose.dart';
import 'package:hapind/model/reason.dart';
import 'package:hapind/model/singer.dart';
import 'package:hapind/model/smoking.dart';
import 'package:hapind/model/user_exercise.dart';
import 'package:hapind/model/user_expecting.dart';
import 'package:hapind/model/user_hobby.dart';
import 'package:hapind/model/user_language.dart';
import 'package:hapind/model/user_music.dart';
import 'package:hapind/model/user_pet.dart';
import 'package:hapind/model/user_singer.dart';
import 'package:hapind/model/work.dart';
import 'package:hapind/service/api/base_api.dart';
import 'package:http/http.dart' as http;

class ChoiceService extends BaseApi {
  late String getPurposeChoiceUrl = url + "/api/mobile/getPurposeChoice";
  late String getChoiceUrl = url + "/api/mobile/getChoice/";
  late String getMultiChoiceUrl = url + "/api/mobile/getMultiChoice/";
  late String getReasonUrl = url + "/api/mobile/getReason";

  Future<List<Purpose>> getPurposeChoice() async {
    try {
      final response = await http.get(
        Uri.parse('$getPurposeChoiceUrl'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        print(response.body);
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Purpose> purposes = jsonList
            .map((json) => Purpose.fromJson(json as Map<String, dynamic>))
            .toList();
        return purposes;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<List<Reason>> getReasonChoice() async {
    try {
      final response = await http.get(
        Uri.parse('$getReasonUrl'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        print(response.body);
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Reason> purposes = jsonList
            .map((json) => Reason.fromJson(json as Map<String, dynamic>))
            .toList();
        return purposes;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<List<dynamic>> getChoice(String filter) async {
    try {
      final response = await http.get(
        Uri.parse('$getChoiceUrl$filter'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        print(response.body);
        final List<dynamic> jsonList = jsonDecode(response.body);
        List<dynamic> resultList;
        switch (filter) {
          case 'Drinking':
            resultList = jsonList
                .map((json) => Drinking.fromJson(json as Map<String, dynamic>))
                .toList();
            break;
          case 'Smoking':
            resultList = jsonList
                .map((json) => Smoking.fromJson(json as Map<String, dynamic>))
                .toList();
            break;
          case 'Habit':
            resultList = jsonList
                .map((json) => Habit.fromJson(json as Map<String, dynamic>))
                .toList();
            break;
          case 'Family':
            resultList = jsonList
                .map((json) => Family.fromJson(json as Map<String, dynamic>))
                .toList();
            break;
          case 'Literacy':
            resultList = jsonList
                .map((json) => Literacy.fromJson(json as Map<String, dynamic>))
                .toList();
            break;
          case 'Work':
            resultList = jsonList
                .map((json) => Work.fromJson(json as Map<String, dynamic>))
                .toList();
            break;
          case 'Music':
            resultList = jsonList
                .map((json) => Music.fromJson(json as Map<String, dynamic>))
                .toList();
            break;
          case 'Singer':
            resultList = jsonList
                .map((json) => Singer.fromJson(json as Map<String, dynamic>))
                .toList();
            break;
            case 'Pet':
            resultList = jsonList
                .map((json) => Pet.fromJson(json as Map<String, dynamic>))
                .toList();
            break;
            case 'Hobby':
            resultList = jsonList
                .map((json) => Hobby.fromJson(json as Map<String, dynamic>))
                .toList();
            break;
            case 'Expecting':
            resultList = jsonList
                .map((json) => Expecting.fromJson(json as Map<String, dynamic>))
                .toList();
            break;
            case 'Exercise':
            resultList = jsonList
                .map((json) => Exercise.fromJson(json as Map<String, dynamic>))
                .toList();
            break;
            case 'Language':
            resultList = jsonList
                .map((json) => Language.fromJson(json as Map<String, dynamic>))
                .toList();
            break;
          default:
            resultList = [];
            break;
        }
        return resultList;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<List<dynamic>> getMultiChoice(int? userId, String filter) async {
    try {
      final response = await http.get(
        Uri.parse('$getMultiChoiceUrl$userId/$filter'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        print(response.body);
        final List<dynamic> jsonList = jsonDecode(response.body);
        List<dynamic> resultList;
        switch (filter) {
          case 'Music':
            resultList = jsonList
                .map((json) => UserMusic.fromJson(json as Map<String, dynamic>))
                .toList();
            break;
          case 'Singer':
            resultList = jsonList
                .map((json) => UserSinger.fromJson(json as Map<String, dynamic>))
                .toList();
            break;
          case 'Pet':
            resultList = jsonList
                .map((json) => UserPet.fromJson(json as Map<String, dynamic>))
                .toList();
            break;
          case 'Language':
            resultList = jsonList
                .map((json) => UserLanguage.fromJson(json as Map<String, dynamic>))
                .toList();
            break;
          case 'Hobby':
            resultList = jsonList
                .map((json) => UserHobby.fromJson(json as Map<String, dynamic>))
                .toList();
            break;
          case 'Exercise':
            resultList = jsonList
                .map((json) => UserExercise.fromJson(json as Map<String, dynamic>))
                .toList();
            break;
          case 'Expecting':
            resultList = jsonList
                .map((json) => UserExpecting.fromJson(json as Map<String, dynamic>))
                .toList();
            break;
          default:
            resultList = [];
            break;
        }
        return resultList;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  // Future<Purpose?>? getPurposeChoice() async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse('$getPurposeChoiceUrl'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //     );
  //     print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       print(Purpose.fromJson(
  //           jsonDecode(response.body) as Map<String, dynamic>));
  //       return Purpose.fromJson(
  //           jsonDecode(response.body) as Map<String, dynamic>);
  //     } else {
  //       return null;
  //     }
  //   } catch (error) {
  //     return null;
  //   }
  // }

//     Future<List<Choice>?> getPurposeChoice() async {
//   try {
//     final response = await http.get(
//       Uri.parse('$getPurposeChoiceUrl'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );

//     if (response.statusCode == 200) {
//       print(response.body);
//       final List<dynamic> jsonList = jsonDecode(response.body);
//       final List<Choice> purposes = jsonList
//           .map((json) => Choice.fromJson(json as Map<String, dynamic>))
//           .toList();
//       //print(purposes);
//       return purposes;
//     } else {
//       return null;
//     }
//   } catch (error) {
//     return null;
//   }
// }
}
