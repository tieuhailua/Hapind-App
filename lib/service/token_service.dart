import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/model/user_token.dart';

class TokenService {
  final storage = const FlutterSecureStorage();

  Future<void> saveUserTokenData(UserToken userToken) async {
    await storage.write(key: 'data', value: UserToken.serialize(userToken));
  }

  Future<void> storeUserId(int id) async {
    await storage.write(key: 'userId', value: id.toString());
  }

  Future<void> setStoredDistance(String id) async {
    await storage.write(key: 'distance', value: id.toString());
  }
  Future<void> setStoredMinAge(String id) async {
    await storage.write(key: 'minAge', value: id.toString());
  }
  Future<void> setStoredMaxAge(String id) async {
    await storage.write(key: 'maxAge', value: id.toString());
  }

  Future<void> storeUserEmail(String email) async {
    await storage.write(key: 'email', value: email.toString());
  }

  Future<int?> getStoredUserId() async {
    String? idString = await storage.read(key: 'userId');
    return idString != null ? int.tryParse(idString) : null;
  }

  Future<int?> getStoredMinAge() async {
    String? idString = await storage.read(key: 'minAge');
    return idString != null ? int.tryParse(idString) : null;
  }

  Future<int?> getStoredMaxAge() async {
    String? idString = await storage.read(key: 'maxAge');
    return idString != null ? int.tryParse(idString) : null;
  }

  Future<int?> getStoredDistance() async {
    String? idString = await storage.read(key: 'distance');
    return idString != null ? int.tryParse(idString) : null;
  }

  Future<String?> getStoredUserEmail() async {
    String? idString = await storage.read(key: 'email');
    return idString != null ? idString : null;
  }

  

  Future<void> clearUserId() async {
    await storage.delete(key: 'userId');
  }
  
  Future<void> saveUserData(User? user) async {
    String userJson = json.encode(user?.toJson());
    await storage.write(key: 'user_data', value: userJson);
  }

  Future<User?> getUserData() async {
    String? userJson = await storage.read(key: 'user_data');
    if (userJson != null) {
      Map<String, dynamic> userMap = json.decode(userJson);
      return User.fromJson(userMap);
    }
    return null;
  }

  Future<void> clearUserData() async {
    await storage.delete(key: 'user_data');
  }

  
  Future<void> clearUserEmail() async {
    await storage.delete(key: 'email');
  }
  // Future<Map<String, String?>> readUserData() async {
  //   return await storage.readAll();
  // }

  Future<String?> readAccessToken() async {
    final Map<String, String?> userDataMap = await storage.readAll();

    // Extract accessToken from userDataMap
    final String? accessToken = userDataMap['accessToken'];

    return accessToken;
  }

  // Future<int?> readUserId() async {
  //   final Map<String, String?> userDataMap = await storage.readAll();

  //   // Extract accessToken from userDataMap
  //   final int? id = userDataMap['id'] as int?;

  //   return id;
  // }

  Future<int?> readUserId() async {
  final Map<String, String?> userDataMap = await storage.readAll();

  // Extract userId from userDataMap
  final String? idString = userDataMap['id'];
  
  // Convert idString to int
  final int? id = idString != null ? int.tryParse(idString) : null;

  return id;
}





  Future<UserToken?> readUserData() async {
    final Map<String, String?> userDataMap = await storage.readAll();

    // Extract accessToken from userDataMap
    final String? accessToken = userDataMap['accessToken'];

    if (accessToken != null) {
      // If accessToken is present, return a UserToken object
      return UserToken(
        id: int.parse(userDataMap['id'] ?? '0'),
        username: userDataMap['username'] ?? '',
        roles: userDataMap['roles'] ?? '',
        tokenType: userDataMap['tokenType'] ?? '',
        accessToken: accessToken,
      );
    } else {
      // If accessToken is not present, return null or handle accordingly
      return null;
    }
  }
  Future<void> clearUserTokenData() async {
    await storage.deleteAll();
  }

}
