// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hobby.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserHobby _$UserHobbyFromJson(Map<String, dynamic> json) => UserHobby(
      id: json['id'] as int?,
      hobby: json['hobby'] == null
          ? null
          : Hobby.fromJson(json['hobby'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      choose: json['choose'] as bool?,
    );

Map<String, dynamic> _$UserHobbyToJson(UserHobby instance) => <String, dynamic>{
      'id': instance.id,
      'hobby': instance.hobby?.toJson(),
      'user': instance.user?.toJson(),
      'choose': instance.choose,
    };
