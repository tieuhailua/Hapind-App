// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expecting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Expecting _$ExpectingFromJson(Map<String, dynamic> json) => Expecting(
      id: json['id'] as int?,
      name: json['name'] as String?,
      userExpectings: (json['userExpectings'] as List<dynamic>?)
          ?.map((e) => UserExpecting.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$ExpectingToJson(Expecting instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userExpectings':
          instance.userExpectings?.map((e) => e.toJson()).toList(),
    };
