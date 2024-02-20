// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drinking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drinking _$DrinkingFromJson(Map<String, dynamic> json) => Drinking(
      id: json['id'] as int?,
      name: json['name'] as String?,
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$DrinkingToJson(Drinking instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'users': instance.users?.map((e) => e.toJson()).toList(),
    };
