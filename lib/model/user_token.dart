import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class UserToken {
  int id;
  String username;
  String roles;
  String tokenType;
  String accessToken;

  UserToken({
    required this.id,
    required this.username,
    required this.roles,
    required this.tokenType,
    required this.accessToken,
  });

  factory UserToken.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'username': String username,
        'roles': String roles,
        'tokenType': String tokenType,
        'accessToken': String accessToken,
      } =>
        UserToken(
          id: id,
          username: username,
          roles: roles,
          tokenType: tokenType,
          accessToken: accessToken,
        ),
      _ => throw const FormatException('Failed to load User.'),
    };
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'roles': roles,
      'tokenType': tokenType,
      'accessToken': accessToken,
    };
  }

  static Map<String, dynamic> toMap(UserToken model) => <String, dynamic>{
        'id': model.id,
        'username': model.username,
        'roles': model.roles,
        'tokenType': model.tokenType,
        'accessToken': model.accessToken,
      };

  static String serialize(UserToken model) =>
      json.encode(UserToken.toMap(model));

  static UserToken deserialize(String json) =>
      UserToken.fromJson(jsonDecode(json));
}
