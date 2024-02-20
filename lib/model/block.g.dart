// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Block _$BlockFromJson(Map<String, dynamic> json) => Block(
      id: json['id'] as int?,
      userByBlockedId: json['userByBlockedId'] == null
          ? null
          : User.fromJson(json['userByBlockedId'] as Map<String, dynamic>),
      userByUseId: json['userByUseId'] == null
          ? null
          : User.fromJson(json['userByUseId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BlockToJson(Block instance) => <String, dynamic>{
      'id': instance.id,
      'userByBlockedId': instance.userByBlockedId?.toJson(),
      'userByUseId': instance.userByUseId?.toJson(),
    };
