// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_music.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMusic _$UserMusicFromJson(Map<String, dynamic> json) => UserMusic(
      id: json['id'] as int?,
      music: json['music'] == null
          ? null
          : Music.fromJson(json['music'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      choose: json['choose'] as bool?,
    );

Map<String, dynamic> _$UserMusicToJson(UserMusic instance) => <String, dynamic>{
      'id': instance.id,
      'music': instance.music?.toJson(),
      'user': instance.user?.toJson(),
      'choose': instance.choose,
    };
