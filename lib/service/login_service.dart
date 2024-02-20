import 'dart:convert';
import 'package:hapind/model/user.dart';
import 'package:hapind/model/user_login.dart';
import 'package:hapind/model/user_token.dart';
import 'package:hapind/service/api/base_api.dart';
import 'package:hapind/service/token_service.dart';
import 'package:http/http.dart' as http;

class LoginService extends BaseApi {
  late String logiByEmailnUrl = url + "/api/auth/emailLogin";
  late String checkUserUrl = url + "/api/mobile/getUser/";
  late String checkOldPasswodUrl = url + "/api/auth/checkOldPassword/";
  late String checkAccountExitsUrl = url + "/api/auth/checkAccountExits/";
  late String checkIsOnlineUrl = url + "/api/auth/checkIsOnline/";
  late String getUserUrl = url + "/api/mobile/getCurrentUser/";
  late String resetPasswordUrl = url + "/api/mobile/resetPassword";

  LoginService();

  Future<String?>? checkAccountExits(String? username) async {
    try {
      final response = await http.get(
        Uri.parse('$checkAccountExitsUrl${username}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        return null;
      } else {
        return response.body;
      }
    } catch (error) {
      return null;
    }
  }

  Future<void> isOnline(int? id, int onl) async {
    try {
      await http.put(
        Uri.parse('$checkIsOnlineUrl${id}/${onl}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // if (response.statusCode == 200) {
      //   return null;
      // } else {
      //   return response.body;
      // }
    } catch (error) {
      return null;
    }
  }

  Future<String?>? checkOldPassword(int? id, String? oldPassword) async {
    try {
      final response = await http.get(
        Uri.parse('$checkOldPasswodUrl$id?oldPassword=$oldPassword'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        return null;
      } else {
        return response.body;
      }
    } catch (error) {
      return null;
    }
  }

  Future<UserToken?>? loginByEmail(String email, String password) async {
    try {
      UserLogin userLogin = UserLogin(email: email, password: password);

      final response = await http.post(
        Uri.parse(logiByEmailnUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userLogin.toJson()),
      );
      if (response.statusCode == 200) {
        print("API response: ${response.body}");
        //jsonDecode(response.body) as Map<String, dynamic>);
        return UserToken.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        print("Error: ${response.statusCode}");
        print("API response: ${response.body}");
        return null;
      }
    } catch (error) {
      print("Error during HTTP request: $error");
      return null;
    }
  }

  Future<User?> getUser(int? id) async {
    try {
      final response = await http.get(
        Uri.parse(getUserUrl + "$id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic>? responseData = jsonDecode(response.body);
        if (responseData != null) {
          print(User.fromJson(jsonDecode(response.body)));
          return User.fromJson(jsonDecode(response.body));
        } else {
          print("Error: Response body is null or not a valid JSON object");
          throw Exception('Failed to create user3.');
        }
      }
    } catch (error) {
      throw error;
    }
    return null;
  }

  Future<bool?> resetPassword(String? email, String? newPassword) async {
    try {
      final response = await http.put(
        Uri.parse(resetPasswordUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'email': email, 'newPassword': newPassword}),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (error) {
      // Handle the error appropriately, e.g., log it.
      print(error);
    }
    return false;
  }

  Future<bool?> resetPasswordById(int? id, String? newPassword) async {
    try {
      final response = await http.put(
        Uri.parse(resetPasswordUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'id': id, 'newPassword': newPassword}),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (error) {
      // Handle the error appropriately, e.g., log it.
      print(error);
    }
    return false;
  }

  Future<String>? checkUser(int? id, String? bearerToken) async {
    try {
      final response = await http.get(
        Uri.parse('$checkUserUrl${id ?? ""}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer $bearerToken', // Add Bearer token to the header
        },
      );
      if (response.statusCode == 200) {
        print("API response: ${response.body}");
        // saveUserData(UserToken.fromJson(
        //     jsonDecode(response.body) as Map<String, dynamic>));
        return "Succ";
      } else if (response.statusCode == 403) {
        print("Error: ${response.statusCode}");
        print("API response: ${response.body}");
        return response.body;
      } else {
        return "Bu";
      }
    } catch (error) {
      print("Error during HTTP request: $error");
      return "Bu";
    }
  }
}
