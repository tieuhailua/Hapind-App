// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hobby.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hobby _$HobbyFromJson(Map<String, dynamic> json) => Hobby(
      id: json['id'] as int?,
      name: json['name'] as String?,
      userHobbies: (json['userHobbies'] as List<dynamic>?)
          ?.map((e) => UserHobby.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$HobbyToJson(Hobby instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userHobbies': instance.userHobbies?.map((e) => e.toJson()).toList(),
    };
