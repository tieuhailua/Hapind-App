import 'dart:convert';

import 'package:hapind/model/block.dart';
import 'package:hapind/model/blog.dart';
import 'package:hapind/model/matching.dart';
import 'package:hapind/model/report.dart';
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
  late String updateUserStatusURL = url + "/api/mobile/updateUserStatus/";
  late String getBlogURL = url + "/api/mobile/getBlog";
  late String getBlockURL = url + "/api/mobile/getBlock/";
  late String getReportURL = url + "/api/mobile/getReport/";
  late String blockURL = url + "/api/mobile/block/";
  late String reportUserURL = url + "/api/mobile/report/";

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

  Future<List<Blog>>? getBlog() async {
    try {
      final response = await http.get(
        Uri.parse(getBlogURL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic>? responseData = jsonDecode(response.body);
        if (responseData != null) {
          // Convert the list of dynamic to List<UserImage>
          List<Blog> userImages =
              responseData.map((data) => Blog.fromJson(data)).toList();
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

  Future<List<Block>>? block(int? id, int? blockedId, int? status) async {
    try {
      final response = await http.get(
        Uri.parse(blockURL + "$id/$blockedId/$status"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic>? responseData = jsonDecode(response.body);
        if (responseData != null) {
          // Convert the list of dynamic to List<UserImage>
          List<Block> userImages =
              responseData.map((data) => Block.fromJson(data)).toList();
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

  Future<List<Block>>? getBlock(int? id) async {
    try {
      final response = await http.get(
        Uri.parse(getBlockURL + "$id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic>? responseData = jsonDecode(response.body);
        if (responseData != null) {
          // Convert the list of dynamic to List<UserImage>
          List<Block> userImages =
              responseData.map((data) => Block.fromJson(data)).toList();
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

  Future<List<Report>>? getReport(int? id) async {
    try {
      final response = await http.get(
        Uri.parse(getReportURL + "$id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic>? responseData = jsonDecode(response.body);
        if (responseData != null) {
          // Convert the list of dynamic to List<UserImage>
          List<Report> userImages =
              responseData.map((data) => Report.fromJson(data)).toList();
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

  Future<Report?>? report(int? reasonId, int? reporterId, int? reportedId,
      String? description, List<String>? evidens) async {
    final Map<String, dynamic> requestBody = {
      "description": description,
      "evidens": evidens,
    };
    final response = await http.post(
      Uri.parse(reportUserURL + '$reasonId/$reporterId/$reportedId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print("API response: ${response.body}");
      return Report.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      print("Error: ${response.statusCode}");
      print("API response: ${response.body}");
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create user.');
    }
  }

  Future<User?>? updateUserPurpose(int? id, String name) async {
    final response = await http.put(
      Uri.parse(updateUserURL + '$id/$name'),
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

  Future<User?>? updateMutlchoice(
      int? id, String choiceName, List<String> names) async {
    final response = await http.put(
      Uri.parse(updateUserURL + '$choiceName' + '/' + '$id'),
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
      return Matching.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      print("Error: ${response.statusCode}");
      print("API response: ${response.body}");
      throw Exception();
    }
  }

  Future<bool?> updateUserStatus(int? id, String status) async {
    try {
      final response = await http.put(
        Uri.parse(updateUserStatusURL + '$id/$status'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
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

  Future<Matching?>? dating(
      int? firstUserId, int? secondUserId, int status) async {
    final response = await http.put(
      Uri.parse(datingURL + '$firstUserId/$secondUserId/$status'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("API response: ${response.body}");
      return Matching.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      print("Error: ${response.statusCode}");
      print("API response: ${response.body}");
      throw Exception();
    }
  }
}
