// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Music _$MusicFromJson(Map<String, dynamic> json) => Music(
      id: json['id'] as int?,
      name: json['name'] as String?,
      userMusics: (json['userMusics'] as List<dynamic>?)
          ?.map((e) => UserMusic.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$MusicToJson(Music instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userMusics': instance.userMusics?.map((e) => e.toJson()).toList(),
    };
