import 'dart:convert';
import 'dart:io';

import 'package:hapind/model/matching.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/model/user_string.dart';
import 'package:hapind/service/api/base_api.dart';
import 'package:http/http.dart' as http;

class MatchingService extends BaseApi {
  late String getUserUrl = url + "/api/mobile";

  // Future<User>? getUserForMatching(Future<String?>? bearerToken) async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse(getUserUrl + "/getRandomUser"),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization':
  //             'Bearer $bearerToken', // Add Bearer token to the header
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       print("API response: ${response.body}");
  //       // saveUserData(UserToken.fromJson(
  //       //     jsonDecode(response.body) as Map<String, dynamic>));
  //       return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  //       //return User.fromJson(jsonDecode(response.body));

  //       // User user = User.fromJson(jsonDecode(response.body));
  //       // return user;
  //     } else if (response.statusCode == 401) {
  //       print("Error: ${response.statusCode}");
  //       print("API response: ${response.body}");
  //       throw Exception('Failed to create user.');
  //     } else {
  //       throw Exception('Failed to create user.');
  //     }
  //   } catch (error) {
  //     print("Error during HTTP request: $error");
  //     throw Exception('Failed to create user.');
  //   }
  // }

  List<User> parseList(String responseBody) {
    final parsed =
        (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();
    print(parsed);
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  Future<User?> getUserForMatchingByPurpose(int? loginUserId, int minAge,
      int maxAge, int maxDistance, String purpose) async {
    try {
      final response = await http.get(
        Uri.parse(getUserUrl + "/getPurposeUser/$loginUserId/$minAge/$maxAge/$maxDistance/$purpose"),
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

  Future<User?> getUserForMatchingByPet(
      int? loginUserId, int minAge, int maxAge, int maxDistance) async {
    try {
      final response = await http.get(
        Uri.parse(getUserUrl + "/getUserPet/$loginUserId/$minAge/$maxAge/$maxDistance"),
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

  Future<User?> getUserForMatchingByExercise(
      int? loginUserId, int minAge, int maxAge, int maxDistance) async {
    try {
      final response = await http.get(
        Uri.parse(getUserUrl + "/getUserExercise/$loginUserId/$minAge/$maxAge/$maxDistance"),
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

  Future<User?> getUserForMatchingByMusic(
      int? loginUserId, int minAge, int maxAge, int maxDistance) async {
    try {
      final response = await http.get(
        Uri.parse(getUserUrl + "/getUserMusic/$loginUserId/$minAge/$maxAge/$maxDistance"),
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

  Future<User?> getUserForMatchingByOnline(
      int? loginUserId, int minAge, int maxAge, int maxDistance) async {
    try {
      final response = await http.get(
        Uri.parse(getUserUrl + "/getOnlineUser/$loginUserId/$minAge/$maxAge/$maxDistance"),
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

  Future<User?> getUserForMatching(
      int? loginUserId, int minAge, int maxAge, int maxDistance) async {
    try {
      //final String? token = await bearerToken;
      //if (token != null) {
      final response = await http.get(
        Uri.parse(getUserUrl +
            "/getRandomUser/$loginUserId/$minAge/$maxAge/$maxDistance"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          //'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic>? responseData = jsonDecode(response.body);
        print("API response: ${response.body}");

        if (responseData != null) {
          print(User.fromJson(jsonDecode(response.body)));
          //return User.fromJson(response.body);
          //return parseList(response.body);
          return User.fromJson(jsonDecode(response.body));
        } else {
          print("Error: Response body is null or not a valid JSON object");
          throw Exception('Failed to create user3.');
        }
      } else {
        print("Error: ${response.statusCode}");
        print("API response: ${response.body}");
        throw Exception('Failed to create user2.');
      }
      // } else {
      //   // Handle the case where the token is null (perhaps return null or throw an error)
      //   throw Exception();
      // }
    } catch (error) {
      if (error is FormatException) {
        print("Unexpected 1: $error");
        throw error;
        // Handle format-related errors
      } else if (error is HttpException) {
        print("Unexpected 2: $error");
        throw error;
        // Handle HTTP-related errors
      } else if (error is SocketException) {
        print("Unexpected 3: $error");
        // Handle socket-related errors
        throw error;
      } else {
        print("Unexpected 4: $error");
        // Handle other types of errors or rethrow if needed
        throw error;
      }
    }
  }

  Future<List<String>> getUserImageById(int id) async {
    try {
      final response = await http.get(
        Uri.parse(getUserUrl + "/getUserImageById/{$id}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic>? responseData = jsonDecode(response.body);
        print("API response: ${response.body}");

        if (responseData != null) {
          print(Matching.fromJson(jsonDecode(response.body)));
          //return User.fromJson(response.body);
          //return parseList(response.body);
          //return List<String>.fromJson(jsonDecode(response.body));
          throw Exception('Failed to create user3.');
        } else {
          print("Error: Response body is null or not a valid JSON object");
          throw Exception('Failed to create user3.');
        }
      } else {
        print("Error: ${response.statusCode}");
        print("API response: ${response.body}");
        throw Exception('Failed to create user2.');
      }
    } catch (error) {
      if (error is FormatException) {
        print("Unexpected 1: $error");

        throw error;
        // Handle format-related errors
      } else if (error is HttpException) {
        print("Unexpected 2: $error");
        throw error;
        // Handle HTTP-related errors
      } else if (error is SocketException) {
        print("Unexpected 3: $error");
        // Handle socket-related errors
        throw error;
      } else {
        print("Unexpected 4: $error");
        // Handle other types of errors or rethrow if needed
        throw error;
      }
    }
  }
}
