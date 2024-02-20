import 'dart:convert';
import 'package:hapind/model/user.dart';
import 'package:hapind/model/user_register.dart';
import 'package:http/http.dart' as http;
import 'package:hapind/service/api/base_api.dart';

class SignUpService extends BaseApi {
  late String userUrl = url +"/api" + "/mobile" + "/signUp";
  SignUpService();



  // A function that converts a response body into a List<Photo>.
  List<UserRegister> parseList(String responseBody) {
    final parsed =
        (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();
    print(parsed);
    return parsed.map<UserRegister>((json) =>   UserRegister.fromJson(json)).toList();
  }

  Future<User?>? signUp(UserRegister userRegistration) async {
    final response = await http.post(
      Uri.parse(userUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userRegistration.toMap()),
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
}
