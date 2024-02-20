// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_singer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSinger _$UserSingerFromJson(Map<String, dynamic> json) => UserSinger(
      id: json['id'] as int?,
      singer: json['singer'] == null
          ? null
          : Singer.fromJson(json['singer'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      choose: json['choose'] as bool?,
    );

Map<String, dynamic> _$UserSingerToJson(UserSinger instance) =>
    <String, dynamic>{
      'id': instance.id,
      'singer': instance.singer?.toJson(),
      'user': instance.user?.toJson(),
      'choose': instance.choose,
    };
