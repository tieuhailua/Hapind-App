// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smoking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Smoking _$SmokingFromJson(Map<String, dynamic> json) => Smoking(
      id: json['id'] as int?,
      name: json['name'] as String?,
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$SmokingToJson(Smoking instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'users': instance.users?.map((e) => e.toJson()).toList(),
    };
