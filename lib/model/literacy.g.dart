// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'literacy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Literacy _$LiteracyFromJson(Map<String, dynamic> json) => Literacy(
      id: json['id'] as int?,
      name: json['name'] as String?,
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$LiteracyToJson(Literacy instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'users': instance.users?.map((e) => e.toJson()).toList(),
    };
