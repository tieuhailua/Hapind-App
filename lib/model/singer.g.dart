// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Singer _$SingerFromJson(Map<String, dynamic> json) => Singer(
      id: json['id'] as int?,
      name: json['name'] as String?,
      userSingers: (json['userSingers'] as List<dynamic>?)
          ?.map((e) => UserSinger.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$SingerToJson(Singer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userSingers': instance.userSingers?.map((e) => e.toJson()).toList(),
    };
