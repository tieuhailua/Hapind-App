// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Work _$WorkFromJson(Map<String, dynamic> json) => Work(
      id: json['id'] as int?,
      name: json['name'] as String?,
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$WorkToJson(Work instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'users': instance.users?.map((e) => e.toJson()).toList(),
    };
