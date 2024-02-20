import 'dart:convert';

import 'package:hapind/model/matching.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/service/api/base_api.dart';
import 'package:hapind/service/token_service.dart';
import 'package:http/http.dart' as http;

class UserService extends BaseApi {
  late String getMatchingUserURL = url + "/api/mobile/getMatchingUser/";
  late String getChatUserURL = url + "/api/mobile/getChatUser/";
  late String updateUserURL = url + "/api/mobile/updateUser/";
  late String matchingURL = url + "/api/mobile/matching/";
  late String datingURL = url + "/api/mobile/dating/";

  TokenService _tokenService = TokenService();

  Future<List<User>>? getUserForMatching() async {
    try {
      int? id = await _tokenService.getStoredUserId();
      final response = await http.get(
        Uri.parse(getMatchingUserURL + "$id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic>? responseData = jsonDecode(response.body);
        if (responseData != null) {
          // Convert the list of dynamic to List<UserImage>
          List<User> userImages =
              responseData.map((data) => User.fromJson(data)).toList();
          return userImages;
        } else {
          print("Error: Response body is null or not a valid JSON object");
          throw Exception('Failed to create user3.');
        }
      }
    } catch (error) {
      throw error;
    }
    return [];
  }

  Future<List<User>>? getUserForChat() async {
    try {
      int? id = await _tokenService.getStoredUserId();
      final response = await http.get(
        Uri.parse(getChatUserURL + "$id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic>? responseData = jsonDecode(response.body);
        if (responseData != null) {
          // Convert the list of dynamic to List<UserImage>
          List<User> userImages =
              responseData.map((data) => User.fromJson(data)).toList();
          return userImages;
        } else {
          print("Error: Response body is null or not a valid JSON object");
          throw Exception('Failed to create user3.');
        }
      }
    } catch (error) {
      throw error;
    }
    return [];
  }

  Future<User?>? updateUserPurpose(int? id ,String name) async {
    final response = await http.put(
      Uri.parse(updateUserURL+'$id/$name'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print("API response: ${response.body}");
      return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      print("Error: ${response.statusCode}");
      print("API response: ${response.body}");
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create user.');
    }
  }

  Future<User?>? updateMutlchoice(int? id,String choiceName, List<String> names) async {
  final response = await http.put(
    Uri.parse(updateUserURL + '$choiceName'+'/' +'$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({'names': names}),
  );
  if (response.statusCode == 200 || response.statusCode == 201) {

    print("API response: ${response.body}");
    return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    print("Error: ${response.statusCode}");
    print("API response: ${response.body}");
    throw Exception('Failed to update user.');
  }
}

  Future<Matching?>? matching(int? id, String email, int status) async {
  final response = await http.post(
    Uri.parse(matchingURL + '$id/$email/$status'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200 || response.statusCode == 201) {

    print("API response: ${response.body}");
    return Matching.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    print("Error: ${response.statusCode}");
    print("API response: ${response.body}");
    throw Exception();
  }
}

  Future<Matching?>? dating(int? firstUserId, int? secondUserId, int status) async {
  final response = await http.put(
    Uri.parse(datingURL + '$firstUserId/$secondUserId/$status'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200 || response.statusCode == 201) {

    print("API response: ${response.body}");
    return Matching.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    print("Error: ${response.statusCode}");
    print("API response: ${response.body}");
    throw Exception();
  }
}

}
